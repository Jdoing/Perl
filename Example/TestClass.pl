#!/usr/bin/perl
iuse strict; 
use warnings; 
use Test::More; 
use base qw(Test::Class);

sub before : Test(setup){
    print "Start to test:";

}
