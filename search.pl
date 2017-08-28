#!/usr/bin/env perl

# We have large sorted array of integers. Write a Perl function which finds
# a value inside array which is a nearest to specified argument.



use strict;
use warnings;
use v5.10;



sub search {
    my ($value, $list) = @_;
    my ($start, $end) = (0, $#$list);
    while ($start < $end) {
    	my $cur = int (($start + $end) / 2);

    	my $d_cur =  $list->[$cur] - $value;
    	my $d_low =  $list->[$start] - $value;
    	my $d_high = $list->[$end] - $value;
    	if ($cur == $start) {
    		return $start if abs $d_low < abs $d_high;
    		return $end;
    	}

    	if ($d_cur == 0) {
    		return $cur;
    	} elsif ($d_cur > 0) {
    		$end = $cur;
    	} elsif ($d_cur < 0) {
    		$start = $cur;
    	}
    }
}

my @list = (0, 1, 2, 3, 3, 8, 8, 9, 10, 10, 10, 11);
my @args = (-1 .. 12);

for my $value (@args) {
    my $idx = search $value, \@list;
    say "for arg $value idx is $idx so nearest value is $list[$idx]";
}



