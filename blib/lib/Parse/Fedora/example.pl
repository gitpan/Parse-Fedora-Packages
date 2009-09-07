use lib 'lib';

use Parse::Fedora::Packages;
use Data::Dumper;
 
 my $f = Parse::Fedora::Packages->new;
 $f->parse_primary("t/files/primary.xml");

 my @all = $f->list_packages(name => 'perl');

 print Dumper \@all;
