alias L lambda

$_C = L{|x| L{|y| L{|f| f[x][y]}}}
$_Car = L{|p| p[L{|x| L{|y| x}}]}
$_Cdr = L{|p| p[L{|x| L{|y| y}}]}

$_IF = L{|b| L{|m| L{|n| b[$_C[m][n]]}}}
$_TRUE = $_Car
$_FALSE = $_Cdr

_Y = L{|f| L{|g|
  u = L{|x| f[ L{|g| x[x][g]} ]}
  u[u][g]}}

$_Y = _Y

# --------- 1 ---------

$_0 = L{|f| L{|x| x}}
$_1 = L{|f| L{|x| f[x]}}

$_Add1 = L{|n| L{|f| L{|x| f[n[f][x]] }}}
$_Add = L{|n| L{|m| n[$_Add1][m]}}

$_2 = $_Add[$_1][$_1]
$_3 = $_Add[$_2][$_1]
$_4 = $_Add[$_2][$_2]
$_5 = $_Add[$_2][$_3]
$_6 = $_Add[$_3][$_3]
$_7 = $_Add[$_3][$_4]
$_8 = $_Add[$_4][$_4]
$_9 = $_Add[$_4][$_5]

$_Pow = L{|n| L{|m| m[n]}}

# ---------------------

# --------- 3 ---------

_IsZero = L{|n| n[L{|x| $_FALSE}][$_TRUE]}

_Sub1 = L{|n| L{|f| L{|x|
  w = L{|f| L{|p| $_C[$_FALSE][$_IF[$_Car[p]][$_Cdr[p]][f[$_Cdr[p]]]]}}
  $_Cdr[n[w[f]][$_C[$_TRUE][x]]]
}}}

_Sub0 = L{|s| L{|n| L{|m| $_IF[_IsZero[m]][n][ L{|g| s[_Sub1[n]][_Sub1[m]][g]} ]}}}
$_Sub = $_Y[_Sub0]

_Mul0 = L{|s| L{|n| L{|m| $_IF[_IsZero[m]][$_0][ L{|g| $_Add[n][ s[n][_Sub1[m]] ][g] } ]}}}
$_Mul = $_Y[_Mul0]

# ---------------------

# --------- 4 ---------

$_AND = L{|x| L{|y| $_IF[x][ $_IF[y][$_TRUE][$_FALSE] ][$_FALSE] }}
$_OR = L{|x| L{|y| $_IF[x][ $_TRUE ][ $_IF[y][$_TRUE][$_FALSE] ] }}
$_NOT = L{|x| $_IF[x][$_FALSE][$_TRUE] }

_CMP0 = L{|s| L{|n| L{|m| $_IF[$_OR[_IsZero[n]][_IsZero[m]]][ $_IF[_IsZero[n]][ $_IF[_IsZero[m]][$_0][$_1] ][$_2] ][ L{|g| s[_Sub1[n]][_Sub1[m]][g] }  ] }}}
_CMP = $_Y[_CMP0]

$_EQ = L{|n| L{|m| $_IF[_IsZero[_CMP[n][m]]][$_TRUE][$_FALSE] }}
$_LT = L{|n| L{|m| $_IF[$_NOT[$_EQ[n][m]]][ $_IF[_IsZero[_Sub1[_CMP[n][m]]]][$_TRUE][$_FALSE] ][$_FALSE] }}
$_GT = L{|n| L{|m| $_IF[$_OR[$_EQ[n][m]][$_LT[n][m]]][$_FALSE][$_TRUE] }}

# ---------------------




