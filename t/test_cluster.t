use Modern::Perl;
use Test::More tests => 2;

BEGIN{ use_ok('HPC::Slurm'); };

my $slurm;
ok($slrum = HPC::Slurm->new());
