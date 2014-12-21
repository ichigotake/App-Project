package App::Project::Errors;
use strict;
use warnings;
use utf8;

use Carp ();

package App::Project::Error::CommandExit;

use overload '""' => 'message', fallback => 1;

sub throw {
    my ($class, $body) = @_;
    my $self = bless { body => $body, message => Carp::longmess($class) }, $class;
    die $self;
}

sub body { shift->{body} }

sub message {
    my($self) = @_;
    return $self->{message};
}

1;

