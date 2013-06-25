package Test::HPC::Slurm::Cluster;

use FindBin qw($Bin);
use base qw(Test::Class);
use Test::Most;
use YAML qw(LoadFile);
use Data::Dumper;

sub class {'HPC::Slurm::Cluster'}

sub make_fixture : Test(setup) {
  my ($test) = @_;
  $test->{fixture} = LoadFile(qq($Bin/fixtures/clusters.yaml));
}

sub startup : Test(startup => 1) {
  my ($test) = @_;
  use_ok $test->class();
}

sub constructor : Test(3) {
  my ($test) = @_;
  my $class = $test->class;

  can_ok($class, 'new');
  ok(my $slurm = $class->new(), '... and the constructor should succeed');
  isa_ok($slurm, $class, '... and the object it returns');
}

1;
