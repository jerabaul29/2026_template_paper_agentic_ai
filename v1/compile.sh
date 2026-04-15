#!/bin/bash
# Compile the LaTeX manuscript (pdflatex + bibtex cycle).
# All output is logged to compile.log (overwritten each run).
# Exit code is non-zero if any step fails.
# Safe to run from any directory — always operates relative to the script location.

set -euo pipefail

cd "$(dirname "$0")"

LOG=compile.log

run() {
    echo "=== $* ===" | tee -a "$LOG"
    "$@" 2>&1 | tee -a "$LOG"
}

> "$LOG"   # truncate / create log file

run timeout 20 pdflatex -interaction=nonstopmode -halt-on-error main.tex
run timeout 20 bibtex main.aux
run timeout 20 pdflatex -interaction=nonstopmode -halt-on-error main.tex
run timeout 20 pdflatex -interaction=nonstopmode -halt-on-error main.tex

echo "=== Compilation successful. Output: main.pdf ===" | tee -a "$LOG"
