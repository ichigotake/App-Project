package App::Project;
use 5.008001;
use strict;
use warnings;
use version; our $VERSION = version->declare("v0.0.0");

use Time::Piece qw(gmtime);

our $DEBUG;

sub debug { $DEBUG }

sub new {
    my ($class, @args) = @_;
    my $self = bless {@args}, $class;
    $self->{version} // die 'Must specifies version!';
    $self->{changes_time} = scalar(gmtime());
    return $self;
}

sub version { return shift->{version}; }

sub changes_time { return shift->{changes_time}; }

1;
__END__

=encoding utf-8

=head1 NAME

App::Project - [DRAFT] Generic authoring tool(not only for perl project).

=head1 THIS PROJECT IS DEAD

**I don't continuous this project.**

Some one advise to me, He said If you may need high portability generic CLI tool, write as Go lang is better.

I will port to Go lang because App::Project goal is high portability generic authoring tool.

=head1 SYNOPSIS

    project changes      - Ready to change log for release
    project untracks     - Show untracked files
    project dist         - (not yet) Make your dist tarball
    project migrate      - (not yet) Set up your project ready for this tool
    project release      - Make release tag and push
    project bump_version - Bump version for next release
    project wrapper      - (not yet) Install this command line tool in your project

=head1 THIS IS DRAFT

I'm going to implements this modules.

And thinking about this name because L<App::Project> naming is uncool name :(

=head1 DESCRIPTION

App::Project is a application authoring tool. App::Project provides I<project> command as authoring tool for application project.

App::Project is not only for Perl project.

App::Project inspire of Minilla(as CPAN module auhtoring tool).

B<THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE>.

=head1 GETTING STARTED

    # First time only
    # TODO: Provide fat pack tool
    % cpanm App::Project
    # App::Project has only a few deps. It should be very quick
    # Make a new distribution
    % cd /path/to/App/
    % project migrate
    # Git commit
    % git commit -m "initial commit"
    # Hack your code!
    % $EDITOR lib/YourCode
    # Done? Test and release it!
    # Make L<git tag> and update change log for release
    % project release
    # Need more portability tool? We provide to generate L<>
    % project wrapper > bin/project


It's that easy.

=head1 NOTE

=head2 Why made?

I need generic authoring tool. (e.g. Android application, HTML5 application, and other)

I was impressed L<Minilla>. And I decide make this project.

=head2 Why Perl?

Perl script is high portability, A lot of operation system is installed Perl. 

Make simple script with comparative ease. I don't have plan to be complex interfaces ;)

=head2 App::Project is built on small libraries.

App::Project is built on only few small libraries. You can install App::Project without a huge list of dependencies to heavy modules.

And dependencies are pure perl or perl core(5.12.0+) only, because to higher portability for I<wrapper> script.

=head1 LICENSE

Copyright (C) ichigotake.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ichigotake E<lt>ichigotake.san@gmail.comE<gt>

=head1 SEE ALSO

=item1 L<Minilla>

=cut

