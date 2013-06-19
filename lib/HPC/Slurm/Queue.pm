package HPC::Slurm::Queue;

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

no Moose;
__PACKAGE__->meta->make_immutable;

sub _build_jobs {
  my ($self) = @_;
}

1;
