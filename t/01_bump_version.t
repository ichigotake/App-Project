use strict;
use Test::More 0.98;
use t::Util;

use App::Project::BumpVersion;

my $bump = App::Project::BumpVersion->new();

is($bump->run("1.2"), "1.2");
ok($bump->run("1.2", {validate => 1}));
ok(!$bump->run("1/2", {validate => 1}));

my $guard = pushd(tempdir());

mkdir 'Test-App';
chdir 'Test-App';
cmd('touch', 'README');
git_init_add_commit();
cmd('git', 'tag', '1.2');

is($bump->run("1.2"), 1.3);
is($bump->default_new_version("1.2"), 1.3);

done_testing;

