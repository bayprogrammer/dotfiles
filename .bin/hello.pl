#!/usr/bin/env perl

use Modern::Perl;
use experimental 'signatures';

sub hello($who = "world") {
  say("Hello, $who.");
}

hello();
hello('bob');
