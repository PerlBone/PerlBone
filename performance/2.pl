use PerlBone;
sub setup {
	pinMode(13, OUTPUT);
}
sub loop {
	for (my $i = 0; $i < 100000; $i++) {
		digitalWrite(13, HIGH);
		digitalWrite(13, LOW);
	}
	exit 1;
}

run();
