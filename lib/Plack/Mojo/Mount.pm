use strict;
use warnings;
package Plack::Mojo::Mount;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(mount_mojo);

use Plack::Builder;

sub mount_mojo {
    my ($app, $mount_point, $secrets) = @_;
    local $\ = "\n";
    mount $mount_point => builder {
	    my $server = Mojo::Server::PSGI->new;
	    $server->load_app($app);
	    $server->app->hook(before_dispatch => sub { shift->req->url->base->path($mount_point) });
	    $server->app->secrets($secrets);
	    $server->to_psgi_app;
	};
}

1;
