#!/usr/bin/perl

# Author: Daniel "Trizen" Șuteu
# Date: 16 August 2016
# License: GPLv3
# Website: https://github.com/trizen

# https://projecteuler.net/problem=74

# Runtime: 17.323s

use 5.010;
use strict;

use List::Util qw(sum0);
use ntheory qw(factorial todigits);

my @factorial = (map { factorial($_) } 0 .. 9);

sub f {
    my ($n) = @_;

    my %seen = ($n => 1);

    while (1) {
        my $m = sum0(@factorial[todigits($n)]);
        exists($seen{$m}) && last;
        undef $seen{$m};
        $n = $m;
    }

    keys(%seen) == 60;
}

my $count = 0;
foreach my $i (0 .. 1e6 - 1) {
    ++$count if f($i);
}

say $count;
