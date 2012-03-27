#
# DigitalReadSerial
# Reads a digital input on pin 2, prints the result to the serial monitor 
# 
# This example code is in the public domain.
#
use PerlBone;

sub setup {
  $Serial->begin(9600);
  pinMode(2, INPUT);
}

sub loop {
  $sensorValue = digitalRead(2);
  $Serial->println($sensorValue);
}

run();

