package PerlBone;
use Time::HiRes qw/usleep/;
use base qw/Exporter/;
my $Serial;
@EXPORT = qw/delay run digitalWrite pinMode mapPin analogRead analogWrite $Serial A0 A1/;
use PerlBone::Serial;

sub import {
	$PerlBone::Serial = PerlBone::Serial->new();
	print STDERR "Serial now $Serial\n";
	PerlBone->export_to_level(1, @_);
}

# XXX just map
sub delay {
	my $ms = shift;
	usleep($ms * 1000);
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
	print STDERR "Writing $pin = $val\n";
	open (my $out, ">", "/sys/class/gpio/gpio$pin/value");
	print $out $val eq 'HIGH' ? 1 : 0;
	close $out;
}

sub digitalRead {
	my ($pin, $val) = @_;
	print STDERR "Writing $pin = $val\n";
	open (my $out, "<", "/sys/class/gpio/gpio$pin/value");
	my $in = <$out>;
	chomp($in);
	return $in == '1';
}

sub analogWrite {
}

sub analogRead {
	return int(rand(4096));
}

sub pinMode {
	my ($pin, $mode) = @_;
	#print STDERR "Mode $pin = $mode\n";
	{
		open (my $out, ">", "/sys/class/gpio/export");
		print $out $pin . "\n";
		close $out;
	}

	{
		open (my $out, ">", "/sys/class/gpio/gpio$pin/direction");
		print $out $mode eq 'INPUT' ? 'in' : 'out';
		close $out;
	}
	# XXX Register we want to use this pin
	# XXX 
}

sub mapPin {
	return "BOGUS";
}

# CONSTANTS FOR INPUTS ETC
sub A0 { 15 };	# XXX bogus number
sub A1 { 16 };

=head1 TODO

* Keep array of pins used, to unregister when finished
* Feature: Serial Print (class? Or just basic? Or just remap STDIN STDOUT)

=cut

1;
