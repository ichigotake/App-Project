package App::Project::CLI::Changes;
use strict;
use warnings;
use utf8;

use Getopt::Long;
use App::Project;
use App::Project::Flow::CheckChanges;
use App::Project::Flow::RewriteChanges;
use App::Project::Logger;

sub run {
    my ($self, @args) = @_;
    local @ARGV = @args;
    my $dry_run;
    GetOptions("dry-run!" => $dry_run);
    my $version = shift(@args) or die 'Must specifies version name!';
    my $project = App::Project->new(version => $version);
    App::Project::Flow::CheckChanges->new()->run($project, \@args);

    if ($dry_run) {
        return;
    }
    App::Project::Flow::RewriteChanges->new()->run($project, \@args);

}

1;

