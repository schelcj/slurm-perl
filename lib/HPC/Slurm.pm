package HPC::Slurm;

use Modern::Perl;
use Moose;
use HPC::Slurm::User;
use HPC::Slurm::CLI;
use HPC::Slurm::Cluster;

has 'clusters' => (
  traits => ['Array'],
  is       => 'ro',
  isa      => 'ArrayRef[HPC::Slurm::Cluster]',
  lazy     => 1,
  builder  => '_build_clusters',
);

has 'queue' => (
  is      => 'ro',
  isa     => 'HPC::Slurm::Queue',
  lazy    => 1,
  builder => '_build_queue'
);

has 'users' => (
  traits  => ['Array'],
  is      => 'rw',
  isa     => 'ArrayRef[HPC::Slurm::User]',
  lazy    => 1,
  builder => '_build_users',
  handles => {add_to => 'push',},
);

has 'partitions' => (
  is      => 'ro',
  isa     => 'ArrayRef[HPC::Slurm::Partition]',
  lazy    => 1,
  builder => '_build_partitions',
);

has 'nodes' => (
  is      => 'ro',
  isa     => 'ArrayRef[HPC::Slurm::Node]',
  lazy    => 1,
  builder => '_build_nodes',
);

no Moose;
__PACKAGE__->meta->make_immutable;

sub _build_clusters {
  my ($self) = @_;
  return [map {HPC::Slurm::Cluster->new($_)} HPC::Slurm::CLI->get_clusters()];
}

sub _build_queue {
  my ($self) = @_;
  return;
}

sub _build_users {
  my ($self) = @_;
  my @users  = HPC::Slurm::User->get_all();

  $self->users(\@users);

  return;
}

sub _build_nodes {
  my ($self) = @_;
  return;
}

1;
