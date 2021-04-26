FROM ubuntu:20.04

# Install dependencies to run ddSMT
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install -q \
    python3

# Install dependencies to compile solvers and delta debuggers
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install -q \
    automake \
    autotools-dev \
    build-essential \
    cmake \
    git \
    libgmp-dev \
    libboost-dev \
    libboost-program-options-dev \
    python3-distutils \
    python3-dev \
    wget

RUN useradd -ms /bin/bash ddsmt
WORKDIR /home/ddsmt

# Copy artifact files
COPY benchmark.py .
COPY bin/ bin/
COPY database.json .
COPY inputs/ inputs/
COPY results.py .
COPY stuff/ stuff/
COPY bin/ bin/

RUN chown ddsmt:ddsmt -R /home/ddsmt
USER ddsmt

RUN ./benchmark.py --build-only
