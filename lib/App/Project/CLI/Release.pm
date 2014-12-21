package App::Project::CLI::Release;
use strict;
use warnings;
use utf8;

use App::Project;
use App::Project::Flow::Commit;
use App::Project::Flow::Tag;

sub run {
    my ($self, $go) = @_;
    my $version = shift(@{$go->args}) or die 'Must specifies version name!';
    my $project = App::Project->new(version => $version);
    App::Project::Flow::Commit->new()->run($project, $go->opts);
    App::Project::Flow::Tag->new()->run($project, $go->opts);
}

1;

