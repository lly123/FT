alias L lambda

# --------- 2 ---------

$_C = L{|x| L{|y| L{|f| f[x][y]}}}
$_Car = L{|p| p[L{|x| L{|y| x}}]}
$_Cdr = L{|p| p[L{|x| L{|y| y}}]}

$_IF = L{|b| L{|m| L{|n| b[$_C[m][n]]}}}
$_TRUE = $_Car
$_FALSE = $_Cdr

# ---------------------
