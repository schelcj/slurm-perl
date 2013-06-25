#!/usr/bin/env perl

use FindBin qw($Bin);
use lib qq($Bin/units);
use lib qq($Bin/../lib);

use Test::HPC::Slurm;
#use Test::HPC::Slurm::Cluster;

Test::Class->runtests();
