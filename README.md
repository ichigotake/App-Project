# NAME

App::Release - \[DRAFT\] Generic authoring tool(not only for perl project).

# SYNOPSIS

    project changes - Ready to change log for release
    project dist    - Make your dist tarball
    project migrate - Set up your project ready for this tool
    project release - Ready to release your project
    project version - Bump version with interactive interface
    project wrapper - Install this command line tool in your project

# THIS IS DRAFT AND I HAVE QUESTION

I'm going to implements this modules.

And thinking about this name because [App::Project](http://search.cpan.org/perldoc?App::Project) naming is uncool name :(

__If you know a cool generic authoring tool, Please contact me!__

# DESCRIPTION

App::Release is a application authoring tool. App::Release provides _project_ command for authoring a application project.

App::Release is not only for Perl project.

App::Release inspire of Minilla(as CPAN module auhtoring tool).

__THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE__.

# GETTING STARTED

    # First time only
    # TODO: Provide fat pack tool
    % cpanm App::Release
    # App::Release has only a few deps. It should be very quick
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
    % project wrapper > bin/script.sh



It's that easy.

# NOTE

## Why made?

I need generic authoring tool. (e.g. Android application, HTML5 application, and other)

I was impressed [Minilla](http://search.cpan.org/perldoc?Minilla). And I decide make this project.

## Why Perl?

Perl script is high portability, A lot of operation system is installed Perl. 

Make simple script with comparative ease. I don't have plan to be complex interfaces ;)

## App::Release is built on small libraries.

App::Release is built on only few small libraries. You can install App::Release without a huge list of dependencies to heavy modules.

And dependencies are pure perl or perl core(5.8.8+) only, because to higher portability for _wrapper_ script.

# LICENSE

Copyright (C) ichigotake.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ichigotake <ichigotake.san@gmail.com>

# SEE ALSO

- [Minilla](http://search.cpan.org/perldoc?Minilla)
