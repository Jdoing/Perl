package Pet;
sub new{
    my $class = shift;
    my $pet = {
        "Name" => undef,
        "Owner" => undef,
        "Type" => undef,
    };

    bless ($pet, $class);

}

sub setPet{
    my $self = shift;
    my ($name, $owner, $type)= @_;
    $self->{"Name"} = $name;
    $self->{"Owner"} = $owner;
    $self->{"Type"} = $type;
}

sub getPet{
    my $self = shift;
    while(($key,$value)=each(%$self)){
        print "$key: $value\n";
    }
}

1;
