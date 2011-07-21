package Slurm;

use Modern::Perl;
use Moose;
use Slurm::User;

has 'cluster' => (
  is       => 'ro',
  isa      => 'Str',
  required => 1
);

has 'queue' => (
  is      => 'ro',
  isa     => 'Slurm::Queue',
  lazy    => 1,
  builder => '_build_queue'
);

has 'users' => (
  traits  => ['Array'],
  is      => 'ro',
  isa     => 'ArrayRef[Slurm::User]',
  lazy    => 1,
  builder => '_build_users',
  handles => {add_to => 'push',},
);

has 'partitions' => (
  is      => 'ro',
  isa     => 'ArrayRef[Slurm::Partition]',
  lazy    => 1,
  builder => '_build_partitions',
);

has 'nodes' => (
  is      => 'ro',
  isa     => 'ArrayRef[Slurm::Node]',
  lazy    => 1,
  builder => '_build_nodes',
);

sub _build_queue {
  my ($self) = @_;
  return;
}

sub _build_users {
  my ($self) = @_;
  my @users = Slurm::User->get_all();

  foreach my $user (@users) {
    $self->users->add_to($user);
  }

  return;
}

sub _build_nodes {
  my ($self) = @_;
  return;
}

1;
