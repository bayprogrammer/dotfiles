package Experimental::Signatures;

# https://www.effectiveperlprogramming.com/2015/04/use-v5-20-subroutine-signatures/
# https://docs.mojolicious.org/Mojo/Base.txt
sub import {
  require experimental;
  experimental->import('signatures');
  experimental->import('postderef');
}

sub unimport {
  experimental->unimport('signatures');
  experimental->unimport('postderef');
}

1;
