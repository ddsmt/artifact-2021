#!/bin/bash

set -e

OUT_DIR="$1"

[ -z "$OUT_DIR" ] && OUT_DIR="out"
[ ! -d "$OUT_DIR" ] && "Output directory '$OUT_DIR' does not exist yet. Please run ./benchmark.py" && exit 1

mkdir -p pdf/data

cp "$OUT_DIR/scatter-ddmin-hierarchical-size.data" pdf/data/
cp "$OUT_DIR/scatter-hybrid-best-size.data" pdf/data/
cp "$OUT_DIR/scatter-master-hybrid-size.data" pdf/data/
cp "$OUT_DIR/scatter-ddmin-hierarchical-time.data" pdf/data/
cp "$OUT_DIR/scatter-hybrid-best-time.data" pdf/data/
cp "$OUT_DIR/scatter-master-hybrid-time.data" pdf/data/
cp "$OUT_DIR/table-overview.tex" pdf/

cd pdf/
pdflatex results.tex
