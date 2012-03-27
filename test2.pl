use PerlBone;

my $ledPin = mapPin('P8_3');

sub setup {
	pinMode($ledPin, OUTPUT);
}

sub loop {
  digitalWrite($ledPin, HIGH);
  delay(1000);
  digitalWrite($ledPin, LOW);
  delay(1000);
}

run();

