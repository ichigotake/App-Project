use strict;
use Test::More 0.98;

use_ok $_ for qw(
    App::Project
    App::Project::BumpVersion
    App::Project::CLI
    App::Project::CLI::BumpVersion
    App::Project::Errors
    App::Project::Git
    App::Project::Util
    App::Project::Logger
);

done_testing;

