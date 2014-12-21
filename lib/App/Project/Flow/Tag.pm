package App::Project::Flow::Tag;
use strict;
use warnings;
use utf8;

use App::Project::Util qw(cmd);
use App::Project::Logger;

sub run {
    my ($self, $project, $opts) = @_;
    my $version = $project->version;

    if ( $opts->{dry_run} ) {
        infof("DRY-RUN.  Would have tagged version $version.\n");
        return;
    }

    my $tag = $project->format_tag($version);
    cmd('git', 'tag', $tag);
    cmd('git', "push", 'origin', tag => $tag);
}

1;

