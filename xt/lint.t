use strict;
use warnings;
use Perl::Lint;

my $targets = [qw(
    lib/App/Project.pm
    lib/App/Project/BumpVersion.pm
    lib/App/Project/CheckUntrackedFiles.pm
    lib/App/Project/CLI.pm
    lib/App/Project/CLI/BumpVersion.pm
    lib/App/Project/CLI/Changes.pm
    lib/App/Project/CLI/Release.pm
    lib/App/Project/CLI/Untracks.pm
    lib/App/Project/Errors.pm
    lib/App/Project/Flow/CheckChanges.pm
    lib/App/Project/Flow/Commit.pm
    lib/App/Project/Flow/RewriteChanges.pm
    lib/App/Project/Flow/Tag.pm
    lib/App/Project/Git.pm
    lib/App/Project/Util.pm
    lib/App/Project/Logger.pm
)];

my $linter = Perl::Lint->new;
my $viotasions = $linter->lint($targets);

use Data::Dumper;
print Dumper($viotasions);

