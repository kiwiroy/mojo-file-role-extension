# -*- mode: perl; -*-
use Mojo::Base -strict;
use Test::More;
use Mojo::File 'path';
use Role::Tiny;

{
    # setup only for gist.
    my $setup = path('lib/Mojo/File/Role/Extension.pm')
        ->tap(sub { $_->dirname->make_path });
    symlink path('Extension.pm')->to_rel($setup->dirname) => $setup
        unless -l $setup or -e _;
}


my $file;

# apply role
$file = path '/tmp/preferred-name.ext';
$file->with_roles('+Extension');
is Role::Tiny::does_role($file, 'Mojo::File::Role::Extension'), 1,
    'role applied';

# moniker and extension
is $file->moniker, 'preferred-name', 'correct short name';
is $file->extension, '.ext', 'correct extension';

# directory
$file = path('/etc/directory.d/')->with_roles('+Extension');
is $file->moniker, 'directory', 'directories have suffices too';
is $file->extension, '.d', 'extension';

# change extension - new Mojo::File object
$file = path('./Mojo-File-Role-Extension-0_1.tar')->with_roles('+Extension');
my $no_ext = $file->switch_extension;
is $no_ext->extension, '', 'empty';
is $no_ext, './Mojo-File-Role-Extension-0_1', 'full name';
my $tar_gz = $file->switch_extension('.tar.gz');
is $tar_gz->extension, '.tar.gz', 'correct extension';
is $no_ext->switch_extension('.tar.gz'), $tar_gz, 'same';

done_testing;
