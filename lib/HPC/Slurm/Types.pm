package HPC::Slurm::Types;

use Modern::Perl;
use MooX::Types::MooseLike;
use HPC::Slurm::Constants qw(:all);
use base qw(Exporter);

our @EXPORT_OK = ();

my $types = [
  {
    name    => 'Str',
    test    => sub {$_[0] =~ /[[:print:]]/},
    message => sub {"$_[0] is not a valid string"}
  },
  {
    name    => 'Bool',
    test    => sub {$_[0] == $TRUE or $_[0] == $FALSE},
    message => sub {"$_[0] is not a boolean value"},
  }
];

MooX::Types::MooseLike::register_types($types, __PACKAGE__);

1;
