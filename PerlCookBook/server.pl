#!/usr/bin/perl -w
use IO::Socket;
use strict;

my $server_port = 9999;
my $client;

my $server = IO::Socket::INET->new(
	LocalPort => $server_port,
	Type      => SOCK_STREAM,
	Reuse     => 1,
	Listen    => 10
  )
  or die "Couldn't be a tcp server on port $server_port: $!\n";

while (1) {
	next unless my $client = $server->accept();
	
	print $client, "hello,I am server!\n";
}

close($server);
