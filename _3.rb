require "./_2"

_VAL = L{|n| $_0Cdr[n]}

# >> TYPE 6 : VAR
$_VAR = L{|n| $_IF[$_IsSTR[n]][ $_0C[$_06][n] ][$_NULL]}
$_IsVAR = L{|n| $_0IF[$_0EQ[$_06][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
$_VAR_EQ = L{|n| L{|m|
  $_IF[$_AND[$_IsVAR[n]][$_IsVAR[m]]][
    L{|g| $_STR_EQ[_VAL[n]][_VAL[m]][g]}
  ][$_NULL]
}}

# >> TYPE 7 : LET
$_LET = L{|n| L{|v| L{|b| $_IF[$_IsVAR[n]][ $_0C[$_07][$_0C[$_0C[n][v]][b]] ][$_NULL]}}}
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
$_PROC = L{|n| L{|m| $_IF[$_IsVAR[n]][ $_0C[$_010][$_0C[n][m]] ][$_NULL]}}
_IsPROC = L{|n| $_0IF[$_0EQ[$_010][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_PROC_V = L{|n| $_0Car[$_0Cdr[n]]}
_PROC_B = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> TYPE 11 : DO
$_Do = L{|p| L{|n| $_IF[$_IsVAR[p]][ $_0C[$_011][$_0C[p][n]] ][$_NULL]}}
_IsDo = L{|n| $_0IF[$_0EQ[$_011][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_DO_P = L{|n| $_0Car[$_0Cdr[n]]}
_DO_V = L{|n| $_0Cdr[$_0Cdr[n]]}

# >> EVAL

_ENV_VAR_IDX = L{|v| L{|e| $_LIST_IDX[e][L{|n| $_IF[$_IsVAR[n]][ L{|g| $_VAR_EQ[n][v][g]} ][$_FALSE]}]}}
_ENV_VAR_VAL = L{|v| L{|e|
  $_IF[$_IsNULL[_ENV_VAR_IDX[v][e]]][$_NULL][
    L{|g| $_LIST_AT[e][$_1Add1[_ENV_VAR_IDX[v][e]]][g]}
  ]
}}

_EVAL0 = L{|s| L{|v| L{|e|
  $_IF[$_OR[$_IsBOOL[v]][$_IsNUM[v]]][v][
    $_IF[$_IsVAR[v]][
      L{|g| _ENV_VAR_VAL[v][e][g]}
    ][
      $_IF[_IsLET[v]][
        L{|g| L{|e| L{|g| s[_LET_B[v]][e][g]}}[
          $_LIST_APP[e][_LET_N[v]][_LET_V[v]][$_HEAD]
        ][g]}
      ][
        $_IF[_IsDo[v]][
          L{|g| L{|b| L{|e| L{|g| s[b][e][g]}}}[
            _PROC_B[_ENV_VAR_VAL[_DO_P[v]][e]]
          ][
            $_LIST_APP[e][_PROC_V[_ENV_VAR_VAL[_DO_P[v]][e]]][_DO_V[v]][$_HEAD]
          ][g]}
        ][
          $_IF[_IsADD1[v]][
            L{|g| $_1Add1[s[_ADD1_N[v]][e]][g]}
          ][
            $_IF[_IsADD[v]][
              L{|g| $_1Add[s[_ADD_N[v]][e]][s[_ADD_M[v]][e]][g]}
            ][$_NULL]
          ]
        ]
      ]
    ]
  ]
}}}
$_EVAL = $_Y[_EVAL0]
