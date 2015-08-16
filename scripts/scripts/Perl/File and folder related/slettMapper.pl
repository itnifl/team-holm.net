#! /usr/bin/perl

#03.12.2009 - Atle Holm
#Sletter tomme mapper, med 1 fil eller mindre

my @liste = `ls`;
foreach $i (@liste) {
	if ($i !~ /pl$/) {
		my @inside = `ls $i`;	
		if ($#inside > 1) {
			`echo "$#inside - $i" >> ../liste.txt`;
		} else {
			chomp($i);
			`rm -dR $i`;
			`echo "$i ble slettet" >> ../slettet.txt`;
		}
	}
}