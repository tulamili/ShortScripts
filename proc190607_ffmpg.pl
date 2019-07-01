#!/usr/bin/perl
use 5.018 ; use strict ; use warnings ; 
use feature qw[say] ;
use Getopt::Std ; getopts 'fgn', \my %o; 

my @mp3files = grep { chomp ; $_ ne q[] } <DATA> ;

my $N = $o{n} ? "\\\n" : '' ;

for ( @mp3files ) {
	my $from = $_ ;
	#$from =~ s/\ /\\ /g ;
	s/[-]//g ; 
	s/[_+ ]/_/g ; 
	s/\.MP3$/.MP4/ ;
	s/\.mp3$/.mp4/i ;
	my $to = $_ ; 

  my $cmd = q[] ; 
  $cmd .= "time " ;
  $cmd .= qq[ffmpeg -loop 1 -i green.jpg -i "$from" $N] ; 
  $cmd .= " -c:v libx264 -tune stillimage " ; 
  $cmd .= " -c:a aac -strict experimental " ; 
  $cmd .= " -b:a 192k -pix_fmt yuv420p " ; 
  $cmd .= " -shortest '$to'$N" ;

  say $cmd if $o{g} ; 
  say "$from\t$to" if $o{f} ;	
}

=head
 　


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


001 01_NEWS DIGEST Vol. 78 Title.mp3
002 02_Feature1_Emperor Naruhito’s reign begins.mp3
003 03_Feature2_The last o-kotoba by Emperor Akihito.mp3
004 04_Feature3_Will new emperor offer something new-.mp3
005 05_Archive_-1_Emperor declares enthronement.mp3
006 06_Archive_-2_Career diplomat, 29, chosen as future bride.mp3
007 07_Listening_Unit 1_92-year-old Olympics superfan gears up for Tokyo 2020.mp3
008 08_Listening_Unit 2_South Koreans fight smog their own way- with pork.mp3
009 09_Listening_Unit 3_U.S. women’s soccer team sues for discrimination.mp3
010 10_Listening_Unit 4_Doctolib ‘unicorn’ bets on video doctors.mp3
011 11_Reading_STEP 1_Unit 5_Two held over wagyu sperm, egg smuggling.mp3
012 12_Reading_STEP 1_Unit 5_Vocabulary Check.mp3
013 13_Reading_STEP 1_Unit 6_Emperor begins series of rites for succession.mp3
014 14_Reading_STEP 1_Unit 6_Vocabulary Check.mp3
015 15_Reading_STEP 1_Unit 7_Overtime caps to come into force.mp3
016 16_Reading_STEP 1_Unit 7_Vocabulary Check.mp3
017 17_Reading_STEP 1_Unit 8_Massive ￥100,000 burger marks new era.mp3
018 18_Reading_STEP 1_Unit 8_Vocabulary Check.mp3
019 19_Reading_STEP 2_Unit 9_Japan and EU free trade pact goes into force.mp3
020 20_Reading_STEP 2_Unit 9_Vocabulary Check.mp3
021 21_Reading_STEP 2_Unit 10_Henoko opponents eye next stage in fight.mp3
022 22_Reading_STEP 2_Unit 10_Vocabulary Check.mp3
023 23_Reading_STEP 2_Unit 11_N.Z. leader vows action on guns.mp3
024 24_Reading_STEP 2_Unit 11_Vocabulary Check.mp3
025 25_Reading_STEP 2_Unit 12_Gengo- Japan’s bookmarks for politics and history.mp3
026 26_Reading_STEP 2_Unit 12_Vocabulary Check.mp3
027 27_Reading_STEP 3_Unit 13_2020 Games spin incenses evacuees.mp3
028 28_Reading_STEP 3_Unit 13_Vocabulary Check.mp3
029 29_Reading_STEP 3_Unit 14_Ichiro’s remarkable baseball journey.mp3
030 30_Reading_STEP 3_Unit 14_Vocabulary Check.mp3
031 31_Reading_STEP 3_Unit 15_Europe aghast at Brexit morass.mp3
032 32_Reading_STEP 3_Unit 15_Vocabulary Check.mp3
033 33_Interview with Donald Keene 1- A life lived true to the words.mp3
034 34_Interview with Donald Keene 2- A life lived true to the words.mp3



2_12_Economist20190601_Brexit.MP3
3-ALL_Emperor Abdication.MP3
5_1+2_NZ Guns.MP3
5_1-NZ Guns.MP3
5_2_NZ Guns.MP3
5_3+4+5+6+7_NZ Guns.MP3
5_8_Ardern Speech.MP3
5_All_Gun.MP3
6-1-Slow- US Abortion.MP3
6-2-US Abortion.MP3
6_1-Normal-US Abortion.MP3
7_SriLanka.MP3
8_HongKong.MP3
=cut 

__DATA__
2_12_1-Economist20190601_Brexit.MP3
2_12_2-Economist20190601_Brexit.MP3
2_12_3-Economist20190601_Brexit.MP3
2_12_4-Economist20190601_Brexit.MP3
2_12_5-Economist20190601_Brexit.MP3
5_8_Ardern Speech.MP3
6-1-Slow- US Abortion.MP3
6-2-US Abortion.MP3
6_1-Normal-US Abortion.MP3
7_SriLanka.MP3
8_HongKong.MP3
9_Normal-PensionFears.MP3
9_Slow-PensionFears.MP3
