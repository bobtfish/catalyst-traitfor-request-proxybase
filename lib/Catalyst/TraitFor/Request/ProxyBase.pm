package Catalyst::TraitFor::Request::ProxyBase;
use Moose::Role;
use URI ();
use namespace::autoclean;

our $VERSION = '0.000002';

requires qw/
    base
    secure
/;

around 'base' => sub {
    my ($orig, $self, @args) = @_;
    if (my $base = $self->header('X-Request-Base')) {
        $base .= '/' unless $base =~ m|/$|;
        @args = (URI->new($base));
    }
    $self->$orig(@args);
};

around 'secure' => sub {
    my ($orig, $self, @args) = @_;
    if (my $base = $self->header('X-Request-Base')) {
        return URI->new($base)->scheme eq 'http' ? 0 : 1;
    }
    $self->$orig(@args);
};

1;

__END__

=head1 NAME

Catalyst::TraitFor::Request::ProxyBase -

=head1 SYNOPSIS

    package MyApp;
    use Moose;
    use namespace::autoclean;

    use Catalyst;
    use CatalystX::RoleApplicator;

    extends 'Catalyst';

    __PACKAGE__->apply_request_class_roles(qw/
        Catalyst::TraitFor::Request::ProxyBase
    /);

    __PACKAGE__->setup;

=head1 DESCRIPTION

This module is a L<Moose::Role> which allows you more flexibility in your
application's deployment configurations when deployed behind a proxy.

The problem is that there is no standard way for a proxy to tell a backend
server what the original URI for the request was, or if the request was
initially SSL. (Yes, I do know about C<< X-Forwarded-Host >>, but they don't
do enough)

This creates an issue for someone wanting to deploy the same cluster of
application servers behind various URI endpoints.

Using this module, the request base (C<< $c->req->base >>)
is replaced with the contents of the C<< X-Request-Base >> header,
which is expected to be a full URI, for example:

    http://example.com
    https://example.com
    http://other.example.com:81/foo/bar/yourapp

This value will then be used as the base for uris constructed by
C<< $c->uri_for >>.

=head1 REQUIRED METHODS

=over

=item base

=item secure

=back

=head1 WRAPPED METHODS

=over

=item base

=item secure

=back

=head1 BUGS

Probably. Patches welcome, please fork from:

    http://github.com/bobtfish/catalyst-traitfor-request-proxybase

and send a pull request.

=head1 AUTHOR

Tomas Doran (t0m) C<< <bobtfish@bobtfish.net> >>

=head1 COPYRIGHT

This module is Copyright (c) 2009 Tomas Doran and is licensed under the same
terms as perl itself.

=cut

