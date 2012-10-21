require "./_2"

# >> TYPE 6 : VAR(NUM)
$_VAR = L{|n| $_0C[$_06][n]}
$_IsVAR = L{|n| $_IS_TYPE[n][$_06]}
$_VAR_EQ = L{|n| L{|m| $_1EQ[$_1VAL[n]][$_1VAL[m]]}}

# >> TYPE 7 : LET(VAR)(T)(T)
$_LET = L{|n| L{|v| L{|b| $_0C[$_07][$_0C[$_0C[n][v]][b]]}}}
_IsLET = L{|n| $_IS_TYPE[n][$_07]}
_LET_N = L{|n| $_0Car[$_0Car[$_0Cdr[n]]]}
_LET_V = L{|n| $_0Cdr[$_0Car[$_0Cdr[n]]]}
_LET_B = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 8 : ADD1(NUM)
$_Add1 = L{|n| $_0C[$_08][n]}
_IsADD1 = L{|n| $_IS_TYPE[n][$_08]}
_ADD1_N = L{|n| $_0Cdr[n]}

# >> TYPE 9 : ADD(NUM)(NUM)
$_Add = L{|n| L{|m| $_0C[$_09][$_0C[n][m]]}}
_IsADD = L{|n| $_IS_TYPE[n][$_09]}
_ADD_N = L{|n| $_0Car[$_0Cdr[n]]}
_ADD_M = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 10 : PROC(VAR)(T)
$_PROC = L{|n| L{|m| $_0C[$_010][$_0C[n][m]]}}
_PROC_V = L{|n| $_0Car[$_0Cdr[n]]}
_PROC_B = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 11 : DO(VAR)(T)
$_Do = L{|p| L{|n| $_0C[$_011][$_0C[p][n]]}}
_IsDo = L{|n| $_IS_TYPE[n][$_011]}
_DO_P = L{|n| $_0Car[$_0Cdr[n]]}
_DO_V = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 12 : IF(BOOL)(T)(T)
$_IF = L{|b| L{|n| L{|m| $_0C[$_012][$_0C[b][$_0C[n][m]]]}}}
_IsIF = L{|n| $_IS_TYPE[n][$_012]}
_IF_B = L{|n| $_0Car[$_0Cdr[n]]}
_IF_N = L{|n| $_0Car[$_0Cdr[$_0Cdr[n]]]}
_IF_M = L{|n| $_0Cdr[$_0Cdr[$_0Cdr[n]]]}

$_EQ = L{|n| L{|m| $_0C[$_013][$_0C[n][m]]}}
_IsEQ = L{|n| $_IS_TYPE[n][$_013]}
_EQ_N = L{|n| $_0Car[$_0Cdr[n]]}
_EQ_M = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 14 : SUB1(NUM)
$_Sub1 = L{|n| $_0C[$_014][n]}
_IsSUB1 = L{|n| $_IS_TYPE[n][$_014]}
_SUB1_N = L{|n| $_0Cdr[n]}

# >> TYPE 15 : TUPLE(T)(T)
$_T = L{|n| L{|m| $_0C[$_015][$_0C[n][m]]}}
_IsT = L{|n| $_IS_TYPE[n][$_015]}
_T_FST = L{|n| $_0Car[$_0Cdr[n]]}
_T_SND = L{|n| $_0Cdr[$_0Cdr[n]]}

$_FST = L{|n| $_0C[$_016][n]}
_IsFST = L{|n| $_IS_TYPE[n][$_016]}
_FST_V = L{|n| $_0Cdr[n]}

$_SND = L{|n| $_0C[$_017][n]}
_IsSND = L{|n| $_IS_TYPE[n][$_017]}
_SND_V = L{|n| $_0Cdr[n]}

# >> EVAL

#_ENV_VAR_VAL0 = L{|s| L{|v| L{|e|
#  $_1IF[$_IsNULL[e]][$_NULL][
#    L{|n|
#      $_1IF[$_AND[$_IsVAR[n]][ L{|g| $_VAR_EQ[n][v][g]} ]][
#        $_1FST[e]
#      ][ L{|g| s[v][$_1SND[$_1SND[e]]][g]} ]
#    }[$_1FST[$_1SND[e]]]
#  ]
#}}}
#_ENV_VAR_VAL = $_Y[_ENV_VAR_VAL0]

_ENV_VAR_IDX = L{|v| L{|e| $_LIST_IDX[e][L{|n| $_1IF[$_IsVAR[n]][ L{|g| $_VAR_EQ[n][v][g]} ][$_FALSE]}]}}
_ENV_VAR_VAL = L{|v| L{|e| $_LIST_AT[e][$_1Add1[_ENV_VAR_IDX[v][e]]]}}

_EVAL0 = L{|s| L{|v| L{|e|
  $_1IF[$_OR[$_IsBOOL[v]][$_IsNUM[v]]][v][
    $_1IF[$_IsVAR[v]][
      L{|g| _ENV_VAR_VAL[v][e][g]}
    ][
      $_1IF[_IsLET[v]][
        L{|g| L{|e| L{|g| s[_LET_B[v]][e][g]}}[
          L{|n|
            $_LIST_APP[e][_LET_N[v]][n][$_HEAD]
          }[
            $_1IF[$_IsVAR[_LET_V[v]]][
              L{|g| _ENV_VAR_VAL[_LET_V[v]][e][g]}
            ][_LET_V[v]]
          ]
        ][g]}
      ][
        $_1IF[_IsDo[v]][
          L{|g| L{|p| L{|b|
            L{|e| L{|g| s[b][e][g]}}[$_LIST_APP[e][_PROC_V[p]][ s[_DO_V[v]][e] ][$_HEAD]]
          }[_PROC_B[p]]
          }[_ENV_VAR_VAL[_DO_P[v]][e]][g]}
        ][
          $_1IF[_IsIF[v]][
            L{|g| $_1IF[ s[_IF_B[v]][e] ][ L{|g| s[_IF_N[v]][e][g]} ][ L{|g| s[_IF_M[v]][e][g]} ][g]}
          ][
            $_1IF[_IsEQ[v]][
              L{|g| $_1EQ[ L{|g| s[_EQ_N[v]][e][g]} ][ L{|g| s[_EQ_M[v]][e][g]} ][g]}
            ][
              $_1IF[_IsT[v]][
                L{|g| $_1T[ L{|g| s[_T_FST[v]][e][g]} ][ L{|g| s[_T_SND[v]][e][g]} ][g]}
              ][
                $_1IF[_IsFST[v]][
                  L{|g| $_1FST[s[_FST_V[v]][e]][g]}
                ][
                  $_1IF[_IsSND[v]][
                    L{|g| $_1SND[s[_SND_V[v]][e]][g]}
                  ][
                    $_1IF[_IsSUB1[v]][
                      L{|g| $_1Sub1[s[_SUB1_N[v]][e]][g]}
                    ][
                      $_1IF[_IsADD1[v]][
                        L{|g| $_1Add1[s[_ADD1_N[v]][e]][g]}
                      ][
                        $_1IF[_IsADD[v]][
                          L{|g| $_1Add[s[_ADD_N[v]][e]][s[_ADD_M[v]][e]][g]}
                        ][$_NULL]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]
  ]
}}}
$_EVAL = $_Y[_EVAL0]
