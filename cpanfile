requires 'perl', '5.008001';
requires 'Exporter';
requires 'File::Basename';
requires 'Getopt::Long';
requires 'Module::Load';
requires 'Term::ANSIColor';
requires 'Version::Next';

on 'develop' => sub {
    requires 'App::FatPacker';
    requires 'Perl::Strip';
};

on 'test' => sub {
    requires 'Parse::CPAN::Meta', '1.4414';
    requires 'File::pushd';
    requires 'File::Temp';
    requires 'File::Which';
    requires 'Test::More', '0.98';
    requires 'Perl::Lint', '0.11';
};

