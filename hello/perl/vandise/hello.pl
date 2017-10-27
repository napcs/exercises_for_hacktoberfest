 #!/usr/bin/perl
 use strict;
 use warnings;
 use v5.10; 

 print "What is your name? ";
 
 my $name = <STDIN>;
 chomp $name;
 
 say "Hello $name!";