#!/usr/bin/perl
use 5.014 ; use strict ; use warnings ; 
use feature qw[ say ] ; 
use Getopt::Std ; getopts "cCm:ns:vV" , \my %o ; 
use Term::ANSIColor qw[ :constants ] ; $Term::ANSIColor::AUTORESET = 1 ;

$o{s} = exists $o{s} ? srand $o{s} : srand ; 

sub randperm ( $ ) { 
	my @t = split // , $_[0] ; 
	for ( 0 .. $#t ) { 
		my $x = int rand @t ;
		( $t[ $_ ], $t[ $x ] ) = ( $t[ $x ] , $t[ $_ ] ) ; 
	}
	#splice @t , $_ % @t , 0 , splice @t , rand scalar @t , 1 for 0..3*$#t ; # <-- 
	return join '' , @t ;
}


# 換字の仕方の指定
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

# マスクする(換字変換とする対象が無い場合)
my $mask = $o{m} if exists $o{m} ;


while ( <> ){ 
	chomp ; 
	my $orig = $_ ;

	my @strgs = exists $o{m} ? split /($mask)/ , $_  : ( $_ ) ;
	for ( @strgs ) { 
		next if exists $o{m} && m/$mask/; 
    	eval "y/$nums0/$nums1/" or do { say STDERR RED $orig if $@ } if $o{n} ;
    	eval "y/$vs0/$vs1/" or do { say STDERR RED $orig if $@ } if $o{v} ;
    	eval "y/$vb0/$vb1/" or do { say STDERR RED $orig if $@ } if $o{V} ;
    	eval "y/$cs0/$cs1/" or do { say STDERR RED $orig if $@ } if $o{c} ;
    	eval "y/$cb0/$cb1/" or  do { say STDERR RED $orig if $@ } if $o{C} ;#or die $@ ;
    }
    $_ = join '' , @strgs ;
	say ;
}

say STDERR REVERSE "Used random seed : " , RESET " $o{s} " ;
say STDERR REVERSE "Substituting number pattern : " , 
  RESET " $nums0 -> $nums1 , $vb0 -> $vb1 , $vs0 -> $vs1 , $cb0 -> $cb1 , $cs0 -> $cs1 " ;



## ヘルプの扱い
sub VERSION_MESSAGE {}
sub HELP_MESSAGE {
    use FindBin qw[ $Script ] ; 
    $ARGV[1] //= '' ;
    open my $FH , '<' , $0 ;
    while(<$FH>){
        s/\$0/$Script/g ;
        print $_ if s/^=head1// .. s/^=cut// and $ARGV[1] =~ /^o(p(t(i(o(ns?)?)?)?)?)?$/i ? m/^\s+\-/ : 1;
    }
    close $FH ;
    exit 0 ;
}

=encoding utf8

=head1

標準入力から文字列を読み取り、換字暗号(substituting cipher)を施した文字列を
標準出力に出力する。

  
オプション:

   -n : 数字に対して換字暗号を施す。
   -v : 小文字の母音に対して換字暗号を施す。
   -V : 大文字の母音に対して換字暗号を施す。
   -c : 小文字の子音に対して換字暗号を施す。
   -C : 大文字の子音に対して換字暗号を施す。

   -m 文字列 : 正規表現による文字列指定により、入力中に換字変換の対象としない文字列を指定する。

 =cut
