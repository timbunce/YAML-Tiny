#!/usr/bin/perl

# Testing of unicode META.yml examples

use strict;
use utf8;
BEGIN {
	$|  = 1;
	$^W = 1;
}

use t::lib::Test;
use Test::More tests(1);
use File::Spec::Functions ':ALL';
use YAML::Tiny ();





#####################################################################
# Testing YAML::Tiny's own META.yml file

SCOPE: {
	my $content = load_ok(
		'Digest-Whirlpool.yml',
		catfile( 't', 'data', 'Digest-Whirlpool.yml' ),
		10,
	);
	yaml_ok(
		$content,
		[ {
			'author' => 'Ævar Arnfjörð Bjarmason <avar@cpan.org>',
		} ],
		'Digest-Whirlpool',
	);
}
