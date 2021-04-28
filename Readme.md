# CAV'21 Artifact: ddSMT 2.0: Better Delta Debugging for the SMT-LIBv2 Language and Friends

**Gereon Kremer, Aina Niemetz, Mathias Preiner (Stanford University)**

This artifact contains the log files and data to replicate the experiments in
the paper "ddSMT 2.0: Better Delta Debugging for the SMT-LIBv2 Language and
Friends" accepted to CAV'21.

# Functional Badge

This section discusses how to reproduce the experimental results shown in the paper.

## Quickstart

* Install Docker as described at https://docs.docker.com/get-docker/.
* Download the Docker image.
* Start the docker image:

    ```
    $ docker load --input ddsmt-artifact-2021.tar.xz
    $ docker run -v <local directory>:/home/ddsmt/mount -it ddsmt-artifact-2021 /bin/bash
    ```

    **Note**: The artifact will generate PDFs that cannot be properly viewed
    inside the container. Hence, `-v <local directory>:/home/ddsmt/mount`
    specifies a mount point that can be used to copy files from the container
    to a local directory `<local directory>` on the host machine. Copying
    files in the container to `/home/ddsmt/mount` will make the files
    accessible on the host machine at location `<local directory>`.

* Run all or only a few of the benchmarks using `./benchmarks.py` and analyze
  the results with `./results.py` (check the rest of this section for more
  details).

## Artifact Directory Structure

### Files

* `benchmark.py`: Python script to prepare and perform benchmark runs. This
  includes building specific solver versions if necessary and preparing utility
  files for submitting the benchmarks run to a Slurm HPC cluster.
* `database.json`: A json file that contains necessary information about all
  benchmark instances, including solver versions and instructions on the error
  condition.
* `database_demo.json`: Subset of `database.json` used when option `--demo` is
  enabled.
* `results.py`: Python script to parse, collect and evaluate benchmark runs.
* `Readme.md`: This file.
* `make-pdf.sh`: Script to generate results PDF.

### Directories

* `bin/`: Contains pre-compiled binaries of all required solver versions.
* `build/`: Contains the source code of the checked out delta debugging tools
  and solvers.
* `inputs/`: Contains the actual input files.
* `out/`: Contains the results of benchmark runs.
* `pdf/`: Contains LaTeX templates to generate the scatter plots and table
          presented in the paper.
* `slurm/`: Generated by `benchmark.py` and contains utility files in case
  benchmark runs are submitted to Slurm.
* `stuff/` Contains utility files like patches, helper scripts, e.g., to detect
  error conditions like unsoundness, or templates for result files.
* `out_ae/`: Log files and results used for the experiments in the paper. Please
  refer to the "Run Benchmarks" section for the description of the directory
  structure.

### Structure of `database.json`

TODO: provide a database.json file for a representative set of inputs and add
option to `benchmark.py` to provide custom database.json?

The benchmark database is a json dictionary that maps a filename (of a file
that resides in `inputs/`) to a dictionary with further information.

For each input, it specifies:

* the solver (e.g. as filename `"binary": "boolector0"` or as a commit hash
  `"cvc4-commit": "9f372f0"`, sometimes with further build instructions like
  `"yices-mode": "debug"`)
* optional solver arguments
  (e.g. `"args": ["--mcsat"]` or `"args": ["--strings-exp", "-i"]`)
* the nature of the error condition
  (e.g. `"match": "incorrect"`, `"match": "exitcode"` or `"match": "stderr"`)
  and details about how to identify it if necessary
  (e.g. `"stderr": "d_modelBuiltSuccess"` or
  `"stdout": "constructBestConditional"`)

With this information, it is possible to reproduce the error for every
benchmark instance: obtain or build the solver binary, run it (with the given
arguments) and identify the error condition.

## Steps to Reproduce the Experimental Results

Reproducing the full set of experimental results takes a considerable amount of
time. The eight delta debugging tools with 244 benchmarks amount to a total of
1952 benchmark runs, of which 627 timeout after an hour.
Our experiments required a total of **773 CPU hours**.

**Note**: The experiments in the paper include three confidential benchmarks
that we are not allowed to include in this artifact. Therefore, the `inputs/`
directory contains 241 files instead of the 244 files reported in the paper.

If you want to perform a full benchmark run, we strongly suggest to use some
kind of parallel batch processing system. Our script supports Slurm out of the
box, however, adapting it to another system might require some work.
If a parallel batch processing system is used, modify the
Slurm configuration in `benchmark.py` as necessary
(check the `submit_slurm_job()` function).

### 1. Run Benchmarks

By default, `benchmark.py` uses eight CPU cores for compiling solver and
debugger binaries and it runs the experiments locally (i.e., not using Slurm).
If you want to change this behavior you can modify variables `COMPILE_JOBS` and
`SUBMIT_TO_SLURM` in `benchmark.py` (lines 14-17) based on your hardware setup.

**Note**: The artifact comes with all solver binaries and debugging tools
pre-compiled and there is no need to compile the tools from source.
`benchmark.py` will automatically use the pre-compiled binaries from `bin/` and
`build/`.

