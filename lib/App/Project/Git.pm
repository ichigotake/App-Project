package App::Project::Git;
use strict;
use warnings;
use utf8;

use parent qw(Exporter);
use App::Project::Util;

our @EXPORT = qw(git_init git_add git_commit);

sub git_init {
    cmd('git', 'init');
}

sub git_add {
    cmd('git', 'add', @_ ? @_ : '.');
}

sub git_commit {
    cmd('git', 'commit', @_);
}

1;

