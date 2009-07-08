use strict;
use warnings;
use inc::Module::Install 0.91;

name 'Catalyst-TraitFor-Request-ProxyBase';
all_from 'lib/Catalyst/TraitFor/Request/ProxyBase.pm';

name 'CatalystX-RequestRole-ProxyBase';
all_from 'lib/CatalystX/RequestRole/ProxyBase.pm';

requires 'Moose';
requires 'namespace::autoclean';

build_requires 'Catalyst::Runtime' => 5.80;
build_requires 'CatalystX::RoleApplicator' => '0.005';
build_requires 'Test::WWW::Mechanize::Catalyst';
build_requires 'Test::More';

WriteAll();

