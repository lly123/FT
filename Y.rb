alias L lambda

_Y = L{|f| L{|g|
  u = L{|x| f[ L{|g| x[x][g]} ]}
  u[u][g]}}

$_Y = _Y

