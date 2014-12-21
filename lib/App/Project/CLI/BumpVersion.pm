package App::Project::CLI::BumpVersion;
use strict;
use warnings;
use utf8;
use App::Project::BumpVersion;
use version;

sub run {
    my ($self, $command, $args, $options) = @_;
    my $version = shift(@$args) // undef;
    my $res = App::Project::BumpVersion->new()->run($version, $options);
    exit 1 unless $res;
    print $res;
}

1;

