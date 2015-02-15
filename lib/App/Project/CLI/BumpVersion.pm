package App::Project::CLI::BumpVersion;
use strict;
use warnings;
use utf8;
use App::Project::BumpVersion;

sub run {
    my ($self, @args) = @_;
    my $res = App::Project::BumpVersion->new()->run(@args);
    exit 1 unless $res;
    print $res;
}

1;

