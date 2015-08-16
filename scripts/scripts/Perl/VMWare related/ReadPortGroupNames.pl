#!/usr/bin/perl -w
#
# Atle Holm 13.12.2013
# Script to store VMWare VLAN names in mongoDB - 
#	uses VMWare SDK for Perl in Linux and the required modules in the use list below:
#
# Test connection: 
# /usr/lib/vmware-vcli/apps/general/connect.pl --url https://vCenter/sdk/vimService --username 'domain\user' --password 'xxx'
# Usage: ./vmware-vlan.pl --url https://vCenter/sdk/vimService --username 'domain\user' --password 'xxx'

use strict;
use warnings;
use MongoDB;
use VMware::VIRuntime;
use VMware::VILib;

Opts::parse();
Opts::validate();
Util::connect();

my $PORT = "insert port here";
my $MONGO_URL = "insert url here";
my $databaseName = "insert database name here";

sub getAllPorts {
	my $portgroup_views = Vim::find_entity_views(view_type => 'DistributedVirtualPortgroup');
	my @portInfo;
	foreach my $portgroup (@$portgroup_views) {
		my ($portgroupName, $portgroupConfigName, $portgroupConfigDescription, $portgroupConfigNumPorts);

		$portgroupName = $portgroup->name;
		$portgroupConfigName = ($portgroup->config->name ? $portgroup->config->name : "N/A");
		$portgroupConfigDescription = ($portgroup->config->description ? $portgroup->config->description : "N/A");
		$portgroupConfigNumPorts = ($portgroup->config->numPorts ? $portgroup->config->numPorts : "N/A");

		my %tempHash = ('portgroupName' => $portgroupName, 'portgroupConfigName' => $portgroupConfigName, 
			'portgroupConfigDescription' => $portgroupConfigDescription, 'portgroupConfigNumPorts' => $portgroupConfigNumPorts);
		push(@portInfo, \%tempHash);
	}
	return @portInfo;
}

#1. First we get all the portgroups from vCenter
my @portInfo = getAllPorts();
#2. Then we connect to the mongoDB database:
my $mongoDBClient = MongoDB::MongoClient->new(host => $MONGO_URL.':'.$PORT);

#FOR TESTING CONNECTION:
#my @dbs = $mongoDBClient->database_names;
#foreach my $db (@dbs) {
	#print $db . "\n";
#}

#3. Get the desired database:
my $db = $mongoDBClient->get_database($databaseName);
#4. Get the desired document collection - called a table in "normal" databases:
my $col_vlan_names = $db->get_collection('vlan_names');

#If we weren't using upsert next we would have to drop the collection 
#so that we wouldn't end up with adding redundant information in it each time this script is run.
#No need to drop, we are using upsert:
#$col_vlan_names->drop;

#4. Loop through the port groups we have collected and update the database if the port group does not exist there already:
foreach my $portgroup (@portInfo) {
	my %pgroup = %$portgroup;
	#Following is commented away in advance of upsert:
	#$col_vlan_names->insert({"name" => $pgroup{'portgroupName'}});
	$col_vlan_names->update({"name" => $pgroup{'portgroupName'}},{'$inc' => {"views" => 1}},{'upsert' => 1});
}

#FOR TESTING DATABASE CONTENT:
#my $all_vlans = $col_vlan_names->find;
#while(my $vlansObj = $all_vlans->next) {
	#my $vlanName = $vlansObj->{'name'};
	#print $vlanName . "\n" if(defined($vlanName));
#}