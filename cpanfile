requires 'perl', '5.008001';
requires 'Exporter';
requires 'Getopt::Compact::WithCmd';
requires 'Version::Next';
requires 'Term::ANSIColor';
requires 'Try::Tiny';
recommends 'Win32::Console::ANSI';

on 'test' => sub {
    requires 'File::pushd';
    requires 'File::Temp';
    requires 'File::Which';
    requires 'Test::More', '0.98';
};