Since running all experiments takes at least 773 CPU hours to complete we
prepared a smaller set that will finish in ~30min (tested on an eight core
machine):

```
./benchmark.py --demo
```

The script iterates over all enabled delta debuggers and selected input files.
For every such pair, it makes sure the solver binary exists in `bin/` (and
builds it on the fly if it does not, but knows how to build it) and then runs
the delta debugger with the configuration from `database.json`.

The results are stored in `out/`. For every input file `<input>` and delta
debugger `<tool>` the following files are generated:
* `out/<tool>/<input>`: The minimized version of the original input.
* `out/<tool>/<input>.log`: The combined output of the delta debugger.
* `out/<tool>/<input>.time`: Contains the overall running time after the delta
  debugger has terminated.

If run with Slurm, there are additionally
* `out/<tool>/<input>.err`: The output on standard err of Slurm.
* `out/<tool>/<input>.out`: The output on standard out of Slurm.

**Note**: The log files used for the experiments in the paper are available in
directory `out_ae/`.


#### Additional Run Options

- If you want to run all experiments, simply call the script:

    ```
    ./benchmark.py
    ```

- If you only want to run a subset, you can restrict the run to a single delta
  debugger with `-d <name of the delta debugger>` or only select certain inputs
  with `-f <pattern of input files>`. Please check `./benchmark.py --help` for
  the list of delta debugger names.

    ```
    ./benchmark.py -d ddsmt-paper-hybrid -f issue5
    ```

### 2. Analyzing the Results

While it is often very instructive to have a look at individual examples,
getting comprehensive results quickly becomes infeasible. We thus include the
script `results.py` to analyze all available output files and generate the
results included in the paper.

By default, `results.py` locally runs solvers on the minimized inputs to perform
some sanity checks on the result files.
If enabled, `results.py` calls into `benchmark.py` to obtain the solver binary
(and build it on the fly, if necessary).

The script first loads all relevant information about the input files and the
solver output into a SQLite database. Then, it queries this database to
generate the result files shown in the paper.
This approach allows to easily perform other, manual analysis on the data.

For analyzing the `--demo` benchmark set, run `results.py` as follows:

```
./results.py --demo
```

A few errors and warnings in the output are to be expected, they should
correspond to the errors shown in the table in the paper.

The script creates the following files:
* `out/db.db` is the SQLite database that can be opened with another script or
  tools like `sqlitebrowser` to further inspect the results. Check
  `ResultLoader.__setup_database()` for the database schema definition.
* `out/table-complete.tex` is a complete (multi-page) table of all results.
* `out/table-overview.tex` is a condensed table as shown in the paper.
* `out/scatter-*.data` containing the gnuplot data for the various scatter plot
  comparisons.


For comparison against the paper results in `out_ae/` you can analyze the data
for the `--demo` subset as follows:
```
./results.py --demo --dir out_ae/
```

**Note**: This will generate the necessary files in `out_ae/` instead of `out/`.


#### Additional Analyze Options

- For analyzing the results of a full run simply call:
    ```
    ./results.py
    ```

    **Note**: Analyzing a full run will take ~4min.

- For analyzing the results given in `out_ae/` run:
    ```
    ./results.py --dir out_ae/
    ```

    **Note**: This will generate the files in `out_ae/` instead of `out/`.


#### Implementation Details on `results.py`

The script roughly proceeds as follows:
* `load_data()` loads all data into the database.
  * `ResultLoader` manages the loading process
  * `load_inputs()` opens the `database.json` file and stores the file size. By
    default, it also records the original exit code (can be disabled with
    `--no-load-times`).
  * `load_solver(solver)` parses the solver output for all files in the
    database and tries to recognize and categorizes all unexpected results.
    These include empty log files, parser errors (mostly `ddsmt-master`),
    runtime errors (segfaults, assertions, uncaught exceptions), timeouts,
    empty output file (usually due to slow IO during a timeout), output file
    does not actually trigger the same error condition.
  * Every result is put into a SQLite database where `time` encodes the status:
    `-1` is a parser error, `-2` a runtime error, `-3` an incorrect output,
    `-4` a timeout, `-5` an aborted run and a positive number the running time
    of a proper benchmark run.
* `do_analysis()` now queries the data in the SQLite database to produce tables
  and data for scatter plots.
  * `render_to_file(file, tpl, data)` loads a template file from `tpl`, renders
    it using `Jinja2` with `data` as arguments and write the result to `file`.
    It is used to generate LaTeX tables.
  * `get_all_results()` returns a full list of results for all files and all
    solvers in the database.
  * `get_overview_results()` returns a selection of statistical data points
    from the results that is shown in the paper.
  * `scatter(sizefile, timefile, solverA, solverB)` generates gnuplot data for
    two scatter plots that compare `solverA` and `solverB`. The first compares
    them using the output size of each file and writes the data to `sizefile`,
    the second uses the running time and writes the data to `timefile`.
  * `scatter_best(sizefile, timefile, solverA, solvers)` does the same as
    `scatter()`, but uses the virtual best of `solvers` for `solverB` for every
    file.


### 3. Visualizing the Results

