# CAV'21 Artifact: ddSMT 2.0: Better Delta Debugging for the SMT-LIBv2 Language and Friends
Gereon Kremer, Aina Niemetz, Mathias Preiner
Stanford University

This artifact contains the log files and data to replicate the experiments in
the paper "ddSMT 2.0: Better Delta Debugging for the SMT-LIBv2 Language and Friends" accepted to CAV'21.

## Artifact Directory Structure

### Files

* `benchmark.py`: Python script to prepare and perform benchmark runs. This includes building specific solver versions if necessary and preparing utility files for submitting the benchmarks run to a Slurm HPC cluster.
* `database.json`: A json file that contains necessary information about all benchmark instances, including solver versions and instructions on the error condition.
* `results.py`: Python script to parse, collect and evaluate benchmark runs.

### Directories

* `bin/`: Contains binaries of all solver versions.
* `build/`: Contains checkouts of delta debugging tools and solvers.
* `inputs/`: Contains the actual input files.
* `out/`: Contains the results of benchmark runs.
* `slurm/`: Contains utility files in case benchmark runs are submitted to Slurm.
* `stuff/` Contains utility files like patches, helper scripts, e.g., to detect error conditions like unsoundness, or templates for result files.

### Structure of `database.json`

The benchmark database is a json dictionary that maps a filename (of a file that resides in `inputs/`) to a dictionary with further information. For each input, we specify
* the solver (e.g. as filename `"binary": "boolector0"` or as a commit hash `"cvc4-commit": "9f372f0"`, sometimes with further build instructions like `"yices-mode": "debug"`),
* optionally solver arguments (e.g. `"args": ["--mcsat"]` or `"args": ["--strings-exp", "-i"]`),
* the nature of the error condition (e.g. `"match": "incorrect"`, `"match": "exitcode"` or `"match": "stderr"`) and details about how to identify it if necessary (e.g. `"stderr": "d_modelBuiltSuccess"` or `"stdout": "constructBestConditional"`)

With this information, it should be possible to reproduce the error for every benchmark instance: obtain or build the solver binary, run it (with the given arguments) and identify the error condition.

## Steps to reproduce the experimental results

Reproducing the full set of experimental results takes a considerable amount of time. The eight delta debugging tools with 244 benchmarks amount to a total of 1952 benchmark runs, of which 627 timeout after an hour.
Our runs required a total of 773 CPU hours.

Also note that the experiments shown in the paper contain a total of three confidential benchmarks that we can not include in this artifact. Therefore, the `inputs/` folder only contains 241 files while the results in the paper list 244 files.

If you want to perform a full benchmark run, we strongly suggest to use some kind of parallel batch processing system. Our script supports Slurm out of the box, adapting it to another system might require some work.
In any case, you should check modify the Slurm configuration (check the `submit_slurm_job()` function in `benchmark.py`) as necessary.

### Run benchmarks

First change the settings in `benchmark.py` (lines 14 - 19) according to your wishes. By default, it uses eight CPU cores for compilation and delta debugging and runs the benchmarks locally (i.e. not using Slurm).

If you want to perform a full benchmark run, simply call the script:
```
./benchmark.py
```
If you only want to run a subset, you can restrict the run to a single delta debugger with `-d <name of the delta debugger>` or only select certain inputs with `-f <pattern of input files>`. Please check `./benchmark.py --help` for the list of delta debugger names.
```
./benchmark.py -d ddsmt-dev-hybrid -f issue5
```

The script then iterates over all enabled delta debuggers and selected input files. For every such pair, it makes sure the solver binary exists in `bin/` (and builds it on the fly if it does not, but knows how to build it) and then runs the delta debugger with the configuration from `database.json`.

The results are stored in `out/`. For every input file `<input>` and delta debugger `<tool>` the following files are generated:
* `out/<tool>/<input>`: The minimized version of the original input.
* `out/<tool>/<input>.log`: The combined output of the delta debugger.
* `out/<tool>/<input>.time`: Contains the overall running time after the delta debugger has terminated.

If run with Slurm, there are additionally
* `out/<tool>/<input>.err`: The output on standard err of Slurm.
* `out/<tool>/<input>.out`: The output on standard out of Slurm.

### Collect results

While it is often very instructive to have a look at individual examples, getting comprehensive results quickly becomes infeasible. We thus include `results.py` to analyze all available output files and generate the results included in the paper.

By default, the variable `LOAD_TIMES` is set to true. This allows the script to locally run solvers on the minimized inputs to perform some sanity checks on the result files. If enabled, `results.py` calls into `benchmark.py` to obtain the solver binary (and build it on the fly, if necessary).

The script first loads all relevant information about the input files and the solver output into a SQLite database. Then, it queries this database to generate the result files shown in the paper.
This approach allows to easily perform other, manual analysis on the data.

The script roughly proceeds as follows:
* `load_data()` loads all data into the database.
  * `ResultLoader` manages the loading process
  * `load_inputs()` opens the `database.json` file and stores the file size. If `LOAD_TIMES == True`, it also records the original exit code.
  * `load_solver(solver)` parses the solver output for all files in the database and tries to recognize and categorizes all unexpected results. These include empty log files, parser errors (mostly `ddsmt-master`), runtime errors (segfaults, assertions, uncaught exceptions), timeouts, empty output file (usually due to slow IO during a timeout), output file does not actually trigger the same error condition.
  * Every result is put into a SQLite database where `time` encodes the status: `-1` is a parser error, `-2` a runtime error, `-3` an incorrect output, `-4` a timeout, `-5` an aborted run and a positive number the running time of a proper benchmark run.