use PerlBone;

my $ledPin = mapPin('P8_3');

pinMode($ledPin, OUTPUT);

while(1) {
  digitalWrite($ledPin, HIGH);
  delay(1000);
  digitalWrite($ledPin, LOW);
  delay(1000);
}


