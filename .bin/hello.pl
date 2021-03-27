#!/usr/bin/env perl

use Modern::Perl;
use Experimental::Signatures;

sub hello($who = "world") {
  say("Hello, $who.");
}

hello();
hello('bob');
