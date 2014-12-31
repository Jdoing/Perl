#!/usr/bin/perl -w

use strict;
use IO::Socket;
use Socket;

#$\ = "\n";
my $remote_host = "127.0.0.1";
#my $remote_host = 'localhost';
my $remote_port = 9999;

my $socket = IO::Socket::INET->new(PeerAddr  => $remote_host,
                                   PeerPort  => $remote_port,
                                   Proto     => "tcp",
                                   Type      => SOCK_STREAM ) or die "Couldn't connect to $remote_host, $remote_port: $!\n";

#print "remote host is $remote_host";

#defined(my $host = inet_aton($remote_host)) or die "$remote_host: unknow host!";

#my $sin = sockaddr_in($remote_port, inet_aton("localhost"));

#$socket->connect($sin) or die "connect fail: $!";

$socket->autoflush(1);
print "input is: \n";
while (my $input = <STDIN>) {
    #print "receive message from server is: $socket->";
    print "input is: $input";
    
    $socket->send($input);
     
}

close($socket);

#print $socket "fsdffsdf";
