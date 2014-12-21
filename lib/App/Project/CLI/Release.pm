package App::Project::CLI::Release;
use strict;
use warnings;
use utf8;

use App::Project::ReleaseCommit;
use App::Project::Tag;

sub run {
    my ($self, $go) = @_;
    my $version = shift(@{$go->args}) or die 'Must specifies version name!';
    App::Project::ReleaseCommit->new()->run($version);
    App::Project::Tag->new()->run($version);
}

1;

