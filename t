local $\ = "\n";
my %hash = (q/NODE[0].SHMEM.BASEDIR/ => "123", tee => "999");

for  my $key (keys %hash){
	print $key;
	}
#print $hash{NODE[0].SHMEM.BASEDIR};

print "$hash{tee}";

print "fsdf";
