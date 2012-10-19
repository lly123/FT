require "./_2"

# >> TYPE 6 : VAR
$_VAR = L{|n| $_0C[$_06][n]}
$_IsVAR = L{|n| $_0IF[$_0EQ[$_06][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}


$_EVAL = L{|v| L{|e|
  $_IF[$_OR[$_IsBOOL[v]][$_IsNUM[v]]][v][

  ]
}}