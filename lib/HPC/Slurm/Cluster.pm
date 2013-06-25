package HPC::Slurm::Cluster;

use Modern::Perl;
use Moose;

has 'classification' => (is => 'ro', isa => 'Str', required => 0);
has 'cluster'        => (is => 'ro', isa => 'Str', required => 0);
has 'controlhost'    => (is => 'ro', isa => 'Str', required => 0);
has 'controlport'    => (is => 'ro', isa => 'Int', required => 0);
has 'cpucount'       => (is => 'ro', isa => 'Int', required => 0);
has 'flags'          => (is => 'ro', isa => 'Str', required => 0);
has 'nodecount'      => (is => 'ro', isa => 'Int', required => 0);
has 'nodenames'      => (is => 'ro', isa => 'Str', required => 0);
has 'pluginidselect' => (is => 'ro', isa => 'Int', required => 0);
has 'rpc'            => (is => 'ro', isa => 'Int', required => 0);

no Moose;
__PACKAGE__->meta->make_immutable;

1;
