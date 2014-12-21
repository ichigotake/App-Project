package App::Project::Util;
use strict;
use warnings;
use utf8;
use parent qw(Exporter);

use App::Project::Logger;

our @EXPORT = qw(camelize cmd);

sub camelize {
    my ($target) = @_;
    $target =~ s/(_|^)(.)/\u$2/g;
    return $target;
}

sub cmd {
    App::Project::Logger::infof("[%s] \$ %s\n", File::Basename::basename(Cwd::getcwd()), "@_");
    system(@_) == 0
        or App::Project::Logger::errorf("Giving up.\n");
}

1;

