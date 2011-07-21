package Slurm::User;

use Modern::Perl;
use Moose;
use Slurm::Constants qw(:all);
use System::Command;

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
  my $cmd     = System::Command->new(qq{$SACCTMGR_CMD -P -n show user});
  my $stdout  = $cmd->stdout();

  while (<$stdout>) {
    chomp;
    my ($user, $acct, $priv) = split(/$PIPE/);

    push @users,
      __PACKAGE__->new(
      username        => $user,
      default_account => $acct,
      is_admin        => ($priv eq 'Admin') ? 1 : 0,
      );
  }

  $cmd->close();

  return wantarray ? @users : \@users;
}

1;
