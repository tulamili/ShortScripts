#!/usr/bin/perl
use 5.018 ; use strict ; use warnings ; 
use feature qw[say] ;
use Getopt::Std ; getopts 'f', \my %o; 

my @mp3files = grep { chomp ; $_ ne q[] } <DATA> ;

for ( @mp3files ) {
	my $from = $_ ;
	s/[-]//g ; 
	s/[_+ ]/_/g ; 
	s/\.MP3$/.MP4/ ;
	my $to = $_ ; 

  my $cmd = q[] ; 
  $cmd .= "time " ;
  $cmd .= "ffmpeg -loop 1 -i green.jpg -i '$from' " ; 
  $cmd .= " -c:v libx264 -tune stillimage " ; 
  $cmd .= " -c:a aac -strict experimental " ; 
  $cmd .= " -b:a 192k -pix_fmt yuv420p " ; 
  $cmd .= " -shortest '$to' " ;

  say $cmd unless $o{f} ; 
  say "$from\t$to" if $o{f} ;	
}

=head
 　
=cut

__DATA__
1_01+02_Brexit.MP3
1_03+04_Brexit.MP3
1_05+06_Brexit.MP3
1_07+08_Brexit.MP3
1_09+10_Brexit.MP3
1_11+12_Brexit.MP3
1_13_Brexit.MP3
2-01_MayResignation.MP3
2-02_MayResignation.MP3
2-03_MayResignation.MP3
2-04_MayResignation.MP3
2-All_MayResignation.MP3
2_11_Brexit.MP3
3-ALL_Emperor Abdication.MP3
4-1-1_PrincessMichiko.MP3
4-1-2_PrincessMichiko.MP3
4-2-1_PrincessMichiko.MP3
4-2-2_PrincessMichiko.MP3
4-3-1_PrincessMichiko.MP3
4-3-2_PrincessMichiko.MP3
4-4-1_PrincessMichiko.MP3
4-4-2_PrincessMichiko.MP3
4-5-1_PrincessMichiko.MP3
4-5-2_PrincessMichiko.MP3
4-6-1_PrincessMichiko.MP3

