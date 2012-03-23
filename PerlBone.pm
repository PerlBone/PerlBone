package PerlBone;
use Time::HiRes qw/usleep/;
use base qw/Exporter/;
@EXPORT = qw/delay run digitalWrite pinMode mapPin/;

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
}

sub digitalRead {
}

sub analogWrite {
}

sub analogRead {
}

sub pinMode {
	my ($pin, $mode) = @_;
	print STDERR "Mode $pin = $mode\n";
	# XXX Register we want to use this pin
	# XXX 
}

sub mapPin {
	return "BOGUS";
}

=head1 TODO

* Keep array of pins used, to unregister when finished
* Feature: Serial Print (class? Or just basic? Or just remap STDIN STDOUT)

=cut

1;
