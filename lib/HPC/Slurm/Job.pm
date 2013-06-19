package HPC::Slurm::Job;

use Modern::Perl;
use Moose;

has 'job_id'       => ( is => 'ro', isa => 'Str', required => 1 );
has 'user'         => ( is => 'ro', isa => 'Str', required => 1 );
has 'name'         => ( is => 'ro', isa => 'Str', required => 1 );
has 'partition'    => ( is => 'ro', isa => 'Str', required => 1 );
has 'state'        => ( is => 'ro', isa => 'Str', required => 1 );
has 'time_running' => ( is => 'ro', isa => 'Str', required => 1 );
has 'node_count'   => ( is => 'ro', isa => 'Str', required => 1 );
has 'node_list'    => ( is => 'ro', isa => 'Str', required => 1 );

no Moose;
__PACKAGE__->meta->make_immutable;

1;
