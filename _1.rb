require "./_0"

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
$_Sub1 = L{|n| $_IF[$_IsNUM[n]][$_NUM[$_0Sub1[_VAL[n]]]][$_NULL] }
$_Sub = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][$_NUM[$_0Sub[_VAL[n]][_VAL[m]]]][$_NULL]}}

# >> Type 3 : Boolean
_BOOL = L{|n| $_0C[$_03][n]}
$_TRUE = _BOOL[$_0TRUE]
$_FALSE = _BOOL[$_0FALSE]

_IsBOOL = L{|n| $_0IF[$_0EQ[$_03][$_TYPE_OF[n]]][$_0TRUE][$_0FALSE]}
$_IF = L{|b| L{|m| L{|n| $_0IF[_IsBOOL[b]][$_0IF[_VAL[b]][m][n]][$_NULL]}}}

$_AND = L{|x| L{|y| $_0IF[$_0AND[_IsBOOL[x]][_IsBOOL[y]]][_BOOL[$_0AND[_VAL[x]][_VAL[y]]]][$_NULL]}}
$_OR = L{|x| L{|y| $_0IF[$_0AND[_IsBOOL[x]][_IsBOOL[y]]][_BOOL[$_0OR[_VAL[x]][_VAL[y]]]][$_NULL]}}
$_NOT = L{|x| $_0IF[_IsBOOL[x]][_BOOL[$_0NOT[_VAL[x]]]][$_NULL]}

$_IsBOOL = L{|x| $_0IF[_IsBOOL[x]][$_TRUE][$_FALSE]}

$_EQ = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][_BOOL[$_0EQ[_VAL[n]][_VAL[m]]]][$_NULL]}}
$_LT = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][_BOOL[$_0LT[_VAL[n]][_VAL[m]]]][$_NULL]}}
$_GT = L{|n| L{|m| $_IF[_BOTH_NUM[n][m]][_BOOL[$_0GT[_VAL[n]][_VAL[m]]]][$_NULL]}}

$_IsZero = L{|n| $_EQ[n][$_0]}

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

# >> TYPE 4 : CHAR
$_CHAR = L{|n| $_0C[$_04][n]}
$_A_ = $_CHAR[$_0Add[$_0Mul[$_06][$_010]][$_05]]
$_B_ = $_CHAR[$_0Add[$_0Mul[$_06][$_010]][$_06]]
$_C_ = $_CHAR[$_0Add[$_0Mul[$_06][$_010]][$_07]]
$_D_ = $_CHAR[$_0Add[$_0Mul[$_06][$_010]][$_08]]
$_E_ = $_CHAR[$_0Add[$_0Mul[$_06][$_010]][$_09]]
$_F_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_00]]
$_G_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_01]]
$_H_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_02]]
$_I_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_03]]
$_J_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_04]]
$_K_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_05]]
$_L_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_06]]
$_M_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_07]]
$_N_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_08]]
$_O_ = $_CHAR[$_0Add[$_0Mul[$_07][$_010]][$_09]]
$_P_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_00]]
$_Q_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_01]]
$_R_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_02]]
$_S_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_03]]
$_T_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_04]]
$_U_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_05]]
$_V_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_06]]
$_W_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_07]]
$_X_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_08]]
$_Y_ = $_CHAR[$_0Add[$_0Mul[$_08][$_010]][$_09]]
$_Z_ = $_CHAR[$_0Add[$_0Mul[$_09][$_010]][$_00]]

# >> TYPE 5 : STRING
$_STRING = L{|n| $_0C[$_05][n]}

