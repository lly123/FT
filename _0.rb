alias L lambda

$_0C = L{|x| L{|y| L{|f| f[x][y]}}}
$_0Car = L{|p| p[L{|x| L{|y| x}}]}
$_0Cdr = L{|p| p[L{|x| L{|y| y}}]}

$_Y = L{|f| L{|g|
  u = L{|x| f[ L{|g| x[x][g]} ]}
  u[u][g]}}

# ---------------------

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
$_011 = $_0Add1[$_010]
$_012 = $_0Add1[$_011]
$_013 = $_0Add1[$_012]
$_014 = $_0Add1[$_013]
$_015 = $_0Add1[$_014]
$_016 = $_0Add1[$_015]
$_017 = $_0Add1[$_016]
$_018 = $_0Add1[$_017]

$_0Pow = L{|n| L{|m| m[n]}}

# ---------------------

#TRUE := λx.λy.x
#FALSE := λx.λy.y
#AND := λp.λq.p q p
#OR := λp.λq.p p q
#NOT := λp.λa.λb.p b a
#IFTHENELSE := λp.λa.λb.p a b

$_0TRUE = L{|x| L{|y| x}}
$_0FALSE = L{|x| L{|y| y}}

$_0AND = L{|p| L{|q| p[q][p] }}
$_0OR = L{|p| L{|q| p[p][q] }}
$_0NOT = L{|p| L{|x| L{|y| p[y][x]}}}

$_0IF = L{|p| L{|x| L{|y| p[x][y]}}}

_0IsZERO = L{|n| n[L{|x| $_0FALSE}][$_0TRUE]}

# ---------------------

#PRED := λn.λf.λx.n (λg.λh.h (g f)) (λu.x) (λu.u)
#SUB := λn.λm.m PRED n
_0Sub0 = L{|n| L{|f| L{|x| n[ L{|g| L{|h| h[g[f]]}} ][ L{|u| x} ][ L{|u| u} ] }}}
$_0Sub = L{|n| L{|m| m[_0Sub0][n]}}
$_0Sub1 = L{|n| $_0Sub[n][$_01]}

#MULT := λn.λm.n (PLUS m) 0
$_0Mul = L{|n| L{|m| n[$_0Add[m]][$_00]}}

# ---------------------

#LEQ := λn.λm.IS_ZERO (SUB n m)
_0LEQ = L{|n| L{|m| _0IsZERO[$_0Sub[n][m]]}}

$_0EQ = L{|n| L{|m| $_0IF[$_0AND[_0LEQ[n][m]][_0LEQ[m][n]]][$_0TRUE][$_0FALSE]}}
$_0LT = L{|n| L{|m| $_0IF[$_0AND[_0LEQ[n][m]][$_0NOT[$_0EQ[n][m]]]][$_0TRUE][$_0FALSE]}}
$_0GT = L{|n| L{|m| $_0IF[$_0AND[$_0NOT[_0LEQ[n][m]]][$_0NOT[$_0EQ[n][m]]]][$_0TRUE][$_0FALSE]}}
# ---------------------

# Logic With Pair
=begin
$_0IF = L{|b| L{|m| L{|n| b[$_0C[m][n]]}}}
$_0TRUE = $_0Car
$_0FALSE = $_0Cdr
=end

# Arithmetic with Pair
=begin
$_0Sub1 = L{|n| L{|f| L{|x|
  w = L{|f| L{|p| $_0C[$_0FALSE][$_0IF[$_0Car[p]][$_0Cdr[p]][ f[$_0Cdr[p]] ]]}}
  $_0Cdr[n[w[f]][$_0C[$_0TRUE][x]]]
}}}

_0Sub0 = L{|s| L{|n| L{|m| $_0IF[_0IsZERO[m]][n][ L{|g| s[$_0Sub1[n]][$_0Sub1[m]][g]} ]}}}
$_0Sub = $_Y[_0Sub0]

_Mul0 = L{|s| L{|n| L{|m| $_0IF[_0IsZERO[m]][$_00][ L{|g| $_0Add[n][s[n][$_0Sub1[m]]][g]} ]}}}
$_0Mul = $_Y[_Mul0]
=end

# Logic Expression With Low Performance
=begin
$_0AND = L{|x| L{|y| $_0IF[x][ L{|g| $_0IF[y][$_0TRUE][$_0FALSE][g]} ][$_0FALSE]}}
$_0OR = L{|x| L{|y| $_0IF[x][$_0TRUE][ L{|g| $_0IF[y][$_0TRUE][$_0FALSE][g]} ]}}
$_0NOT = L{|x| $_0IF[x][$_0FALSE][$_0TRUE]}

_CMP0 = L{|s| L{|n| L{|m|
  $_0IF[$_0AND[_0IsZERO[n]][_0IsZERO[m]]][$_00][
    $_0IF[_0IsZERO[n]][$_01][
      $_0IF[_0IsZERO[m]][$_02][
        L{|g| s[$_0Sub1[n]][$_0Sub1[m]][g]}
      ]
    ]
  ]
}}}
_CMP = $_Y[_CMP0]

$_0EQ = L{|n| L{|m| $_0IF[_0IsZERO[_CMP[n][m]]][$_0TRUE][$_0FALSE] }}

$_0LT = L{|n| L{|m|
  $_0IF[$_0NOT[$_0EQ[n][m]]][
    L{|g| $_0IF[_0IsZERO[$_0Sub1[_CMP[n][m]]]][$_0TRUE][$_0FALSE][g]}
  ][$_0FALSE]
}}

$_0GT = L{|n| L{|m| $_0IF[$_0OR[$_0EQ[n][m]][$_0LT[n][m]]][$_0FALSE][$_0TRUE] }}
=end


