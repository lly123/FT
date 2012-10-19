require "./Zero"

$_TYPE_OF = L{|n| $_Car[n]}

# >> TYPE 0 : NULL
$_NULL = $_C[$_0][$_0]
$_IsNULL = L{|n| $_IF[$_EQ[$_Car[n]][$_0]][$_TRUE][$_FALSE]}

# >> TYPE 2 : Number
$_NUM = L{|n| $_C[$_2][n]}



# >> TYPE 1 : TUPLE
$_T = L{|n| L{|m| $_C[$_1][$_C[n][m]]}}
$_FST = L{|n| $_Car[$_Cdr[n]]}
$_SND = L{|n| $_Cdr[$_Cdr[n]]}



