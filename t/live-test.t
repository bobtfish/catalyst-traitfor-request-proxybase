#!/usr/bin/env perl

use strict;
use warnings;
use HTTP::Request::Common;
use Test::More tests => 9;

# setup library path
use FindBin qw($Bin);
use lib "$Bin/lib";

use TestApp;

# a live test against TestApp, the test application
use Catalyst::Test 'TestApp';

sub req_with_base {
    my $base = shift;

    my ($res, $c) = ctx_request(GET('http://localhost/',
        'X-Request-Base' => $base ));
    return $c;
}

is(req_with_base('http://localhost/')->res->body, 'http://localhost/');
is(req_with_base('https://localhost/')->res->body, 'https://localhost/');
ok req_with_base('https://localhost/')->req->secure;

is(req_with_base('https://example.com:445/')->res->body,
    'https://example.com:445/');
is(req_with_base('http://example.com:443/')->res->body,
    'http://example.com:443/');
is(req_with_base('https://example.com:445/some/path')->res->body,
    'https://example.com:445/some/path/');
is(req_with_base('https://example.com:445/some/path/')->res->body,
    'https://example.com:445/some/path/');

ok req_with_base('https://example.com:80/')->req->secure;
ok !req_with_base('http://example.com:443/')->req->secure;

