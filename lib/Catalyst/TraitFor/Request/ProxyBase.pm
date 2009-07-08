package Catalyst::TraitFor::Request::ProxyBase;
use Moose::Role;
use namespace::autoclean;

requires 'base';

around 'base' => sub {
    my ($orig, $self, @args) = @_;
    my $ret = $self->$orig(@args);
    # FIXME - Mangle here.
    return $ret;
};

1;

__END__

=head1 NAME

Catalyst::TraitFor::Request::ProxyBase - 

=cut

