use warnings;
use strict;
use PerlBone;
#
#  AnalogReadSerial
# Reads an analog input on pin 0, prints the result to the serial monitor 
# 
# This example code is in the public domain.
# 
# Original content from Arduino.cc, changed by Scott Penrose for PerlBone

print "Serialmain now $Serial\n";

sub setup {
	$Serial->begin(9600);
}

sub loop {
	my $sensorValue = analogRead(A0);
	$Serial->println($sensorValue);
	delay(500);
}

run();
