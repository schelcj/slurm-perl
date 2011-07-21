#!/usr/bin/perl

use FindBin;
use lib qq{$FindBin::Bin/../lib};

use Modern::Perl;
use Slurm;
use Data::Dumper;

my $slurm = Slurm->new(cluster => 'ufp');
my @users = $slurm->users();

print Dumper \@users;
