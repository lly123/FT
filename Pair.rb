alias L lambda

# --------- 2 ---------

_Cons = L{|x| L{|y| L{|f| f[x][y]}}}
_Car = L{|p| p[L{|x| L{|y| x}}]}
_Cdr = L{|p| p[L{|x| L{|y| y}}]}

_IF = L{|b| L{|m| L{|n| b[_Cons[m][n]]}}}
_TRUE = _Car
_FALSE = _Cdr

$_C = _Cons
$_Car = _Car
$_Cdr = _Cdr

$_IF = _IF
$_TRUE = _TRUE
$_FALSE = _FALSE

# ---------------------
