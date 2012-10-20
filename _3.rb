require "./_2"

_VAL = L{|n| $_0Cdr[n]}

# >> TYPE 6 : VAR
#$_VAR = L{|n| $_1IF[$_IsSTR[n]][ $_0C[$_06][n] ][$_NULL]}
#$_IsVAR = L{|n| $_0IF[$_0EQ[$_06][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
#$_VAR_EQ = L{|n| L{|m|
#  $_1IF[$_AND[$_IsVAR[n]][$_IsVAR[m]]][
#    L{|g| $_STR_EQ[_VAL[n]][_VAL[m]][g]}
#  ][$_NULL]
#}}

$_VAR = L{|n| $_1IF[$_IsNUM[n]][ $_0C[$_06][n] ][$_NULL]}
$_IsVAR = L{|n| $_0IF[$_0EQ[$_06][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
$_VAR_EQ = L{|n| L{|m|
  $_1IF[$_AND[$_IsVAR[n]][$_IsVAR[m]]][
    L{|g| $_1EQ[_VAL[n]][_VAL[m]][g]}
  ][$_NULL]
}}

# >> TYPE 7 : LET
$_LET = L{|n| L{|v| L{|b| $_1IF[$_IsVAR[n]][ $_0C[$_07][$_0C[$_0C[n][v]][b]] ][$_NULL]}}}
_IsLET = L{|n| $_0IF[$_0EQ[$_07][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_LET_N = L{|n| $_0Car[$_0Car[$_0Cdr[n]]]}
_LET_V = L{|n| $_0Cdr[$_0Car[$_0Cdr[n]]]}
_LET_B = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 8 : ADD1
$_Add1 = L{|n| $_0C[$_08][n]}
_IsADD1 = L{|n| $_0IF[$_0EQ[$_08][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_ADD1_N = L{|n| $_0Cdr[n]}

# >> TYPE 9 : ADD
$_Add = L{|n| L{|m| $_0C[$_09][$_0C[n][m]]}}
_IsADD = L{|n| $_0IF[$_0EQ[$_09][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_ADD_N = L{|n| $_0Car[$_0Cdr[n]]}
_ADD_M = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 10 : PROC
$_PROC = L{|n| L{|m| $_1IF[$_IsVAR[n]][ $_0C[$_010][$_0C[n][m]] ][$_NULL]}}
_IsPROC = L{|n| $_0IF[$_0EQ[$_010][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_PROC_V = L{|n| $_0Car[$_0Cdr[n]]}
_PROC_B = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 11 : DO
$_Do = L{|p| L{|n| $_1IF[$_IsVAR[p]][ $_0C[$_011][$_0C[p][n]] ][$_NULL]}}
_IsDo = L{|n| $_0IF[$_0EQ[$_011][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_DO_P = L{|n| $_0Car[$_0Cdr[n]]}
_DO_V = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 12 : IF
$_IF = L{|b| L{|n| L{|m| $_0C[$_012][$_0C[b][$_0C[n][m]]]}}}
_IsIF = L{|n| $_0IF[$_0EQ[$_012][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_IF_B = L{|n| $_0Car[$_0Cdr[n]]}
_IF_N = L{|n| $_0Car[$_0Cdr[$_0Cdr[n]]]}
_IF_M = L{|n| $_0Cdr[$_0Cdr[$_0Cdr[n]]]}

$_EQ = L{|n| L{|m| $_0C[$_013][$_0C[n][m]]}}
_IsEQ = L{|n| $_0IF[$_0EQ[$_013][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_EQ_N = L{|n| $_0Car[$_0Cdr[n]]}
_EQ_M = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 14 : SUB1
$_Sub1 = L{|n| $_0C[$_014][n]}
_IsSUB1 = L{|n| $_0IF[$_0EQ[$_014][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_SUB1_N = L{|n| $_0Cdr[n]}

# >> TYPE 15 : T
$_T = L{|n| L{|m| $_0C[$_015][$_0C[n][m]]}}
_IsT = L{|n| $_0IF[$_0EQ[$_015][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_T_FST = L{|n| $_0Car[$_0Cdr[n]]}
_T_SND = L{|n| $_0Cdr[$_0Cdr[n]]}

$_FST = L{|n| $_0C[$_016][n]}
_IsFST = L{|n| $_0IF[$_0EQ[$_016][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_FST_V = L{|n| $_0Cdr[n]}

$_SND = L{|n| $_0C[$_017][n]}
_IsSND = L{|n| $_0IF[$_0EQ[$_017][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_SND_V = L{|n| $_0Cdr[n]}

# >> EVAL
_ENV_VAR_IDX = L{|v| L{|e| $_LIST_IDX[e][L{|n| $_1IF[$_IsVAR[n]][ L{|g| $_VAR_EQ[n][v][g]} ][$_FALSE]}]}}
_ENV_VAR_VAL = L{|v| L{|e| $_LIST_AT[e][$_1Add1[_ENV_VAR_IDX[v][e]]]}}

_EVAL0 = L{|s| L{|v| L{|e|
  $_1IF[$_OR[$_IsBOOL[v]][$_IsNUM[v]]][v][
    $_1IF[$_IsVAR[v]][
      L{|g| _ENV_VAR_VAL[v][e][g]}
    ][
      $_1IF[_IsLET[v]][
        L{|g| L{|e| L{|g| s[_LET_B[v]][e][g]}}[
          $_LIST_APP[e][_LET_N[v]][_LET_V[v]][$_HEAD]
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
