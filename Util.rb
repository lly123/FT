require "./_3"

alias L lambda

#$_Print0 = L{|n| p n[L{|x| L{|y| x[0] + 1}}][L{|x| 0}][0]}
$_Print0 = L{|n| p n[L{|x| x + 1}][0]}

$_Print = L{|n|
  $_1IF[$_IsBOOL[n]][L{|g| $_1IF[n][L{|x| p 'TRUE'}][L{|x| p 'FALSE'}][g]}][
    L{|g| $_1IF[$_IsNULL[n]][L{|x| p 'NULL'}][
      #$_1IF[$_1IsT[n]][L{|x| p 'TUPLE'}][
      L{|g| $_1IF[$_IsNUM[n]][ L{|g| $_Print0[$_0Cdr[n]][g]} ][
          $_1IF[$_IsVAR[n]][L{|x| p 'VAR'}][L{|x| }]
      ][g]}
      #]
    ][g]}
  ]
}

$_PrintList = L{|l|
  $_Print[$_1FST[l]][0];
  $_1IF[$_1EQ[$_LEN[l]][$_1]][L{|x|}][
      L{|g| $_PrintList[$_1SND[l]][g]}
  ]
}


