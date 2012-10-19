require "./List"

alias L lambda

$_Print0 = L{|n| p n[L{|x| x + 1}][0]}

$_Print = L{|n|
  $_IF[$_EQ[$_0][$_TYPE_OF[n]]][L{|x| p 'NULL'}][
      $_IF[$_EQ[$_1][$_TYPE_OF[n]]][L{|x| p 'PAIR'}][
          $_IF[$_EQ[$_2][$_TYPE_OF[n]]][L{|x| $_Print0[$_Cdr[n]]}][L{|x| }]
      ]
  ]
}

$_PrintList = L{|l| if $_Car[l][L{|x| x + 1}][0] > 0 then $_Print[$_FST[l]][0]; $_PrintList[$_SND[l]] end }

