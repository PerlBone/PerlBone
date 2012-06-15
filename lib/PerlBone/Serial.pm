package PerlBone::Serial;
use v5.12.0;
use strict;
use warnings;
use autodie;
#use Device::SerialPort;

# PURPOSE: To print to default Serial Port or automatically to CONSOLE if no Baud set

sub new {
	return bless {}, shift;
}

sub begin {
	my ($self, $baud) = @_;
}

sub print {
	my ($self, @rest) = @_;
	print @rest;
}

sub println {
	shift->print(@_, "\n");
}

1;
