require "./_1"

_VAL = L{|n| $_0Cdr[n]}

# --------- 5 ---------

_LEN0 = L{|s| L{|l| $_IF[$_IsNULL[l]][$_0][ L{|g| $_1Add1[s[$_SND[l]]][g]} ]}}
$_LEN = $_Y[_LEN0]

$_TAIL = L{|n| $_T[n][$_NULL]}
$_HEAD = $_NULL

_LIST0 = L{|s| L{|l| L{|n| $_IF[$_IsNULL[n]][l][ L{|g| s[$_T[n][l]][g]} ]}}}
$_LIST = $_Y[_LIST0]
$_LIST_APP = $_LIST

_LIST_AT0 = L{|s| L{|l| L{|n| L{|m| $_IF[$_EQ[n][m]][$_FST[l]][ L{|g| s[$_SND[l]][$_Sub1[n]][m][g]} ]}}}}
_LIST_AT1 = $_Y[_LIST_AT0]
$_LIST_AT = L{|l| L{|n| _LIST_AT1[l][$_LEN[l]][$_1Add1[n]] }}

_LIST_SUB0 = L{|s| L{|l| L{|n| L{|m| L{|k|
  $_IF[$_IsNULL[l]][$_NULL][
      $_IF[$_EQ[n][m]][
         L{|g| $_T[k][s[$_SND[l]][$_Sub1[n]][m][k]][g]}
      ][
         L{|g| $_T[$_FST[l]][s[$_SND[l]][$_Sub1[n]][m][k]][g]}
      ]
  ]
}}}}}
_LIST_SUB1 = $_Y[_LIST_SUB0]
$_LIST_SUB = L{|l| L{|n| L{|m| _LIST_SUB1[l][$_LEN[l]][$_1Add1[n]][m]}}}

_LIST_MAP0 = L{|s| L{|l| L{|f| $_IF[$_IsNULL[l]][$_NULL][ L{|g| $_T[f[$_FST[l]]][s[$_SND[l]][f]][g]} ]}}}
$_LIST_MAP = $_Y[_LIST_MAP0]

_LIST_IDX0 = L{|s| L{|l| L{|n| L{|f|
  $_IF[$_IsNULL[l]][$_NULL][
      $_IF[f[$_FST[l]]][n][ L{|g| s[$_SND[l]][$_Sub1[n]][f][g]} ]
  ]
}}}}
_LIST_IDX1 = $_Y[_LIST_IDX0]
$_LIST_IDX = L{|l| L{|f| _LIST_IDX1[l][$_Sub1[$_LEN[l]]][f] }}

_LIST_CMP0 = L{|s| L{|n| L{|m| L{|f|
  $_IF[$_OR[$_IsNULL[n]][$_IsNULL[n]]][
    $_IF[$_AND[$_IsNULL[n]][$_IsNULL[n]]][$_TRUE][$_FALSE]
  ][
    $_IF[f[$_FST[n]][$_FST[m]]][ L{|g| s[$_SND[n]][$_SND[m]][f][g]} ][$_FALSE]
  ]
}}}}
$_LIST_CMP = $_Y[_LIST_CMP0]

# >> TYPE 5 : STRING
$_STR = L{|n| $_IF[$_IsTUPLE[n]][$_0C[$_05][n]][$_NULL]}
$_IsSTR = L{|n| $_0IF[$_0EQ[$_05][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}

$_STR_EQ = L{|n| L{|m|
  $_IF[$_AND[$_IsSTR[n]][$_IsSTR[m]]][
    L{|g| $_LIST_CMP[_VAL[n]][_VAL[m]][L{|x| L{|y| $_CHAR_EQ[x][y] }}][g]}
  ][$_NULL]
}}