require "./Zero"

$_TYPE_OF = L{|n| $_0Car[n]}

# >> TYPE 0 : NULL
$_NULL = $_0C[$_00][$_00]
$_IsNULL = L{|n| $_0IF[$_0EQ[$_0Car[n]][$_00]][$_0TRUE][$_0FALSE]}

# >> TYPE 2 : Number
$_NUM = L{|n| $_0C[$_02][n]}



# >> TYPE 1 : TUPLE
$_T = L{|n| L{|m| $_0C[$_01][$_0C[n][m]]}}
$_FST = L{|n| $_0Car[$_0Cdr[n]]}
$_SND = L{|n| $_0Cdr[$_0Cdr[n]]}



