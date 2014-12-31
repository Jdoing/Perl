#!/usr/bin/perl -w
use strict;

my $cnt = 0;
sub handler_interrupt{
    warn "Don't interrupt me!\n";
    $cnt++;
}

$SIG{INT} = \&handler_interrupt;


while ($cnt < 3) {
    print "I am sleepling\n";
    sleep(5);
}


