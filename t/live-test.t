#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;

# setup library path
use FindBin qw($Bin);
use lib "$Bin/lib";

use TestApp;

# a live test against TestApp, the test application
use Catalyst::Test 'TestApp';

my ($res, $c) = ctx_request('/');
is($c->res->body, 'http://localhost/');

