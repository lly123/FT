require "./One"

# --------- 5 ---------

_LEN0 = L{|s| L{|l| $_IF[$_IsNULL[l]][$_0][ L{|g| $_Add1[s[$_SND[l]]][g]} ]}}
$_LEN = $_Y[_LEN0]

$_TAIL = L{|n| $_T[n][$_NULL]}
$_HEAD = $_NULL

_LIST0 = L{|s| L{|l| L{|n| $_IF[$_IsNULL[n]][l][s[$_T[n][l]]]}}}
$_LIST = $_Y[_LIST0]

_LIST_AT0 = L{|s| L{|l| L{|n| $_IF[$_IsZero[n]][$_FST[l]][ L{|g| s[$_SND[l]][$_Sub1[n]][g]}]}}}
$_LIST_AT = $_Y[_LIST_AT0]

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
$_LIST_SUB = L{|l| L{|n| L{|m| _LIST_SUB1[l][$_LEN[l]][$_Add1[n]][m] }}}


