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

Readonly::Scalar my $PIPE => q{|};

Readonly::Scalar my $SCONTROL_CMD => q{/usr/bin/scontrol};
Readonly::Scalar my $SQUEUE_CMD   => q{/usr/bin/squeue};
Readonly::Scalar my $SACCTMGR_CMD => q{/usr/bin/sacctmgr};

1;
