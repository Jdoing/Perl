#!/usr/bin/perl -w
use strict;
use Getopt::Long;
use Smart::Comments;

my @libs    = (); 
my %flags   = (); 
my ($verbose, $more, $debug, $test, $step);
#./t.pl --step --verbose --nomore --debug=2 --lib=/usr/bin --lib=/lib/my --flag os=linux --flag bar=fat --t

#### Debugging here at <where> , thim is <time>
GetOptions(
    'verbose'  => \$verbose,
    'step+'      => \$step, 
    'more!'     => \$more,
    'debug:i'   => \$debug,
    'lib=s'     => \@libs,
    'flag=s'    => \%flags,
    'test|t'    => \$test,
) or die "getOptin error: $!";



### $verbose
### $step
### $more
### $debug
### $test
### @libs;
### %flags
