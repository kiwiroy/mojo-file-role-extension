package Mojo::File::Role::Extension;

use Mojo::Base -role, -signatures;
use Mojo::Collection 'c';

our $VERSION = '0.01';

requires 'path';

sub extension ($self) {
  return _basename_parse($self, 1);
}

sub extension_parts ($self) {
  return c(split /(?=\.)/ => _basename_parse($self, 1));
}

sub moniker ($self) {
  return _basename_parse($self);
}

sub switch_extension ($self, $suffix = '') {
  return $self->sibling(join '' => _basename_parse($self), $suffix);
}

sub _basename_parse ($self, $extension = 0) {
  my $base = $self->basename;
  my $idx  = $extension ? 2 : 0;
  require File::Basename;
  return (File::Basename::fileparse($base, qr/((\.[^\.]+)+)$/))[$idx];
}

1;

=encoding utf8

=head1 NAME

Mojo::File::Role::Extension - Access Mojo::File filename extensions

=head1 SYNOPSIS

  $file = Mojo::File->new('/some/path.txt')->with_roles('+Extension');
  # .txt
  $file->extension;
  # /some/path.csv
  $file->switch_extension('.csv');

=head1 DESCRIPTION

Add file extension access and modifying behaviour to L<Mojo::File>.

=head1 METHODS

The L<Mojo::File::Role::Extension> role adds the following methods to a
L<Mojo::File> once composed.

=head2 extension

  # .txt
  $file->extension;

Readonly access to the file extension of the file or directory.

=head2 extension_parts

  # ['.tar', '.gz']
  $file->extension_parts;

Readonly access to the file extension(s) of the file or directory. The parts are
returned as a L<Mojo::Collection> of strings.

=head2 moniker

  # path
  $file->moniker;

Readonly access to the short name of the file, i.e. prior to the
L</"extension">.

=head2 switch_extension

  # /some/path.csv
  $file->switch_extension('.csv');

Change the extension of the L<Mojo::File>, retaining the rest of the path and
return a new L<Mojo::File> object.

=cut
