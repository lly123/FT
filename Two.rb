require "./One"

# --------- 5 ---------

_LEN0 = L{|s| L{|l| $_IF[$_IsNULL[l]][$_0][ L{|g| $_Add1[s[$_SND[l]]][g]} ]}}
$_LEN = $_Y[_LEN0]

$_TAIL = L{|n| $_T[n][$_NULL]}
$_HEAD = $_NULL

_LIST0 = L{|s| L{|l| L{|p| $_IF[$_IsNULL[p]][l][s[$_T[p][l]]]}}}
$_LIST = $_Y[_LIST0]

_LIST_AT0 = L{|s| L{|l| L{|n| $_IF[$_IsZero[n]][$_FST[l]][ L{|g| s[$_SND[l]][$_Sub1[n]][g]}]}}}
$_LIST_AT = $_Y[_LIST_AT0]



