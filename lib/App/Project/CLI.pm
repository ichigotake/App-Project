package App::Project::CLI;
use strict;
use warnings;
use utf8;
use Getopt::Long;
use Module::Load;
use App::Project::Errors;
use App::Project::Logger;
use App::Project::Util;

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub run {
    my ($self, @args) = @_;
    my $cmd_name = shift @args;
    if (!$cmd_name) {
        $self->show_usage();
        return;
    }
    
    local @ARGV = @args;
    my $cmd = $self->load_sub_cmd($cmd_name);
    if (!$cmd) {
        $self->show_usage();
        return;
    }
    $cmd->run(@args);
}

sub show_usage {
    print "TBD: show usage\n";
}

1;

