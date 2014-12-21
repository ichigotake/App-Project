package App::Project::CLI::Changes;
use strict;
use warnings;
use utf8;
use ExtUtils::MakeMaker qw(prompt);

use App::Project::Util qw(edit_file slurp);
use App::Project::Logger;
use App::Project::CheckChanges;
use App::Project::ReleaseCommit;
use App::Project::RewriteChanges;

sub run {
    my ($self, $go) = @_;
    my $version = shift(@{$go->args}) or die 'Must specifies version name!';
    App::Project::CheckChanges->new()->run($version);
    if ($go->opts->{check} || undef) {
        return;
    }
    App::Project::RewriteChanges->new()->run($version);

}

1;

