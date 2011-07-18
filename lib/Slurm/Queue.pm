package Slurm;

use Modern::Perl;
use Moose;

has 'jobs' => (
    traits  => ['Array'],
    is      => 'ro',
    isa     => 'Array[Str]',
    handles => { next_job => 'next', },
    lazy    => 1,
    builder => '_build_users',
);

sub _build_jobs {
  my ($self) = @_;
}

1;
