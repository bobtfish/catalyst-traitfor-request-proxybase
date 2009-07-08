use strict;
use warnings;
use inc::Module::Install 0.91;

name 'Catalyst-TraitFor-Request-ProxyBase';
all_from 'lib/Catalyst/TraitFor/Request/ProxyBase.pm';

requires 'URI';
requires 'Moose';
requires 'namespace::autoclean';

test_requires 'Catalyst::Runtime' => '5.80007';
test_requires 'CatalystX::RoleApplicator' => '0.005';
test_requires 'Test::More';
test_requires 'HTTP::Request::Common';

resources repository => 'http://github.com/bobtfish/catalyst-traitfor-request-proxybase';
license 'perl';

WriteAll();

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Catalyst/TraitFor/Request/ProxyBase.pm > README")
        and die;
}

