package App::Project::ReleaseCommit;
use strict;
use warnings;
use utf8;

use App::Project::Util qw(find_file cmd);
use App::Project::Logger;

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub run {
    my ($self, $version, $opts) = @_;

    my @modified_files = split /\0/, `git ls-files --deleted --modified -z`;
    return if @modified_files == 0;

    my $msg = "Checking in changes prior to tagging of version $version.\n\nChangelog diff is:\n\n";
    $msg .= `git diff Changes`;

    if ($opts->{dry_run}) {
        infof("DRY-RUN.  Would have committed message of:\n----------------\n$msg\n-----------\n");
        return;
    }

    cmd('git', 'commit', '-a', '-m', $msg);

    $self->_push_to_origin();
}

sub _push_to_origin {
    my ($self) = @_;

    # git v1.7.10 is required?
    my $branch = _get_branch()
        or return;
    $branch =~ s/\n//g;
    infof("Pushing to origin\n");
    cmd('git', 'push', 'origin', $branch);
}

sub _get_branch {
    open my $fh, '<', '.git/HEAD';
    chomp( my $head = do { local $/; <$fh> });
    close $fh;

    my ($branch) = $head =~ m!ref: refs/heads/(\S+)!;
    return $branch;
}

1;

