#!/usr/bin/perl
use 5.014 ; use strict ; use warnings ; 
use feature qw[ say ] ; 
use Getopt::Std ; getopts "cCns:vV" , \my %o ; 
use Term::ANSIColor qw[ :constants ] ; $Term::ANSIColor::AUTORESET = 1 ;

$o{s} = exists $o{s} ? srand $o{s} : srand ; 

sub randperm ( $ ) { 
	my @t = split // , $_[0] ; 
	splice @t , $_ % @t , 0 , splice @t , rand scalar @t , 1 for 0..3*$#t ; # <-- 
	return join '' , @t ;
}

my $nums0 = "0123456789" ; 
my $nums1 = $o{n} ?  randperm  $nums0  : $nums0 ;

my $vs0 = "aiueo" ;
my $vs1 = $o{v} ?  randperm $vs0 : $vs0 ; 
my $vb0 = "AIUEO" ;
my $vb1 = $o{V} ?  randperm $vb0 : $vb0 ; 

my $cs0 = "bcdfghjklmnpqrstvwxyz" ;
my $cs1 = $o{c} ?  randperm $cs0 : $cs0 ; 
my $cb0 = "BCDFGHJKLMNPQRSTVWXYZ" ;
my $cb1 = $o{C} ?  randperm $cb0 : $cb0 ; 
#say $cb1; exit ;

while ( <> ){ 
	chomp ; 
	my $orig = $_ ;
    eval "y/$nums0/$nums1/" or do { say STDERR RED $_, $@ };
    eval "y/$vs0/$vs1/" or do { say STDERR RED $_, $@ };
    eval "y/$vb0/$vb1/" or do { say STDERR RED $_, $@ };
    eval "y/$cs0/$cs1/" or do { say STDERR RED $_, $@ };
    eval "y/$cb0/$cb1/" or  do { say STDERR RED $_, $@ };#or die $@ ;
	say ;
}

say STDERR REVERSE "Used random seed : " , RESET " $o{s} " ;
say STDERR REVERSE "Substituting number pattern : " , RESET " $nums1" ;



