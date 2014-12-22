requires 'perl', '5.008001';
requires 'Exporter';
requires 'Getopt::Compact::WithCmd';
requires 'Version::Next';
requires 'Term::ANSIColor';
requires 'Text::Table';
requires 'Try::Tiny';
recommends 'Win32::Console::ANSI';

on 'develop' => sub {
    requires 'App::FatPacker';
    requires 'Perl::Strip';
};

on 'test' => sub {
    requires 'File::pushd';
    requires 'File::Temp';
    requires 'File::Which';
    requires 'Test::More', '0.98';
};

