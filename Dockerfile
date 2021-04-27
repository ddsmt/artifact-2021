FROM ubuntu:20.04

# Install dependencies to run ddSMT
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install -q \
    python3 \
    python3-pip

# Install Python dependencies required by ddSMT
RUN pip3 install progressbar
RUN pip3 install jinja2

# Install dependencies to compile solvers and delta debuggers
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install -q \
    automake \
    autotools-dev \
    build-essential \
    cmake \
    default-jre \
    git \
    gperf \
    libboost-dev \
    libboost-program-options-dev \
    libgmp-dev \
    python3-dev \
    python3-distutils \
    wget

# Install Python dependencies required by solvers
RUN pip3 install toml

RUN useradd -ms /bin/bash ddsmt
WORKDIR /home/ddsmt

# Copy artifact files
COPY benchmark.py .
COPY database.json .
COPY database_demo.json .
COPY bin/ bin/
COPY inputs/ inputs/
COPY results.py .
COPY stuff/ stuff/
COPY paper_results/ paper_results/

RUN chown ddsmt:ddsmt -R /home/ddsmt
USER ddsmt

# Download and set up delta debuggers. If bin/ is not copied it will also build
# the majority of solver binaries from source. This will take ~3h on an eight
# core machine.
RUN ./benchmark.py --build-only