After `results.py` finished you can generate a PDF with the scatter plots and
the overview table included in the paper as follows:

```
./make-pdf.sh
```

This will generate the PDF `pdf/results.pdf`, which can now be copied to
`/home/ddsmt/mount` in order to view the generated PDF on the host machine.


To visualize the results after calling `./results.py --demo --dir out_ae/` call:

```
./make-pdf.sh out_ae/
```

This will generate the PDF `pdf/results.pdf` for the demo subset with the log
files and data used in the paper.



### ddSMT 2.0 Source Code

ddSMT is free software released under the GPLv3.

The source code of ddSMT 2.0 is included in the artifact and can be found in
`build/ddsmt-paper/`. The artifact Docker image has `less` pre-installed, which
can be used to view the source files.
The source code is also available on GitHub (https://github.com/ddsmt/ddSMT).

The source files of ddSMT are located in the `ddsmt` subdirectory.
The code for the `ddmin` strategy can be found in `strategy_ddmin.py` and the
`hierarchical` strategy is implemented in `strategy_hierarchical.py`.
Mutators to simplify input formulas are implemented in
`mutators_{arithmetic,boolean,bv,core,fp,smtlib,strings}.py`.
The main function of ddSMT `ddsmt_main` is located in `cli.py`.

ddSMT provides a comprehensive documentation on the implemented strategies as
well as mutators here:
https://ddsmt.readthedocs.io/en/master/guide.html


# Available Badge

The artifact was uploaded to Zenodo and is available at
https://zenodo.org/record/4721925
(DOI: `10.5281/zenodo.4721925`).

# Reusable Badge

## Building the Docker Image

- Install Docker as described at https://docs.docker.com/get-docker/.

- The experimental setup (described above for the functional badge) can be
  obtained from https://github.com/ddsmt/artifact-2021.

  ```
  git clone https://github.com/ddsmt/artifact-2021
  ```

- Build the docker image
  ```
  cd artifact-2021
  docker build -t ddsmt-artifact-2021 .
  ```

  **Note**: This will also build all missing solver binaries from source, which
            takes ~3h on an eight core machine.

- Use docker image as described in the "Functional Badge" section.

**Note**: The provided `Dockerfile` lists all dependencies required to set up
          the artifact without a Docker environment.

## Using ddSMT without Docker Environment

ddSMT 2.0 can be either downloaded from https://github.com/ddsmt/ddSMT or
installed via pip:
```
pip3 install ddsmt
```

**Note**: The development of ddSMT has continued in the meantime and the
experiments in the paper have been conducted with the version of ddSMT 2.0 from
the time of submitting the paper (commit hash c9d8100). The above command will
install the latest stable version of ddSMT.

Further installation instructions can be found at
https://ddsmt.readthedocs.io/en/master/installation.html

To check if ddSMT was installed successfully try:
```
ddsmt --version
```

This should print the currently installed version of ddSMT, e.g.:
```
$ ddsmt --version
2.0.1
```


### Documentation

ddSMT 2.0 is meant to work on SMT-LIBv2 and similar inputs (including custom
extensions of SMT-LIBv2 and derived formats like SyGuS) but should work on all
formats based on SMT-LIBv2-style S-expressions.

Extensive documentation on how to use ddSMT 2.0 is available online at
https://ddsmt.readthedocs.io/.

Some useful links:
- Installation instructions: https://ddsmt.readthedocs.io/en/master/installation.html
- Quickstart guide: https://ddsmt.readthedocs.io/en/master/quickstart.html
- How to run: https://ddsmt.readthedocs.io/en/master/quickstart.html#how-to-run-ddsmt
- List of available command-line options: https://ddsmt.readthedocs.io/en/master/quickstart.html#full-option-listing


## Using ddSMT with New Inputs

The ddSMT artifact repository provides a new binary and input that was not used
in the experiments at
https://github.com/ddsmt/artifact-2021/tree/master/example

Download the `bitwuzla` binary and the `murxla-dd-murxla-3319538980.smt2` input
from https://github.com/ddsmt/artifact-2021/tree/master/example.

Make sure to make the binary executable:
```
chmod +x bitwuzla
```

Executing `bitwuzla` on `murxla-dd-murxla-3319538980.smt2` will produce the
following error:

```
$ bitwuzla murxla-dd-murxla-3319538980.smt2
bitwuzla: /home/an/git/dev/bitwuzla/src/bzladbg.c:603: bzla_dbg_precond_apply_exp: Assertion `bzla_sort_fun_get_domain(bzla, bzla_node_get_sort_id(fun)) == bzla_node_get_sort_id(args)' failed.
[bitwuzla>main] CAUGHT SIGNAL 6
unknown
Aborted (core dumped)
```

You can minimize the input file with ddSMT as follows:

```
ddsmt murxla-dd-murxla-3319538980.smt2 output.smt2 bitwuzla
```

The minimized file will be saved as `output.smt2`.

ddSMT is able to minimize the input file `murxla-dd-murxla-3319538980.smt2`
to 1.3% of the original file size.
To confirm that the minimized file still triggers the original behavior call:

```
./bitwuzla output.smt2
```
