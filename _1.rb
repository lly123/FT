require "./_0"

$_TYPE_OF = L{|n| $_0Car[n]}
$_IS_TYPE = L{|n| L{|m| $_0IF[$_0EQ[m][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}}

$_1VAL = L{|n| $_0Cdr[n]}

# >> TYPE 0 : NULL
$_NULL = $_0C[$_00][$_00]
$_IsNULL = L{|n| $_IS_TYPE[n][$_00]}

# >> TYPE 2 : Number
$_NUM = L{|n| $_0C[$_02][n]}
$_IsNUM = L{|n| $_IS_TYPE[n][$_02]}

# >> Type 3 : Boolean
_BOOL = L{|n| $_0C[$_03][n]}
$_TRUE = _BOOL[$_0TRUE]
$_FALSE = _BOOL[$_0FALSE]
$_IsBOOL = L{|n| $_IS_TYPE[n][$_03]}

$_1IF = L{|b| L{|m| L{|n| $_0IF[$_1VAL[b]][m][n]}}}

$_AND = L{|x| L{|y| _BOOL[$_0AND[$_1VAL[x]][$_1VAL[y]]]}}
$_OR = L{|x| L{|y| _BOOL[$_0OR[$_1VAL[x]][$_1VAL[y]]]}}
$_NOT = L{|x| _BOOL[$_0NOT[$_1VAL[x]]]}

$_1EQ = L{|n| L{|m| _BOOL[$_0EQ[$_1VAL[n]][$_1VAL[m]]]}}
$_LT = L{|n| L{|m| _BOOL[$_0LT[$_1VAL[n]][$_1VAL[m]]]}}
$_GT = L{|n| L{|m| _BOOL[$_0GT[$_1VAL[n]][$_1VAL[m]]]}}

$_IsZERO = L{|n| $_1EQ[n][$_0]}

$_1Add1 = L{|n| $_NUM[$_0Add1[$_1VAL[n]]] }
$_1Add = L{|n| L{|m| $_NUM[$_0Add[$_1VAL[n]][$_1VAL[m]]]}}
$_1Sub1 = L{|n| $_NUM[$_0Sub1[$_1VAL[n]]] }
$_Sub = L{|n| L{|m| $_NUM[$_0Sub[$_1VAL[n]][$_1VAL[m]]]}}
$_Mul = L{|n| L{|m| $_NUM[$_0Mul[$_1VAL[n]][$_1VAL[m]]]}}

# >> TYPE 1 : TUPLE
$_1T = L{|n| L{|m| $_0C[$_01][$_0C[n][m]]}}
$_1IsT = L{|n| $_IS_TYPE[n][$_01]}

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
$_10 = $_1Add1[$_9]

# >> TYPE 4 : CHAR
$_CHAR = L{|n| $_0C[$_04][n]}
$_IsCHAR = L{|n| $_IS_TYPE[n][$_04]}
$_CHAR_EQ = L{|n| L{|m| _BOOL[$_0EQ[$_1VAL[n]][$_1VAL[m]]]}}

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



