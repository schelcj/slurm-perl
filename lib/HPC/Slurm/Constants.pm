package HPC::Slurm::Constants;

use base qw(Exporter);
use Modern::Perl;
use Readonly;

our @EXPORT_OK   = (qw($PIPE $COMMA $PIPE_REGEXP));
our %EXPORT_TAGS = (
  all => [
    qw(
      $PIPE
      $COMMA
      $PIPE_REGEXP
      )
  ]
);

Readonly::Scalar our $PIPE  => q{|};
Readonly::Scalar our $COMMA => q{,};

Readonly::Scalar our $PIPE_REGEXP => qr{\|};

1;
