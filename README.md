# Plack::Mojo::Mount #

Plack::Mojo::Mount provides a simple way of mounting Mojolicious apps.

    use Plack::Mojo::Mount;
    use Mojo::Server::PSGI;

    my $secrets = [qw/one two three/];

    builder {
        mount_mojo './app1.pl' => "/u/v1", $secrets;
        mount_mojo './app2.pl' => "/l/v1", $secrets;
    };

It exports one function `mount_mojo` which takes 3 parameters:

- the path to the Mojolicious app
- the mount point
- the app secrets

And that's it.