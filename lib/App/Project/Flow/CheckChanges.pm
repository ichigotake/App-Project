package App::Project::Flow::CheckChanges;
use strict;
use warnings;
use utf8;
use ExtUtils::MakeMaker qw(prompt);

use App::Project::Util qw(edit_file slurp);
use App::Project::Logger;

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub run {
    my ($self, $project, $opts) = @_;
    $project->version or die 'Must specifies version name!';

    if ($ENV{PERL_APP_PROJECT_CHECK_CHANGE_LOG}) {
        infof("Okay, you are debugging now.\n");
        return;
    }

    until (slurp('Changes') =~ /^\{\{\$NEXT\}\}\n+[ \t]+\S/m) {
        infof("No mention of version '%s' in changelog file 'Changes'\n", $project->version);
        if (prompt("Edit file?", 'y') =~ /y/i) {
            edit_file('Changes');
        } else {
            errorf("Giving up!\n");
        }
    }
}

1;

