#!/usr/bin/perl

# Daniel "Trizen" Șuteu
# License: GPLv3
# Date: 09 October 2016
# Website: https://github.com/trizen

# https://projecteuler.net/problem=95

# Runtime: 6.870s

use 5.010;
use strict;
use integer;

use ntheory qw(divisor_sum);

my $limit = 1e6;

my %chain;
foreach my $n (1 .. $limit) {
    my $len  = 0;
    my $orig = $n;

    my %seen;
    while (1) {
        my $sum = divisor_sum($n) - $n;
        last if $sum > $limit;
        last if $seen{$sum}++;
        $n = $sum;
        ++$len;
    }

    if (exists $seen{$orig}) {
        $chain{$len} //= $orig;
    }
}

say $chain{(sort { $b <=> $a } keys %chain)[0]};
