use lib 'lib';

use Parse::Fedora::Packages;
use Data::Dumper;
 
 my $f = Parse::Fedora::Packages->new;
 $f->parse_primary("primary.xml");

 my @all = $f->list_packages();

 print Dumper $all[0];
