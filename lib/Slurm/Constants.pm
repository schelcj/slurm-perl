package Slurm::Constants;

use base qw(Exporter);
use Modern::Perl;
use Readonly;

our @EXPORT_OK = qw(
  $SCONTROL_CMD
  $SQUEUE_CMD
  $SACCTMGR_CMD

  $PIPE
);
our %EXPORT_TAGS = (all => [qw(
  $SCONTROL_CMD
  $SQUEUE_CMD
  $SACCTMGR_CMD

  $PIPE
)]);

Readonly::Scalar our $PIPE => qr{\|};

Readonly::Scalar our $SCONTROL_CMD => q{/usr/bin/scontrol};
Readonly::Scalar our $SQUEUE_CMD   => q{/usr/bin/squeue};
Readonly::Scalar our $SACCTMGR_CMD => q{/usr/bin/sacctmgr};

1;
