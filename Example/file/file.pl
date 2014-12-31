#!/usr/bin/perl -w
use strict;

#print "please input a string\n";
#my $line = <STDIN>;
#print $line;

#wirte a file
open(FH, ">aa.txt") or die $!;

print FH "hello\n";
print FH "OK\n";

close(FH);

#open a file
open(FH, "aa.txt") or die $!;
my @f = <FH>;
print @f;

seek(FH, 0 ,0);
while (<FH>) {
   print $_;
}

close(FH);