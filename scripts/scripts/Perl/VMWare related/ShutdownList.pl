#! /usr/bin/perl -w

#Atle Holm - 2009
#Et script som generer en HTML side som lister p&aring;sl&aring;tte VmWare maskiner og 
#gj&oslash;r det mulig &aring; sl&aring; dem av.Dette er testet med VmWare server, og scriptet krever 
#en del moduler. Feks VIX API fra VmWare. 
#Scriptet m&aring; ogs&aring; brukes p&aring; en web-server som er satt opp med- og har installert Perl.

use CGI;
use CGI::Carp qw(carpout fatalsToBrowser); #M&aring; ha denne for at die og warn skal fungere, og skrive til browser.
use CGI::Pretty qw(:all); #M&aring; ha dette til formene
use Fcntl qw(:flock); #M&aring; ha denne for &aring; kunne l&aring;se filer

use VMware::Vix::Simple;
use VMware::Vix::API::Constants;

#VMWARE spesifike variabler:
my $err = VIX_OK;
my $hostHandle = VIX_INVALID_HANDLE;
my $vmHandle = VIX_INVALID_HANDLE;
our @vms;

#Utvikler definerte variabler:
our $counter = 0;
my ($TempVms, $TempChoice, $hostname, $username, $password);
my $cgi=new CGI; #read in parameters
my $msgfile="/tmp/state.msg";

print $cgi->header(); #print en header
#Hent gammel state hvis den finnes
if ($cgi->param('Logoff')) {
	system("rm /tmp/state.msg");
}
if (open (LOAD,$msgfile)) {
	flock LOAD,LOCK_SH; #shared lock
	my $oldcgi=new CGI(LOAD);
	flock LOAD,LOCK_UN; #release lock
	close (LOAD);
	$hostname = $oldcgi->param('Hostname');
	$username = $oldcgi->param('User');
	$password = $oldcgi->param('Password');
	&ShowVMS;
} elsif ($cgi->param('Hostname') and $cgi->param('User') and $cgi->param('Password')) {
	$hostname = $cgi->param('Hostname');
	$username = $cgi->param('User');
	$password = $cgi->param('Password');
	if (open (SAVE,"> $msgfile")) {
		flock SAVE,LOCK_EX; #exclusive lock 
		$cgi->save(SAVE);
		flock SAVE,LOCK_UN; #release lock 
	} else {
		print $cgi->font({-color=>'red'},"&lt;BR&gt;Failed to save: $!");
	}
	&ShowVMS;
} else {
	print $cgi->start_html(-title=>'VMWare Shutdown Service', -bgcolor=>'black', -LINK=>"red", -ALINK=>"red", -VLINK=>"red", 
			-TEXT=>"white"); #Lag HTML dokument start
	print generate_form();
	print "&lt;BR/&gt;&lt;BR/&gt;&lt;BR/&gt;&lt;BR/&gt;&lt;BR/&gt;&lt;BR/&gt;&lt;BR/&gt;&lt;B&gt;Syntax for writing servername is:&lt;/B&gt;&lt;BR/&gt;";
	print "http://servername:port/sdk&lt;BR&gt;https://ipaddress:port/sdk";
	print $cgi->end_html();
}
sub generate_form {
	return start_form,
	h1("&lt;CENTER&gt;VmWare Shutdown Service&lt;/CENTER&gt;&lt;BR&gt;"),
	h2("Please enter the information below to enter:"),
	p("Server name:", textfield('Hostname')),
	p("User Name:&nbsp;", textfield('User')),
	p("Password:&nbsp;&nbsp;&nbsp;", password_field('Password')),
	p(submit),
	end_form;
}

#Hit kommer vi bare om vi har de rette parametrene satt og/eller vi har den rette informasjonen
sub ShowVMS {
	($err, $hostHandle) = HostConnect(VIX_API_VERSION,
		VIX_SERVICEPROVIDER_VMWARE_VI_SERVER,
		$hostname, # hostName
		0, # hostPort
		$username, # userName
		$password, # password
		0, # options
		VIX_INVALID_HANDLE); # propertyListHandle

	die "HostConnect() failed, $err ", GetErrorText($err), "\n" if $err != VIX_OK;

	@vms = FindRunningVMs($hostHandle, 100);
	$err = shift @vms;
	die "Error $err finding running VMs ", GetErrorText($err),"\n" if $err != VIX_OK;
	
	#Her starter selve innholdet i HTML dokumentet
	print $cgi->start_html(-title=>'VMWare Shutdown Service', -bgcolor=>'black', -LINK=>"red", -ALINK=>"red", 
			-VLINK=>"red", -TEXT=>"white"); #Lag HTML dokument start
	print "&lt;P&gt;*Running Virtual Machines at $hostname:\n&lt;/P&gt; ";
	foreach $TempVms (@vms) { 
		print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*(", ++$counter, ")&nbsp;&nbsp;&nbsp;&lt;span style=\"color:red\"&gt;", 
				$cgi->a({-href=>"http://ourserver.nodenet.local/cgi-bin/ShutdownList.pl?Shutdown=$counter"}, $TempVms), "\n&lt;/span&gt;&lt;BR&gt;"; 
	}
	print "&lt;BR&gt;Choose VM to power down(1 - ", $counter, ") by clicking on them.";
	if ($cgi->param('Shutdown')) {
		my $param = $cgi->param('Shutdown');
		&Poweroff($param);
	} 
	print "&lt;BR&gt;&lt;P&gt;&nbsp;&nbsp;&nbsp;*", $cgi->a({-href=>"http://ourserver.nodenet.local/cgi-bin/ShutdownList.pl?Logoff=1"}, "Log Off&lt;/P&gt;");
	print $cgi->end_html(); #Gj&oslash;r ferdig HTML document
}
sub Poweroff {
	my $choice = shift;
	print "&lt;BR&gt;Attempting to power off: &lt;span style=\"color:red\"&gt;", $vms[--$choice], "&lt;/span&gt;\n";
	($err, $vmHandle) = VMOpen($hostHandle, $vms[$choice]);
	die "&lt;BR&gt;VMOpen() failed, $err ", GetErrorText($err), "\n" if $err != VIX_OK;

	# Assume this virtual machine is already running
	$err = VMPowerOff($vmHandle, VIX_VMPOWEROP_FROM_GUEST); 
	die "&lt;BR&gt;VMPowerOff() failed, $err ", GetErrorText($err), "\n" if $err != VIX_OK;
}