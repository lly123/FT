require "./_0"

$_TYPE_OF = L{|n| $_0Car[n]}

_VAL = L{|n| $_0Cdr[n]}

# >> TYPE 0 : NULL
$_NULL = $_0C[$_00][$_00]
$_IsNULL = L{|n| $_0IF[$_0EQ[$_00][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}

# >> TYPE 2 : Number
$_NUM = L{|n| $_0C[$_02][n]}
$_IsNUM = L{|n| $_0IF[$_0EQ[$_02][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}

# >> Type 3 : Boolean
_BOOL = L{|n| $_0C[$_03][n]}
$_TRUE = _BOOL[$_0TRUE]
$_FALSE = _BOOL[$_0FALSE]

_IsBOOL = L{|n| $_0IF[$_0EQ[$_03][$_TYPE_OF[n]]][$_0TRUE][$_0FALSE]}
$_1IF = L{|b| L{|m| L{|n| $_0IF[_IsBOOL[b]][$_0IF[_VAL[b]][m][n]][$_NULL]}}}

$_AND = L{|x| L{|y| $_0IF[$_0AND[_IsBOOL[x]][_IsBOOL[y]]][_BOOL[$_0AND[_VAL[x]][_VAL[y]]]][$_NULL]}}
$_OR = L{|x| L{|y| $_0IF[$_0AND[_IsBOOL[x]][_IsBOOL[y]]][_BOOL[$_0OR[_VAL[x]][_VAL[y]]]][$_NULL]}}
$_NOT = L{|x| $_0IF[_IsBOOL[x]][_BOOL[$_0NOT[_VAL[x]]]][$_NULL]}

$_IsBOOL = L{|x| $_0IF[_IsBOOL[x]][$_TRUE][$_FALSE]}

_1IF_BOTH_NUM = L{|n| L{|m| L{|b| $_1IF[$_AND[$_IsNUM[n]][$_IsNUM[m]]][b][$_NULL]}}}

$_1Add1 = L{|n| $_1IF[$_IsNUM[n]][$_NUM[$_0Add1[_VAL[n]]]][$_NULL] }
$_1Add = L{|n| L{|m| _1IF_BOTH_NUM[n][m][ $_NUM[$_0Add[_VAL[n]][_VAL[m]]] ]}}
$_1Sub1 = L{|n| $_1IF[$_IsNUM[n]][$_NUM[$_0Sub1[_VAL[n]]]][$_NULL] }
$_Sub = L{|n| L{|m| _1IF_BOTH_NUM[n][m][ $_NUM[$_0Sub[_VAL[n]][_VAL[m]]] ]}}

$_1EQ = L{|n| L{|m| _1IF_BOTH_NUM[n][m][ _BOOL[$_0EQ[_VAL[n]][_VAL[m]]] ]}}
$_LT = L{|n| L{|m| _1IF_BOTH_NUM[n][m][ _BOOL[$_0LT[_VAL[n]][_VAL[m]]] ]}}
$_GT = L{|n| L{|m| _1IF_BOTH_NUM[n][m][ _BOOL[$_0GT[_VAL[n]][_VAL[m]]] ]}}

$_IsZERO = L{|n| $_1EQ[n][$_0]}

# >> TYPE 1 : TUPLE
$_1T = L{|n| L{|m| $_0C[$_01][$_0C[n][m]]}}
$_1IsT = L{|n| $_0IF[$_0EQ[$_0Car[n]][$_01]][$_TRUE][$_FALSE]}

$_1FST = L{|n| $_0Car[$_0Cdr[n]]}
$_1SND = L{|n| $_0Cdr[$_0Cdr[n]]}

$_0 = $_NUM[$_00]
$_1 = $_NUM[$_01]
$_2 = $_1Add1[$_1]
$_3 = $_1Add1[$_2]
$_4 = $_1Add1[$_3]
$_5 = $_1Add1[$_4]
$_6 = $_1Add1[$_5]
$_7 = $_1Add1[$_6]
$_8 = $_1Add1[$_7]
$_9 = $_1Add1[$_8]

# >> TYPE 4 : CHAR
$_CHAR = L{|n| $_0C[$_04][n]}

$_A_ = $_CHAR[$_00]
$_B_ = $_CHAR[$_01]
$_C_ = $_CHAR[$_02]
$_D_ = $_CHAR[$_03]
$_E_ = $_CHAR[$_04]
$_F_ = $_CHAR[$_05]
$_G_ = $_CHAR[$_06]
$_H_ = $_CHAR[$_07]
$_I_ = $_CHAR[$_08]
$_J_ = $_CHAR[$_09]
$_K_ = $_CHAR[$_010]
$_L_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_01]]
$_M_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_02]]
$_N_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_03]]
$_O_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_04]]
$_P_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_05]]
$_Q_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_06]]
$_R_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_07]]
$_S_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_08]]
$_T_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_09]]
$_U_ = $_CHAR[$_0Add[$_0Mul[$_01][$_010]][$_010]]
$_V_ = $_CHAR[$_0Add[$_0Mul[$_02][$_010]][$_01]]
$_W_ = $_CHAR[$_0Add[$_0Mul[$_02][$_010]][$_02]]
$_X_ = $_CHAR[$_0Add[$_0Mul[$_02][$_010]][$_03]]
$_Y_ = $_CHAR[$_0Add[$_0Mul[$_02][$_010]][$_04]]
$_Z_ = $_CHAR[$_0Add[$_0Mul[$_02][$_010]][$_05]]

$_IsCHAR = L{|n| $_0IF[$_0EQ[$_04][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
$_CHAR_EQ = L{|n| L{|m| $_1IF[$_AND[$_IsCHAR[n]][$_IsCHAR[m]]][ _BOOL[$_0EQ[_VAL[n]][_VAL[m]]] ][$_NULL]}}


