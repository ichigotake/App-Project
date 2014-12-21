use strict;
use Test::More 0.98;

use_ok $_ for qw(
    App::Project
    App::Project::BumpVersion
    App::Project::CheckUntrackedFiles
    App::Project::CLI
    App::Project::CLI::BumpVersion
    App::Project::CLI::Changes
    App::Project::CLI::Release
    App::Project::CLI::Untracks
    App::Project::Errors
    App::Project::Flow::CheckChanges
    App::Project::Flow::Commit
    App::Project::Flow::RewriteChanges
    App::Project::Flow::Tag
    App::Project::Git
    App::Project::Util
    App::Project::Logger
);

done_testing;

