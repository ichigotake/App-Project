use strict;
use warnings;
use Test::More;
use t::Util;

use App::Project::CheckUntrackedFiles;

my $checker = App::Project::CheckUntrackedFiles->new();

my $guard = pushd(tempdir());

mkdir 'Test-App';
chdir 'Test-App';
cmd('touch', 'README');

is(scalar($checker->run()), 0);

git_init_add_commit();
cmd('touch', 'Changes');
cmd('touch', 'LICENSE');

is(scalar($checker->run()), 2);

done_testing();

