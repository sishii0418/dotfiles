#!/usr/bin/env perl
$latex            = 'platex -synctex=1 %O %S -halt-on-error';
$bibtex           = 'pbibtex';
$biber            = 'biber  -u -U --output_safechars';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;
$pvc_view_file_via_temporary = 0;
$pdf_previewer = "/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe";
