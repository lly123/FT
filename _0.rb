alias L lambda

$_0C = L{|x| L{|y| L{|f| f[x][y]}}}
$_0Car = L{|p| p[L{|x| L{|y| x}}]}
$_0Cdr = L{|p| p[L{|x| L{|y| y}}]}

$_0IF = L{|b| L{|m| L{|n| b[$_0C[m][n]]}}}
$_0TRUE = $_0Car
$_0FALSE = $_0Cdr

$_Y = L{|f| L{|g|
  u = L{|x| f[ L{|g| x[x][g]} ]}
  u[u][g]}}

# --------- 1 ---------

$_00 = L{|f| L{|x| x}}
$_01 = L{|f| L{|x| f[x]}}

$_0Add1 = L{|n| L{|f| L{|x| f[n[f][x]] }}}
$_0Add = L{|n| L{|m| n[$_0Add1][m]}}

$_02 = $_0Add[$_01][$_01]
$_03 = $_0Add[$_01][$_02]
$_04 = $_0Add1[$_03]
$_05 = $_0Add1[$_04]
$_06 = $_0Add1[$_05]
$_07 = $_0Add1[$_06]
$_08 = $_0Add1[$_07]
$_09 = $_0Add1[$_08]
$_010 = $_0Add1[$_09]

$_0Pow = L{|n| L{|m| m[n]}}

# ---------------------

# --------- 3 ---------

_IsZero = L{|n| n[L{|x| $_0FALSE}][$_0TRUE]}

$_0Sub1 = L{|n| L{|f| L{|x|
  w = L{|f| L{|p| $_0C[$_0FALSE][$_0IF[$_0Car[p]][$_0Cdr[p]][f[$_0Cdr[p]]]]}}
  $_0Cdr[n[w[f]][$_0C[$_0TRUE][x]]]
}}}

_Sub0 = L{|s| L{|n| L{|m| $_0IF[_IsZero[m]][n][ L{|g| s[$_0Sub1[n]][$_0Sub1[m]][g]} ]}}}
$_0Sub = $_Y[_Sub0]

_Mul0 = L{|s| L{|n| L{|m| $_0IF[_IsZero[m]][$_00][ L{|g| $_0Add[n][  s[n][$_0Sub1[m]]  ][g] } ]}}}
$_0Mul = $_Y[_Mul0]

# ---------------------

# --------- 4 ---------

$_0AND = L{|x| L{|y| $_0IF[x][$_0IF[y][$_0TRUE][$_0FALSE]][$_0FALSE]}}
$_0OR = L{|x| L{|y| $_0IF[x][$_0TRUE][$_0IF[y][$_0TRUE][$_0FALSE]]}}
$_0NOT = L{|x| $_0IF[x][$_0FALSE][$_0TRUE]}

_CMP0 = L{|s| L{|n| L{|m|
  $_0IF[$_0AND[_IsZero[n]][_IsZero[m]]][$_00][
    $_0IF[_IsZero[n]][$_01][
        $_0IF[_IsZero[m]][$_02][
            L{|g| s[$_0Sub1[n]][$_0Sub1[m]][g]}
        ]
    ]
  ]
}}}

_CMP = $_Y[_CMP0]

$_0EQ = L{|n| L{|m| $_0IF[_IsZero[_CMP[n][m]]][$_0TRUE][$_0FALSE] }}
$_0LT = L{|n| L{|m| $_0IF[$_0NOT[$_0EQ[n][m]]][ $_0IF[_IsZero[$_0Sub1[_CMP[n][m]]]][$_0TRUE][$_0FALSE] ][$_0FALSE] }}
$_0GT = L{|n| L{|m| $_0IF[$_0OR[$_0EQ[n][m]][$_0LT[n][m]]][$_0FALSE][$_0TRUE] }}

# ---------------------




