#!/usr/bin/perl -w
use IO::Socket;
use strict;
use IO::Socket;

my $remote_host = '127.0.0.1';
my $remote_port = 9999;

my $socket = IO::Socket::INET->new(
	PeerAddr => $remote_host,
	PeerPort => $remote_port,
	Proto    => "tcp",
	Type     => SOCK_STREAM
  )
  or die "Couldn't connect to $remote_host, $remote_port: $!\n";

print "$socket,\t I'm is client\n";

$socket->connect();

my $answer = <$socket>;

print $answer;

close($socket);
