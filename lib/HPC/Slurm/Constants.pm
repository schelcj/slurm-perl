package HPC::Slurm::Constants;

use base qw(Exporter);
use Modern::Perl;
use Readonly;

our @EXPORT_OK   = (qw($PIPE $COMMA $EQUAL $SPACE $PIPE_REGEXP $EQUAL_REGEXP $SPACE_REGEXP));
our %EXPORT_TAGS = (
  all => [
    qw(
      $PIPE
      $COMMA
      $EQUAL
      $SPACE
      $PIPE_REGEXP
      $EQUAL_REGEXP
      $SPACE_REGEXP
      )
  ]
);

Readonly::Scalar our $PIPE  => q{|};
Readonly::Scalar our $COMMA => q{,};
Readonly::Scalar our $EQUAL => q{=};
Readonly::Scalar our $SPACE => q{ };

Readonly::Scalar our $PIPE_REGEXP  => qr{\|};
Readonly::Scalar our $EQUAL_REGEXP => qr{\=};
Readonly::Scalar our $SPACE_REGEXP => qr{\s};

1;
