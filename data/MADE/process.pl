#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurp::Tiny qw(read_lines);
my @files = <d*.csv>;

my @data = ['Gen','ID','Fitness'];
for my $f (@files) {
    my ($gen, $id) = ($f =~ /(\d+)_(\d+)/);
    my @f_content = read_lines( $f );
    
    for my $l ( @f_content[1..$#f_content] ) {
      chop $l;
      my @values=split(/;/,$l);
      $values[$#values] =~ s/,/./;
      push @data, [$gen, "Id$id", $values[$#values]];
    }
    
}

say join("\n",map join(",",@$_), @data);

