#!/usr/bin/perl -w
use strict;
use Test::More tests => 3;

sub multiple{
    my($x, $y) = @_;
    return $x * $y;
}

ok(1, "This is first test");
is(2, 2, "is method test");
like("abcd", qr/^a.*d$/, "like method test");
