package Nipe::Utils::Install;

use strict;
use warnings;
use Nipe::Utils::Device;

sub new {
	my %device  = Nipe::Utils::Device -> new();
	my $stopTor = "systemctl stop tor";

	system ("mkdir -p /etc/tor/");

	if ($device{distribution} eq "debian") {
		system ("apt-get update && apt-get install -y tor iptables systemd -y");
		system ("cp .configs/debian-torrc /etc/tor/torrc");
	}

	elsif ($device{distribution} eq "fedora") {
		system ("dnf install -y tor iptables");
		system ("cp .configs/fedora-torrc /etc/tor/torrc");
	}

	elsif ($device{distribution} eq "centos") {
		system ("yum -y install epel-release tor iptables");
		system ("cp .configs/centos-torrc /etc/tor/torrc");
	}

	else {
		system ("pacman -S --noconfirm -S tor iptables");
		system ("cp .configs/arch-torrc /etc/tor/torrc");
	}

	system ("chmod 644 /etc/tor/torrc");

	if (-e "/etc/init.d/tor") {
		$stopTor = "/etc/init.d/tor stop > /dev/null";
	}

	system ($stopTor);

	return 1;
}

1;
