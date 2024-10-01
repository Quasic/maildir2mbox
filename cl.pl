#!/bin/perl

use warnings;
use strict;
no utf8; # so length gives value in octets (unneeded otherwise?)

print ((/^Content-Length:/?'>':'').$_) while (defined($_=<>)&&! /^\r?\n$/);
local $/;
my $rest=<>;
print 'Content-Length: '.length($rest)."\n\n$rest";
