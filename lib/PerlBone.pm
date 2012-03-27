package PerlBone;
use warnings;
use strict;
use Time::HiRes qw/usleep time/;
use base qw/Exporter/;
my $Serial;
@PerlBone::EXPORT = qw/
	delay millis delayMicroseconds
	run 
	digitalRead digitalWrite 
	analogRead analogWrite 
	pinMode mapPin 
	$Serial 
	A0 A1
	INPUT OUTPUT
	HIGH LOW
/;
use PerlBone::Serial;

my $DEBUG = 1;
my $version = 0.1;

sub import {
	$PerlBone::Serial = PerlBone::Serial->new();
	PerlBone->export_to_level(1, @_);
}

sub delay {
	my $ms = shift;
	usleep($ms * 1000);
}

sub delayMicroseconds {
	my $us = shift;
	usleep($us);
}

sub millis {
	return int(time * 1000);
}

# TODO - Should work from calling space, currently only works from main
sub run {
	main::setup();
	while (1) {
		main::loop();
	}
}

sub digitalWrite {
	my ($pin, $val) = @_;
	print STDERR "Writing $pin = $val\n" if ($DEBUG);
	open (my $out, ">", "/sys/class/gpio/gpio$pin/value");
	print $out $val == HIGH() ? 1 : 0;
	close $out;
}

sub digitalRead {
	my ($pin, $val) = @_;
	print STDERR "Writing $pin = $val\n" if ($DEBUG);
	open (my $out, "<", "/sys/class/gpio/gpio$pin/value");
	my $in = <$out>;
	chomp($in);
	return $in == '1';
}

sub analogWrite {
	my ($pin, $val) = @_;
	print STDERR "Writing $pin = $val\n" if ($DEBUG);
}

sub analogRead {
	my ($pin) = @_;
	return int(rand(4096));
}

sub pinMode {
	my ($pin, $mode) = @_;
	print STDERR "Mode $pin = $mode\n" if ($DEBUG);
	{
		open (my $out, ">", "/sys/class/gpio/export");
		print $out $pin . "\n";
		close $out;
	}

	{
		open (my $out, ">", "/sys/class/gpio/gpio$pin/direction");
		print $out $mode;
		close $out;
	}
	# XXX Register we want to use this pin - and keep for unregister at exit
}

sub mapPin {
	return "BOGUS";
}

# CONSTANTS FOR INPUTS ETC
sub A0 { 15 };	# XXX bogus number
sub A1 { 16 };

sub INPUT { 'in' }
sub OUTPUT { 'out' }
sub HIGH { 1 }
sub LOW { 0 }

=head1 TODO

* Keep array of pins used, to unregister when finished
* Feature: Serial Print (class? Or just basic? Or just remap STDIN STDOUT)

=cut

1;
