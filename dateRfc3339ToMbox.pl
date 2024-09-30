#!/usr/bin/perl

use strict;
use warnings;

eval {
	require DateTime::Format::Mail;
	print DateTime::Format::Mail->new->loose->parse_datetime($ARGV[0])->strftime("%a %b %e %T %Y");
};
if($@){
	$ARGV[0]=~/(Sun|Mon|Tue|Wed|Thu|Fri|Sat),? ([0-3]?[0-9]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) ([0-9]+) ([0-2]?[0-9]:[0-5]?[0-9]:[0-5]?[0-9])/ or die;
	print "$1 $3 $2 $5 $4";
}
