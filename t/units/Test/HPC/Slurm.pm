package Test::HPC::Slurm;

use FindBin qw($Bin);
use base qw(Test::Class);
use Test::Most;
use YAML qw(LoadFile);
use Data::Dumper;

sub class {'HPC::Slurm'}

sub start : Test(startup => 1) {
  use_ok shift->class();
}

sub constructor : Test(3) {
  my ($test) = @_;
  my $class = $test->class;

  can_ok($class, 'new');
  ok(my $slurm = $class->new(), '... and the constructor should succeed');
  isa_ok($slurm, $class, '... and the object it returns');
}

sub clusters : Test(9) {
  my ($test)  = @_;
  my $class   = $test->class;
  my $fixture = LoadFile(qq($Bin/fixtures/clusters.yaml));
  my $slurm   = $class->new();

  can_ok($slurm, 'clusters');
  ok(my $clusters = $slurm->clusters(), '... and can build a list of clusters');
  is(ref $clusters, 'ARRAY', '... and clusters is an ARRAY reference');
  is(scalar @{$clusters}, scalar @{$fixture->{clusters}}, '... and count of clusters matches fixture');

  my $cluster = $clusters->[0];

  for (qw(cluster nodecount cpucount controlhost controlport)) {
    is($cluster->$_,   $fixture->{$_},   qq{... and $_ matches fixture});
  }
}

sub partitions: Test(2) {
  my ($test) = @_;
  my $class  = $test->class;
  my $slurm  = $class->new();

  can_ok($slurm, 'partitions');
  ok(my $partitions = $slurm->partitions(), '... and can build a list of parititons');
}

1;
