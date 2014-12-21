package App::Project::CheckUntrackedFiles;
use strict;
use warnings;
use utf8;

use App::Project::Logger;

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub run {
    my ($self) = @_;
    my $unk = `git ls-files -z --others --exclude-standard`;
    return split("\0", $unk);
}

1;

__END__

=encoding utf-8

=head1 NAME

App::Project::CheckUntrackedFiles

=head1 DESCRIPTION

Copy from L<Minilla::Release::CheckUntrackedFiles>.

