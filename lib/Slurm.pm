package Slurm;

use Modern::Perl;
use Moose;

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
  is      => 'ro',
  isa     => 'Slurm::User',
  lazy    => 1,
  builder => '_build_users',
);

sub _build_queue {
}

sub _build_users {
}

1;
