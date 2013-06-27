package HPC::Slurm::Partition;

use Modern::Perl;
use Moose;

has 'partition_name'    => (is => 'ro', isa => 'Str', required => 0);
has 'alloc_nodes'       => (is => 'ro', isa => 'Str', required => 0);
has 'allow_groups'      => (is => 'ro', isa => 'Str', required => 0);
has 'default'           => (is => 'ro', isa => 'Str', required => 0);
has 'default_time'      => (is => 'ro', isa => 'Str', required => 0);
has 'disable_root_jobs' => (is => 'ro', isa => 'Str', required => 0);
has 'grace_time'        => (is => 'ro', isa => 'Str', required => 0);
has 'hidden'            => (is => 'ro', isa => 'Str', required => 0);
has 'max_nodes'         => (is => 'ro', isa => 'Str', required => 0);
has 'max_time'          => (is => 'ro', isa => 'Str', required => 0);
has 'min_nodes'         => (is => 'ro', isa => 'Str', required => 0);
has 'nodes'             => (is => 'ro', isa => 'Str', required => 0);
has 'priority'          => (is => 'ro', isa => 'Str', required => 0);
has 'root_only'         => (is => 'ro', isa => 'Str', required => 0);
has 'req_resv'          => (is => 'ro', isa => 'Str', required => 0);
has 'shared'            => (is => 'ro', isa => 'Str', required => 0);
has 'preempt_mode'      => (is => 'ro', isa => 'Str', required => 0);
has 'state'             => (is => 'ro', isa => 'Str', required => 0);
has 'total_cpus'        => (is => 'ro', isa => 'Str', required => 0);
has 'total_nodes'       => (is => 'ro', isa => 'Str', required => 0);
has 'def_mem_per_node'  => (is => 'ro', isa => 'Str', required => 0);
has 'max_mem_per_cpu'   => (is => 'ro', isa => 'Str', required => 0);

no Moose;
__PACKAGE__->meta->make_immutable;

1;
