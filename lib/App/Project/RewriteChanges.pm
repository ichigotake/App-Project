package App::Project::RewriteChanges;
use strict;
use warnings;
use utf8;
use App::Project::Util qw(slurp_raw spew_raw current_time);

sub new {
    my $class = shift;
    return bless {@_}, $class;
}

sub run {
    my ($self, $version) = @_;

    my $content = slurp_raw('Changes');
    my $current_time = current_time();
    $content =~ s!\{\{\$NEXT\}\}!
        "{{\$NEXT}}\n\n" . $version . " " . $current_time->strftime('%Y-%m-%dT%H:%M:%SZ')
        !e;
    spew_raw('Changes' => $content);
}


1;

