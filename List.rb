require "./Number"

# --------- 5 ---------

# >> TYPE 0 : NULL
$_NULL = $_C[$_0][$_0]

$_IsNULL = L{|n| $_IF[$_EQ[$_Car[n]][$_0]][$_TRUE][$_FALSE]}

# >> TYPE 1 : PAIR
$_P = L{|n| L{|m| $_C[$_1][$_C[n][m]]}}
$_PA = L{|n| $_Car[$_Cdr[n]]}
$_PD = L{|n| $_Cdr[$_Cdr[n]]}

# >> TYPE 2 : Number
$_NUM = L{|n| $_C[$_2][n]}

$_TYPE_OF = L{|n| $_Car[n]}


_LEN0 = L{|s| L{|l| $_IF[$_IsNULL[l]][$_0][$_Add1[ L{|g| s[$_PD[l]][g] } ]]}}
$_LEN = $_Y[_LEN0]

$_TAIL = L{|n| $_P[n][$_NULL]}
$_HEAD = $_NULL
_LIST0 = L{|s| L{|l| L{|p| $_IF[$_IsNULL[p]][l][s[$_P[p][l]]]}}}
$_LIST = $_Y[_LIST0]
