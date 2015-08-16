#! /usr/bin/perl

## 26.01.2010 - Atle Holm
##Dette scriptet endrer navn p&aring; alle filer i en mappe til det bruker spesifiserer. 
##V&aelig;r varsom med at filer av samme filtype overskriver hverandre.
##Brukes mest privat for egen del.

use strict;
use warnings;
my (@fields);
my ($input, $line, $location, $suffix);

$input = $ARGV[0] or die "\nYou have to give a new name as the first argument!\n$!\n";
$location = $ARGV[1] or die "\nYou have to specify the path for where to rename as the second argument!\n$!";
print "Renaming to \"", $input, "\".\n";
chomp($input);
chomp($location);
$location .= "/" unless $location=~m|/$|;
opendir(DH, "$location") or die "\nCould not open location!\n$!\n";
while ($_ = readdir(DH)) {
	@fields = split /\./, $_;
	$_ = "$location".$_;
	next if $_ eq "$location." or $_ eq "$location..";
	print "\033[31m|--Renaming ", $_, "--|\033[0m\n";
	$fields[0] = $input;
	for (my $x = 1; $x < scalar @fields; $x++) {
		$suffix.=$fields[$x];	
		if (($x+1) < scalar @fields) {
			$suffix .= ".";
		}
	}	
	$line = $fields[0].".".$suffix if defined $fields[1] or die "Error: Array not defined. $!\n";
	print "New name: ", $line, "\n";
	system("mv $_ $location/$line");
	$suffix = "";
}
close(DH);
print "Finished renaming files in $location\n";