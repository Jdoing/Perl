
#!/usr/bin/perl -w

use strict;
use IO::Socket;

my $server_port = 9999;
my $client;
my $quit = 0;
$\ = "\n";

my $server = IO::Socket::INET->new(
	LocalPort => $server_port,
	Type      => SOCK_STREAM,
	Reuse     => 1,
	Listen    => 10
  )
  or die "Couldn't be a tcp server on port $server_port: $!\n";
  
print "server is up" . '.'x 3;

#my $address=inet_aton('localhost');

#bind($server, $server_port, $address) or die "binding occur error: $!";

#$server->listen(2) || die "listening occur error: $!";

while ( !$quit ) {
	next unless my $client = $server->accept();

	#$/ = "CRLF";
	my $pid = fork();

	if ( $pid == 0 ) {
	    my $peer = gethostbyaddr( $client->peeraddr, AF_INET ) || $client->peerhost;
	    my $port = $client->peerport;
	    warn "Connection from [$peer,$port]\n";
            
	    $client->autoflush(1);

	    while (<$client>) {
		chomp;
		#my $line = $_ . "CRLF";
                
                
                print "receive message is: $_";
                
		#$client->print( "message received by server is: " . $_);
                
		}
            
            close($client);

	}elsif($pid > 0){
            
             print "Forking child $pid\n";
             close($client);
            
        }
        else{
            die "Can't fork: $!\n";
        }
        

}

$SIG{INT} = sub {
	$quit = 1;
};

close($server);
