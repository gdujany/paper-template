#!/bin/csh

set withID = `grep "article{LHCb-PAPER-20" LHCb-PAPER.bib | wc -l`
set arxiv = `grep "arXiv" LHCb-PAPER.bib | wc -l`
set pub = `grep "journal" LHCb-PAPER.bib | wc -l`
set note = `grep "note" LHCb-PAPER.bib | wc -l`

echo There are $withID papers with a number, $arxiv on arxiv and $pub published "("$note not yet")"


