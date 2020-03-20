<div>
    <!-- Travis -->
    <a href="https://travis-ci.com/kiwiroy/mojo-file-role-extension">
      <img src="https://travis-ci.com/kiwiroy/mojo-file-role-extension.svg?branch=master"
           alt="Travis Build Status" />
    </a>
    <!-- Kritika -->
    <a href="https://kritika.io/users/kiwiroy/repos/3496794177012253/heads/master/">
      <img src="https://kritika.io/users/kiwiroy/repos/3496794177012253/heads/master/status.svg?type=score%2Bcoverage%2Bdeps"
           alt="Kritika Analysis Status" />
    </a>
    <!-- Coveralls -->
    <a href="https://coveralls.io/github/kiwiroy/mojo-file-role-extension?branch=master">
      <img src="https://coveralls.io/repos/github/kiwiroy/mojo-file-role-extension/badge.svg?branch=master"
           alt="Coverage Status" />
    </a>
    <!-- CPANTS -->
    <a href="https://cpants.cpanauthors.org/release/KIWIROY/Mojo-File-Role-Extension-0.02">
      <img src="https://cpants.cpanauthors.org/dist/Mojo-File-Role-Extension.svg"
           alt="CPANTS" />
    </a>
</div>

# NAME

Mojo::File::Role::Extension - Access Mojo::File filename extensions

# SYNOPSIS

    $file = Mojo::File->new('/some/path.txt')->with_roles('+Extension');
    # .txt
    $file->extension;
    # /some/path.csv
    $file->switch_extension('.csv');

# DESCRIPTION

Add file extension access and modifying behaviour to [Mojo::File](https://metacpan.org/pod/Mojo%3A%3AFile).

# METHODS

The [Mojo::File::Role::Extension](https://metacpan.org/pod/Mojo%3A%3AFile%3A%3ARole%3A%3AExtension) role adds the following methods to a
[Mojo::File](https://metacpan.org/pod/Mojo%3A%3AFile) once composed.

## extension

    # .txt
    $file->extension;

Readonly access to the file extension of the file or directory.

## extension\_parts

    # ['.tar', '.gz']
    $file->extension_parts;

Readonly access to the file extension(s) of the file or directory. The parts are
returned as a [Mojo::Collection](https://metacpan.org/pod/Mojo%3A%3ACollection) of strings.

## moniker

    # path
    $file->moniker;

Readonly access to the short name of the file, i.e. prior to the
["extension"](#extension).

## switch\_extension

    # /some/path.csv
    $file->switch_extension('.csv');

Change the extension of the [Mojo::File](https://metacpan.org/pod/Mojo%3A%3AFile), retaining the rest of the path and
return a new [Mojo::File](https://metacpan.org/pod/Mojo%3A%3AFile) object.

# COPYRIGHT & LICENSE

This library is free software. You can redistribute it and/or modify it under
the same terms as Perl itself.

# AUTHORS

Roy Storey - <kiwiroy@cpan.org>
