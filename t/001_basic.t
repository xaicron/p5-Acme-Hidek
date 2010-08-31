#!perl -w

use strict;
use Test::More;

use Acme::Hidek;
use Time::Piece;

my $hidek = Acme::Hidek->new();

is $hidek->age, int do { Time::Piece->localtime - Time::Piece->strptime('1970-09-02', '%Y-%m-%d') }->years;

is $hidek->birthdate->year,  1970;
is $hidek->birthdate->mon,      9;
is $hidek->birthdate->mday,     2;

{
    close STDOUT;
    open STDOUT, '>', \my $buff;
    $hidek->we_love_hidek();
    close STDOUT;

    is $buff, "We love hidek!\n" x ($hidek->age * 100);
}

done_testing;
