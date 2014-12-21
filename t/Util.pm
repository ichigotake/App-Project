package t::Util;
use strict;
use warnings;
use utf8;
use Test::More;
use File::pushd;
use File::Which qw(which);
use File::Temp qw(tempdir);
use parent qw(Exporter);

use App::Project::Git;
use App::Project::Util;

plan skip_all => "No git command" unless which('git');
plan skip_all => "No git configuration" unless `git config user.email` =~ /\@/;

our @EXPORT = (
    qw(git_init_add_commit),
    qw(tempdir pushd),
    @App::Project::Git::EXPORT, @App::Project::Util::EXPORT,
);

sub git_init_add_commit() {
    git_init();
    git_add('.');
    git_commit('-m', 'initial import');
}


1;
