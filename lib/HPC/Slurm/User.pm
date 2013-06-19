package HPC::Slurm::User;

use Modern::Perl;
use Moose;
use HPC::Slurm::Constants qw(:all);

has 'username' => (
  is       => 'ro',
  isa      => 'Str',
  required => 1,
);

has 'default_account' => (
  is       => 'ro',
  isa      => 'Str',
  required => 1,
);

has 'is_admin' => (
  traits  => ['Bool'],
  is      => 'rw',
  isa     => 'Bool',
  default => 0,
);

no Moose;
__PACKAGE__->meta->make_immutable;

sub get_all {
  my ($class) = @_;
  my @users   = ();

  push @users, __PACKAGE__->new(
    username        => 'foo',
    default_account => 'bar',
    is_admin        => 0,
  );


  return wantarray ? @users : \@users;
}

1;
