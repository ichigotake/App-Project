package App::Project::Util;
use strict;
use warnings;
use utf8;
use parent qw(Exporter);

use App::Project::Logger;
use Cwd();

our @EXPORT = qw(camelize cmd edit_file slurp slurp_raw spew_raw);

sub camelize {
    my ($target) = @_;
    $target =~ s/(_|^)(.)/\u$2/g;
    return $target;
}

sub cmd {
    App::Project::Logger::infof("[%s] \$ %s\n", File::Basename::basename(Cwd::getcwd()), "@_");
    system(@_) == 0
        or App::Project::Logger::errorf("Giving up.\n");
}

sub edit_file {
    my ($file) = @_;
    my $editor = $ENV{"EDITOR"} || "vi";
    system( $editor, $file );
}

sub slurp {
    my $fname = shift;
    open my $fh, '<', $fname
        or Carp::croak("Can't open '$fname' for reading: '$!'");
    scalar do { local $/; <$fh> }
}

sub slurp_raw {
    my $fname = shift;
    open my $fh, '<:raw', $fname
        or Carp::croak("Can't open '$fname' for reading: '$!'");
    scalar do { local $/; <$fh> }
}

sub spew_raw {
    my $fname = shift;
    open my $fh, '>:raw', $fname
        or Carp::croak("Can't open '$fname' for writing: '$!'");
    print {$fh} $_[0];
}

1;

