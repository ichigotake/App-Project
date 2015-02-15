package App::Project::CLI::Release;
use strict;
use warnings;
use utf8;

use Getopt::Long;
use App::Project;
use App::Project::Flow::Commit;
use App::Project::Flow::Tag;
use App::Project::Logger;

sub run {
    my ($self, @args) = @_;
    my $version = shift(@args) or die 'Must specifies version name!';
    my $dry_run;
    my $res = GetOptions("dry-run!" => \$dry_run);
    if ($dru_run) {
        infof("DRY-RUN.  Would have tagged version $ver.\n");
        return;
    }
    my $project = App::Project->new(version => $version);
    App::Project::Flow::Commit->new()->run($project, {@args});
    App::Project::Flow::Tag->new()->run($project, {@args});
}

1;

