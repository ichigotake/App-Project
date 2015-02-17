[![Build Status](https://travis-ci.org/ichigotake/App-Project.svg?branch=master)](https://travis-ci.org/ichigotake/App-Project)
# NAME

App::Project - \[DRAFT\] Generic authoring tool(not only for perl project).

# SYNOPSIS

    project changes      - Ready to change log for release
    project untracks     - Show untracked files
    project dist         - (not yet) Make your dist tarball
    project migrate      - (not yet) Set up your project ready for this tool
    project release      - Make release tag and push
    project bump_version - Bump version for next release
    project script       - (not yet) Output raw script source to stdout

# THIS IS DRAFT

I'm going to implements this modules.

And thinking about this name because [App::Project](https://metacpan.org/pod/App::Project) naming is uncool name :(

# DESCRIPTION

App::Project is a application authoring tool. App::Project provides _project_ command as authoring tool for application project.

App::Project is not only for Perl project.

App::Project inspire of Minilla(as CPAN module auhtoring tool).

**THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE**.

# GETTING STARTED

    # First time only
    # TODO: Provide fat pack tool
    % curl -L http://tinyurl.com/p5-app-project > bin/project
    % wget http://tinyurl.com/p5-app-project 
    # App::Project has only a few deps. It should be very quick
    # Make a new distribution
    % cd /path/to/App/
    % project migrate
    # Git commit
    % git commit -m "initial commit"
    # Hack your code!
    % $EDITOR lib/YourCode
    # Done? Test and release it!
    # Make L<git tag && git push> and update change log for release
    % project release

It's that easy.

# NOTE

## Why made?

I need generic authoring tool. (e.g. Android application, HTML5 application, and other)

I was impressed [Minilla](https://metacpan.org/pod/Minilla). And I decide make this project.

## Why Perl?

Perl script is high portability, A lot of operation system is installed Perl. 

Make simple script with comparative ease. I don't have plan to be complex interfaces ;)

## App::Project is built on small libraries.

App::Project is built on only few small libraries. You can install App::Project without a huge list of dependencies to heavy modules.

And dependencies are pure perl or perl core(5.12.0+) only, because to higher portability for _wrapper_ script.

# LICENSE

Copyright (C) ichigotake.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ichigotake <ichigotake.san@gmail.com>

# SEE ALSO

- [Minilla](https://metacpan.org/pod/Minilla)
