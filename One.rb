require "./Zero"

$_TYPE_OF = L{|n| $_0Car[n]}

_VAL = L{|n| $_0Cdr[n]}

# >> TYPE 0 : NULL
$_NULL = $_0C[$_00][$_00]
$_IsNULL = L{|n| $_0IF[$_0EQ[$_0Car[n]][$_00]][$_TRUE][$_FALSE]}

# >> TYPE 2 : Number
$_NUM = L{|n| $_0C[$_02][n]}
$_IsNUM = L{|n| $_0IF[$_0EQ[$_02][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}

_BOTH_NUM = L{|n| L{|m| $_AND[$_IsNUM[n]][$_IsNUM[m]]}}

$_Add1 = L{|n| $_IF[$_IsNUM[n]][$_NUM[$_0Add1[_VAL[n]]]][$_NULL] }
$_Add = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][$_NUM[$_0Add[_VAL[n]][_VAL[m]]]][$_NULL]}}

$_EQ = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][$_0EQ[_VAL[n]][_VAL[m]]][$_NULL]}}
$_LT = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][$_0LT[_VAL[n]][_VAL[m]]][$_NULL]}}
$_GT = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][$_0GT[_VAL[n]][_VAL[m]]][$_NULL]}}

$_IsZero = L{|n| $_EQ[n][$_0]}

# >> Type 3 : Boolean
_BOOL = L{|n| $_0C[$_03][n]}
$_TRUE = _BOOL[$_0TRUE]
$_FALSE = _BOOL[$_0FALSE]

_IsBOOL = L{|n| $_0IF[$_0EQ[$_03][$_TYPE_OF[n]]][$_0TRUE][$_0FALSE]}
$_IF = L{|b| L{|m| L{|n| $_0IF[_IsBOOL[b]][$_0IF[_VAL[b]][m][n]][$_NULL]}}}

$_AND = L{|x| L{|y| $_0IF[$_0AND[_IsBOOL[x]][_IsBOOL[y]]][_BOOL[$_0AND[_VAL[x]][_VAL[y]]]][$_NULL]}}
$_OR = L{|x| L{|y| $_0IF[$_0AND[_IsBOOL[x]][_IsBOOL[y]]][_BOOL[$_0OR[_VAL[x]][_VAL[y]]]][$_NULL]}}
$_NOT = L{|x| $_0IF[_IsBOOL[x]][_BOOL[$_0NOT[_VAL[x]]]][$_NULL]}

# >> TYPE 1 : TUPLE
$_T = L{|n| L{|m| $_0C[$_01][$_0C[n][m]]}}
$_IsTUPLE = L{|n| $_0IF[$_0EQ[$_0Car[n]][$_01]][$_TRUE][$_FALSE]}

$_FST = L{|n| $_0Car[$_0Cdr[n]]}
$_SND = L{|n| $_0Cdr[$_0Cdr[n]]}

$_0 = $_NUM[$_00]
$_1 = $_NUM[$_01]
$_2 = $_Add1[$_1]
$_3 = $_Add1[$_2]
$_4 = $_Add1[$_3]
$_5 = $_Add1[$_4]
$_6 = $_Add1[$_5]
$_7 = $_Add1[$_6]
$_8 = $_Add1[$_7]
$_9 = $_Add1[$_8]

