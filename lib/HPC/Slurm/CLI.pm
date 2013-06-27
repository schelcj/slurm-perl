package HPC::Slurm::CLI;

use Modern::Perl;
use IPC::System::Simple qw(capture);
use HPC::Slurm::Constants qw(:all);
use Readonly;

Readonly::Scalar my $SACCTMGR            => q{sacctmgr -n -P};
Readonly::Scalar my $SCONTROL            => q{scontrol -a -o};
Readonly::Scalar my $SHOW_CLUSTERS_CMD   => qq{$SACCTMGR show cluster};
Readonly::Scalar my $SHOW_USERS_CMD      => qq{$SACCTMGR show users};
Readonly::Scalar my $SHOW_ACCOUNTS_CMD   => qq{$SACCTMGR show accounts};
Readonly::Scalar my $SHOW_QOS_CMD        => qq{$SACCTMGR show qos};
Readonly::Scalar my $SHOW_PARTITIONS_CMD => qq{$SCONTROL show partitions};

Readonly::Array my @CLUSTER_FIELDS => (
  qw(classification cluster controlhost controlport cpucount
    flags nodecount nodenames pluginidselect rpc)
);
Readonly::Array my @USER_FIELDS    => (qw(adminlevel defaultaccount coordinators user));
Readonly::Array my @ACCOUNT_FIELDS => (qw(account description organization coordinators));
Readonly::Array my @QOS_FIELDS     => (
  qw(description gracetime grpcpumins grpcpus grpjobs grpnodes
    grpsubmitjobs grpwall maxcpumins maxcpus
    maxcpusperuser maxjobs maxnodes maxnodesperuser
    maxsubmitjobs maxwall name preempt preemptmode
    priority usagefactor)
);

sub get_clusters {
  my @clusters = _parse_cmd($SHOW_CLUSTERS_CMD, @CLUSTER_FIELDS);
  return wantarray ? @clusters : \@clusters;
}

sub get_users {
  my @users = _parse_cmd($SHOW_USERS_CMD, @USER_FIELDS);
  return wantarray ? @users : \@users;
}

sub get_accounts {
  my @accounts = _parse_cmd($SHOW_ACCOUNTS_CMD, @ACCOUNT_FIELDS);
  return wantarray ? @accounts : \@accounts;
}

sub get_qos {
  my @qos = _parse_cmd($SHOW_QOS_CMD, @QOS_FIELDS);
  return wantarray ? @qos : \@qos;
}

sub get_partitions {
  my ($self) = @_;
  my @parts  = ();

  for my $line (capture($SHOW_PARTITIONS_CMD)) {
    chomp $line;

    my $part = {};
    for my $attr (split($SPACE_REGEXP, $line)) {
      my ($name, $value) = split($EQUAL_REGEXP, $attr);
      $name =~ s/(?:CPU)/Cpu/g;
      $name =~ s/\B([A-Z](?=[a-z]))/_$1/g;
      $name =~ tr/[A-Z]/[a-z]/;

      $part->{$name} = $value;
    }

    push @parts, $part;
  }

  return wantarray ? @parts : \@parts;
}

sub _parse_cmd {
  my ($cmd, @fields) = @_;

  $cmd .= ' format=' . join($COMMA, @fields);

  my @list = ();
  for (capture($cmd)) {
    chomp;
    my %entry = ();
    @entry{@fields} = split($PIPE_REGEXP);
    push @list, \%entry;
  }

  return @list;
}

1;
