#!/usr/bin/perl -w
use strict;
use File::Spec;

my %options;

$options{single_case} = '/home/jiangyu/code/pl/Example';

   my @cases;
    if (-d $options{single_case}) {
        my @files;
        my $dh;
        push(@files, $options{single_case});
        while (@files) {
            if (-d $files[0]) {
                opendir $dh, $files[0] or die $!;
                @_ = grep { /^[^\.]/ } readdir $dh;
                foreach (@_) {
                    push(@files, File::Spec->catfile ($files[0], $_));
                }
                closedir $dh;
            }
            elsif ($files[0] =~ /\.pl$/) {
            #elsif ($files[0] =~ /\.t$/) {
                push(@cases, $files[0]);
            }
            shift @files;
        }
    }
    else {
        @cases = ($options{single_case});
    }

local $\ ="\n";    
print $_ foreach @cases;
