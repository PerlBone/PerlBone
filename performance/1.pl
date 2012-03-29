use PerlBone;
sub setup {
	$Serial->begin();
	$Serial->println("Hello world");
}
sub loop {
	exit 1;
}

run();
