require "./Two"

alias L lambda

$_Print0 = L{|n| p n[L{|x| x + 1}][0]}

$_Print = L{|n|
  $_IF[$_IsBOOL[n]][$_IF[n][L{|x| p 'TRUE'}][L{|x| p 'FALSE'}]][
      $_IF[$_IsNULL[n]][L{|x| p 'NULL'}][
          $_IF[$_IsTUPLE[n]][L{|x| p 'TUPLE'}][
              $_IF[$_IsNUM[n]][ L{|g| $_Print0[$_0Cdr[n]][g]} ][L{|x| }]
          ]
      ]
  ]
}

$_PrintList = L{|l| $_Print[$_FST[l]][0]; $_IF[$_EQ[$_LEN[l]][$_1]][L{|x|}][L{|g| $_PrintList[$_SND[l]][g]}]}


