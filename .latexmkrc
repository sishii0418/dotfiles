#!/usr/bin/env perl
$lualatex = 'lualatex -synctex=1 -halt-on-error -file-line-error %O %S';
$pdflatex = $lualatex;
$latex = $lualatex;
$bibtex = 'bibtex %O %B';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 4;
$pvc_view_file_via_temporary = 0;
$pdf_previewer = "/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe";
$clean_full_ext = "%R.synctex.gz";
