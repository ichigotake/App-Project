package App::Project::Tag;
use strict;
use warnings;
use utf8;

use App::Project::Util qw(cmd);
use App::Project::Logger;

sub run {
    my ($self, $version, $opts) = @_;

    if ( $opts->{dry_run} ) {
        infof("DRY-RUN.  Would have tagged version $version.\n");
        return;
    }

    my $tag = $project->format_tag($version);
    cmd('git', 'tag', $tag);
    cmd('git', "push", 'origin', tag => $tag);
}

1;

