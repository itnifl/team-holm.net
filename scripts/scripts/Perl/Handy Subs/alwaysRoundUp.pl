#!/usr/bin/perl

#26.12.2011 - Atle Holm
#Always rounds a number up, no matter how close it is to round down

use POSIX;
use warning;
use strict;

print round(3.1);

sub intCheck{
	my $num = shift;
	return ($num =~ m/^\d+$/);
}
sub round {
	my $var = shift;
	if (intCheck($var - 0.5)) { $var = $var + 0.1; }
	return ceil($var);
}