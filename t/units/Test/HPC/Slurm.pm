package Test::HPC::Slurm;

use FindBin qw($Bin);
use base qw(Test::Class);
use Test::Most;
use YAML qw(LoadFile);

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

sub clusters : Test(6) {
  my ($test)  = @_;
  my $class   = $test->class;
  my $fixture = LoadFile(qq($Bin/fixtures/clusters.yml));
  my $slurm   = $class->new();

  can_ok($slurm, 'cluster');
  ok(my $clusters = $slurm->clusters(), '... and can build a list of clusters');
  is(ref $clusters, 'ARRAY', '... and clusters is an ARRAY reference');
  is(scalar @{$clusters}, scalar $fixture->{clusters}, '... and count of clusters matches fixture');

  my $cluster = $clusters->first;
  is($cluster->cluster,   $fixture->{cluster},   '... and cluster name matches fixture');
  is($cluster->nodecount, $fixture->{nodecount}, '... and nodecount matches fixture');
}

1;
