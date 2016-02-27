#!/usr/bin/env perl
use strict;
use warnings;


# 素数を求める
# エラトステネスの篩という方法で求める
# Step1
#   検索リストに2～最大値までの整数を昇順で入れる
# Step2
#   検索リストの先頭の数を素数リストに移動し、その倍数を以降の探索リストから削除する
# Step3
#   探索が、最大値の平方根になるまで、Step2を繰り返す
# Step4
#   最大値の平方根に達したら、検索リストに残った数を、素数リストに移動する
#

print "Please input max_num： ";
chomp(my $max_num = <STDIN>);
if(!($max_num =~ /^[0-9]+$/) || $max_num <= 1) {
  # 0,1,整数以外の場合は、とりあえず、100固定で計算しておく
  $max_num = 100;
}
print "This program is calculate prime number until $max_num\n";

#
# Step1 Start
#
my @input_array = (0 .. $max_num);
my $max_calc_num = sqrt $max_num;
my @prime;

print "max calc : $max_calc_num\n";

# Step2
# 篩い落し
# 入力値から素数を取り出し、その倍数をふるい落とすためにゼロにしていく
#
#   ゼロと1と、偶数は無条件に素数から外す
#
my $ofset;
$input_array[0] = 0;
$input_array[1] = 0;
for( my $temp=4; $temp <= $max_num; $temp=$temp+2){
  $input_array[$temp] = 0;
}

#   小さい順にその累乗を素数から外していく
for( $ofset=2; $ofset <= $max_calc_num; $ofset++)
{
  if($input_array[$ofset] != 0){
    push(@prime, $input_array[$ofset]);

#    print "ofset = $ofset   array = $input_array[$ofset]\n";

    my $pow = 1;
    for( my $j = my $i = $input_array[$ofset] ; $i <= $max_num ; $i=$j*$pow)
    {
      $input_array[$i] = 0;
#      print "org = $j , pow = $pow , array = $i\n";
      $pow++;
    }
#    print " end of 2nd loop\n";
  }
#  else {
#    print "Already zero\n";
#  }
}
# Step3
#  End of check prime
print "ofset = $ofset\n";
# Step4
#  Remain number move to the prime list
#
for my $val (@input_array ) {
  if($val != 0) {
    push(@prime, $val);
  }
}
print "@prime\n";

