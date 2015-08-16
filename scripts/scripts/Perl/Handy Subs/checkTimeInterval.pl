#!/usr/bin/perl

#26.12.2011 - Atle Holm
#Check a time interval

use Date::Parse;
use Date::Format;
use warning;
use strict;

my $updateInterval = (60 * 60 * 24 * 7); #7 days in seconds
my $oldDate = getSomeExampleDateFunction();

#If the difference is more then seven days, then print
my @lt = localtime(time);
if(((str2time(strftime("%c\n", @lt))) - str2time($resultDateReturn)) > $updateInterval) {
#If using MySQL; Could be replaced with: SELECT (now()-updated_at) FROM tableName;
	print "Difference is more then seven days!";
}

