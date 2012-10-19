require "./List"

alias L lambda

$_Print0 = L{|n| p n[L{|x| x + 1}][0]}

$_Print = L{|n|
  $_0IF[$_0EQ[$_00][$_TYPE_OF[n]]][L{|x| p 'NULL'}][
      $_0IF[$_0EQ[$_01][$_TYPE_OF[n]]][L{|x| p 'PAIR'}][
          $_0IF[$_0EQ[$_02][$_TYPE_OF[n]]][L{|x| $_Print0[$_0Cdr[n]]}][L{|x| }]
      ]
  ]
}

$_PrintList = L{|l| if $_0Car[l][L{|x| x + 1}][0] > 0 then $_Print[$_FST[l]][0]; $_PrintList[$_SND[l]] end }

