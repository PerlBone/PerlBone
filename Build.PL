use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'PerlBone',
	license             => 'perl',
	dist_author         => 'Scott Penrose <scottp@dd.com.au>',
	dist_version_from   => 'lib/PerlBone.pm',
	#build_requires => {
		#	'Test::More' => 0,
		#},
	add_to_cleanup      => [ 'PerlBone-*' ],
	create_makefile_pl => 'traditional',
);

$builder->create_build_script();
