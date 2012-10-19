require "./Expression"

# --------- 5 ---------

_LEN0 = L{|s| L{|l| $_0IF[$_IsNULL[l]][$_00][$_0Add1[ L{|g| s[$_SND[l]][g] } ]]}}
$_LEN = $_Y[_LEN0]

$_TAIL = L{|n| $_T[n][$_NULL]}
$_HEAD = $_NULL

_LIST0 = L{|s| L{|l| L{|p| $_0IF[$_IsNULL[p]][l][s[$_T[p][l]]]}}}
$_LIST = $_Y[_LIST0]

_LIST_AT = L{|l| L{|n| }}



