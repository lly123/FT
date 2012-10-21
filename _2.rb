require "./_1"

_LEN0 = L{|s| L{|l| $_1IF[$_IsNULL[l]][$_0][ L{|g| $_1Add1[s[$_1SND[l]]][g]} ]}}
$_LEN = $_Y[_LEN0]

$_TAIL = L{|n| $_1T[n][$_NULL]}
$_HEAD = $_NULL

_LIST0 = L{|s| L{|l| L{|n| $_1IF[$_IsNULL[n]][l][ L{|g| s[$_1T[n][l]][g]} ]}}}
$_LIST = $_Y[_LIST0]
$_LIST_APP = $_LIST

_LIST_AT0 = L{|s| L{|l| L{|n| L{|m| $_1IF[$_1EQ[n][m]][$_1FST[l]][ L{|g| s[$_1SND[l]][$_1Sub1[n]][m][g]} ]}}}}
_LIST_AT1 = $_Y[_LIST_AT0]
$_LIST_AT = L{|l| L{|n| _LIST_AT1[l][$_LEN[l]][$_1Add1[n]]}}

_LIST_SUB0 = L{|s| L{|l| L{|n| L{|m| L{|k|
  $_1IF[$_IsNULL[l]][$_NULL][
      $_1IF[$_1EQ[n][m]][
         L{|g| $_1T[k][s[$_1SND[l]][$_1Sub1[n]][m][k]][g]}
      ][
         L{|g| $_1T[$_1FST[l]][s[$_1SND[l]][$_1Sub1[n]][m][k]][g]}
      ]
  ]
}}}}}
_LIST_SUB1 = $_Y[_LIST_SUB0]
$_LIST_SUB = L{|l| L{|n| L{|m| _LIST_SUB1[l][$_LEN[l]][$_1Add1[n]][m]}}}

_LIST_MAP0 = L{|s| L{|l| L{|f| $_1IF[$_IsNULL[l]][$_NULL][ L{|g| $_1T[f[$_1FST[l]]][s[$_1SND[l]][f]][g]} ]}}}
$_LIST_MAP = $_Y[_LIST_MAP0]

_LIST_IDX0 = L{|s| L{|l| L{|n| L{|f|
  $_1IF[$_IsNULL[l]][$_NULL][
      $_1IF[f[$_1FST[l]]][n][ L{|g| s[$_1SND[l]][$_1Sub1[n]][f][g]} ]
  ]
}}}}
_LIST_IDX1 = $_Y[_LIST_IDX0]
$_LIST_IDX = L{|l| L{|f| _LIST_IDX1[l][$_1Sub1[$_LEN[l]]][f] }}

_LIST_CMP0 = L{|s| L{|n| L{|m| L{|f|
  $_1IF[$_OR[$_IsNULL[n]][$_IsNULL[n]]][
    $_1IF[$_AND[$_IsNULL[n]][$_IsNULL[n]]][$_TRUE][$_FALSE]
  ][
    $_1IF[f[$_1FST[n]][$_1FST[m]]][ L{|g| s[$_1SND[n]][$_1SND[m]][f][g]} ][$_FALSE]
  ]
}}}}
$_LIST_CMP = $_Y[_LIST_CMP0]

# >> TYPE 5 : STRING(TUPLE)
$_STR = L{|n| $_0C[$_05][n]}
$_IsSTR = L{|n| $_IS_TYPE[n][$_05]}
$_STR_EQ = L{|n| L{|m| $_LIST_CMP[$_1VAL[n]][$_1VAL[m]][L{|x| L{|y| $_CHAR_EQ[x][y] }}]}}