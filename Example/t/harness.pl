#!/usr/bin/perl -w
use strict;

use TAP::Harness;
use TAP::Parser;
use TAP::Parser::Aggregator;

$| = 1;
$\ = "\n";


my @tests = ('add.t',);
my $cmd = "perl add.t";

my $parser = TAP::Parser->new(
    {
    exec => [$cmd],
    merge => 1,
    spool => \*STDOUT,
    }
    );


$parser->run;






my $aggregator = TAP::Parser::Aggregator->new;
$aggregator->start;

$aggregator->add('add.t', $parser);


$aggregator->stop;


print "failed is: " . $aggregator->failed;

print "planned is: " . $aggregator->planned;

my $harness = TAP::Harness->new( {
    verbosity => 1,
    merge => 1,
     }
    );

$harness->summary($aggregator);



#my $total =$harness->runtests(@tests);

#print $total->{max} ;
#print $failed;