#!/usr/bin/perl -w
use strict;

open(FH, "| wc -w") or die $!;
     print FH "aa bb cc";

close(FH);
