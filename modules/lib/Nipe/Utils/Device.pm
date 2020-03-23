package Nipe::Utils::Device;

use strict;
use warnings;
use Config::Simple;

my $config    = Config::Simple -> new('/etc/os-release');
my $id_like   = $config -> param('ID_LIKE');
my $id_distro = $config -> param('ID');

sub new {
	my %device = (
		"username" => "debian-tor",
		"distribution"  => "debian"
	);

	return %device;
}

1;
