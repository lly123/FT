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

$_PrintList = L{|l| if $_0Car[l][L{|x| x + 1}][0] > 0 then $_Print[$_FST[l]]; $_PrintList[$_SND[l]] end }

