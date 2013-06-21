use Modern::Perl;
use Test::More tests => 2;


BEGIN{ use_ok('HPC::Slurm'); };

my $slurm = HPC::Slurm->new(cluster => 'ufp');
isa_ok($slurm, 'HPC::Slurm');
