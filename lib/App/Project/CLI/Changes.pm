package App::Project::CLI::Changes;
use strict;
use warnings;
use utf8;

use App::Project;
use App::Project::Flow::CheckChanges;
use App::Project::Flow::RewriteChanges;
use App::Project::Logger;

sub run {
    my ($self, $go) = @_;
    my $version = shift(@{$go->args}) or die 'Must specifies version name!';
    my $project = App::Project->new(version => $version);
    App::Project::Flow::CheckChanges->new()->run($project, $go->opts);
    if ($go->opts->{check} || undef) {
        return;
    }
    App::Project::Flow::RewriteChanges->new()->run($project, $go->opts);

}

1;

