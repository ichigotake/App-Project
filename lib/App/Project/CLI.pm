package App::Project::CLI;
use strict;
use warnings;
use utf8;
use Getopt::Long;
use Getopt::Compact::WithCmd;
use Try::Tiny;
use App::Project::Errors;
use App::Project::Logger;
use App::Project::Util;

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub run {
    my ($self, @args) = @_;
    
    local @ARGV = @args;
    my @commands;
    my $p = Getopt::Compact::WithCmd->new(
        name => 'App::Project',
        version => '0.1',
        global_struct => [],
        command_struct => {
            bump_version => {
                options => [
                    [ [qw/v validate/], 'validate version format', '!', undef, { default => 0 } ],
                ],
                args => 'version',
                desc => 'bump next version',
            },
            changes => {
                options => [
                    [ [qw/c check/], 'Check can edit Changes', '!', undef, {default => 0} ],
                ],
                args => 'version',
                desc => 'Edit and commit Changes',
            },
            release => {
                args => 'version',
                desc => 'Make release tag and push',
            },
            untracks => {
                options => [
                    [ [qw/z/], "\0 line termination on output", "!", undef, { default => 0 } ],
                ],
                desc => 'Show untracked files',
            },
        },
    );

    my $cmd = $p->command || 'help';
    if ($cmd eq 'help') {
        $p->show_usage;
        exit;
    }
    my $klass = sprintf("App::Project::CLI::%s", camelize($cmd));

    ## no critic
    if (eval sprintf("require %s; 1;", $klass)) {
        try {
            $klass->run($cmd, $p->args, $p->opts);
        } catch {
            /App::Project::Error::CommandExit/ and return;
            errorf("%s\n", $_);
            exit 1;
        }
    } else {
        warnf("Could not find command '%s'\n", $cmd);
        if ($@ !~ /^Can't locate App::Project/) {
            errorf("$@\n");
        }
        exit 2;
    }
}

1;

