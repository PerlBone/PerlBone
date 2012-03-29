#!/usr/bin/perl

# Do not import anything
use PerlBone qw();

# You have to do everything through an object
my $bone = PerlBone->new();

# Set pin mode, pins allows easy access to config
$bone->pinMode($bone->pins->P8_4, $bone->OUTPUT);

# OR you can keep the look
my $p = $bone->pins->P8_5;
$bone->pinMode($p, $bone->OUTPUT);

# Do some pin swaps. Note that sleep 1 is not very accurate, consider Time::HiRes
while (1) {
	$bone->writeDigital($bone->pins->P8_4, $bone->HIGH);
	$bone->writeDigital($p, $bone->HIGH);
	sleep 1;
	$bone->writeDigital($bone->pins->P8_4, $bone->LOW);
	$bone->writeDigital($p, $bone->LOW);
	sleep 1;
}

