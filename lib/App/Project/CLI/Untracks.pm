package App::Project::CLI::Untracks;
use strict;
use warnings;
use utf8;
use App::Project::Logger;
use App::Project::CheckUntrackedFiles;

sub run {
    my ($self, $command, $args, $options) = @_;
    my @untracks = App::Project::CheckUntrackedFiles->new()->run();
    if (!@untracks) {
        my $unk = join("\n", @untracks);
        errorf("Unknown local files:\n$unk\n\nUpdate .gitignore, or git add them\n");
    }
    print join("\n", @untracks);
}

1;

