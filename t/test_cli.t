use Modern::Perl;
use Test::More;
use Data::Dumper;

BEGIN { use_ok('HPC::Slurm::CLI'); }

my @clusters = HPC::Slurm::CLI->get_clusters();
ok(@clusters == 1, 'Only one cluster found');
diag(Dumper(\@clusters));

my @users = HPC::Slurm::CLI->get_users();
ok(@users > 1, 'Got more than 1 user');
is(scalar @users, 49, 'total number of users matches');

my @accounts = HPC::Slurm::CLI->get_accounts();
ok(@accounts > 1, 'got more than 1 account');

my @qos = HPC::Slurm::CLI->get_qos();
ok(@qos > 1, 'got more than 1 qos');

done_testing();
