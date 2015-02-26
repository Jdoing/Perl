#!/usr/bin/perl -w
use strict;

#print "please input a string\n";
#my $line = <STDIN>;
#print $line;

#wirte a file
open(FH, ">aa.txt") or die $!;

print FH "hello\n";#向文件写入内容
print FH "OK\n";

close(FH);

#open a file
open(FH, "aa.txt") or die $!;
my @f = <FH>;#将文件内容读出
print @f;

seek(FH, 0 ,0);
while (<FH>) {
   print $_;
}

close(FH);
