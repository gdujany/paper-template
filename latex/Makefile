# $Id: Makefile 77906 2015-07-27 16:26:18Z gdujany $
# ===============================================================================
# Purpose: simple Makefile to streamline processing latex document (just say "make all" to execute)
# Author: Giulio Dujany
# Created on: 2014-01-14
# Copied from http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# ===============================================================================

# name of the main latex file (do not include .tex)
MAIN = main

# name of command to perform Latex (either pdflatex or latex)
LATEX = pdflatex

# list of all source files
TEXSOURCES = $(wildcard *.tex) $(wildcard sections/*.tex) $(wildcard tables/*.tex)
BIBSOURCES = $(wildcard bibliography/*.bib)
FIGSOURCES = $(wildcard figs/*$(FIGEXT))
SOURCES    = $(TEXSOURCES) $(BIBSOURCES) $(FIGSOURCES)

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: $(MAIN).pdf all clean outclean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: $(MAIN).pdf

# CUSTOM BUILD RULES

# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.
# "raw2tex" and "dat2tex" are just placeholders for whatever custom steps
# you might have.

# %.tex: %.raw
#         ./raw2tex $< > $@

# %.tex: %.dat
#         ./dat2tex $< > $@

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

$(MAIN).pdf: $(SOURCES)
	latexmk -pdf -use-make $(MAIN).tex
#latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $(MAIN).tex

clean:
	latexmk -c
	rm *.bbl

outclean:
	latexmk -C
	rm *.bbl

old:
	rm -f $(MAIN).aux && $(LATEX) $(MAIN) && bibtex $(MAIN) && $(LATEX) $(MAIN) && $(LATEX) $(MAIN)
