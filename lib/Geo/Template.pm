package Geo::Template;

=head1 NAME

Geo::Template - Not a real package but a template for your Geo:: functions.

=head1 SYNOPSIS

  use Geo::Template;
  my $obj = Geo::Template->new();
  print "A=", $obj->A, "\n";

=head1 DESCRIPTION

This package is not a real package but an example of how to package your Geo:: functions in a package.

=cut

use strict;
use vars qw($VERSION);
use Geo::Constants qw{PI};
use Geo::Functions qw{rad_deg deg_rad};

$VERSION = sprintf("%d.%02d", q{Revision: 0.01} =~ /(\d+)\.(\d+)/);

=head1 CONSTRUCTOR

=head2 new

The new() constructor may be called with any parameter that is appropriate to the ellipsoid method which establishes the ellipsoid.

  my $obj = Geo::Template->new(); #default "WGS84"

=cut

sub new {
  my $this = shift();
  my $class = ref($this) || $this;
  my $self = {};
  bless $self, $class;
  $self->initialize(@_);
  return $self;
}

=head1 METHODS

=cut

sub initialize {
  my $self = shift();
  my $param = shift()||undef();
  $self->ellipsoid($param);
  #add custom initialization scripts here
}

=head2 ellipsoid

Method to set or retrieve the current ellipsoid object.  The ellipsoid is a Geo::Ellipsoids object.

  my $ellipsoid=$obj->ellipsoid;  #Default is WGS84

  $obj->ellipsoid('Clarke 1866'); #Built in ellipsoids from Geo::Ellipsoids
  $obj->ellipsoid({a=>1});        #Custom Sphere 1 unit radius

=cut

sub ellipsoid {
  my $self = shift();
  if (@_) {
    my $param=shift();
    use Geo::Ellipsoids;
    my $obj=Geo::Ellipsoids->new($param);
    $self->{'ellipsoid'}=$obj;
  }
  return $self->{'ellipsoid'};
}

=head2 A

Example method...

  my $A=$obj->A;

=cut

sub A {
  my $self = shift();
  my $ellipsoid=$self->ellipsoid;
  return $ellipsoid->a;
}

1;

__END__

=head1 TODO

=head1 BUGS

Please send to the geo-perl email list.

=head1 LIMITS

=head1 AUTHOR

Michael R. Davis qw/perl michaelrdavis com/

=head1 LICENSE

Copyright (c) 2006 Michael R. Davis (mrdvt92)

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO
