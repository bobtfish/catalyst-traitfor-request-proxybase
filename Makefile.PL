use inc::Module::Install;

name 'Catalyst-TraitFor-Request-ProxyBase';
all_from 'lib/Catalyst/TraitFor/Request/ProxyBase.pm';

build_requires 'Catalyst::Runtime';
build_requires 'Test::WWW::Mechanize::Catalyst';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
