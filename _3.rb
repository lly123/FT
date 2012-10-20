require "./_2"

_VAL = L{|n| $_0Cdr[n]}

# >> TYPE 6 : VAR
$_VAR = L{|n| $_IF[$_IsSTR[n]][$_0C[$_06][n]][$_NULL]}
$_IsVAR = L{|n| $_0IF[$_0EQ[$_06][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
$_VAR_EQ = L{|n| L{|m|
  $_IF[$_AND[$_IsVAR[n]][$_IsVAR[m]]][
    $_STR_EQ[_VAL[n]][_VAL[m]]
  ][$_NULL]
}}

# >> TYPE 7 : LET
$_LET = L{|n| L{|v| L{|b| $_IF[$_IsVAR[n]][$_0C[$_07][$_0C[$_0C[n][v]][b]]][$_NULL]}}}
$_IsLET = L{|n| $_0IF[$_0EQ[$_07][$_TYPE_OF[n]]][$_TRUE][$_FALSE]}
_LET_N = L{|n| $_0Car[$_0Car[$_0Cdr[n]]]}
_LET_V = L{|n| $_0Cdr[$_0Car[$_0Cdr[n]]]}
_LET_B = L{|n| $_0Cdr[$_0Cdr[n]]}

_ENV_VAR_IDX = L{|v| L{|e| $_LIST_IDX[e][L{|n| $_IF[$_IsVAR[n]][$_VAR_EQ[n][v]][$_FALSE] }]}}
_EVAL0 = L{|s| L{|v| L{|e|
  $_IF[$_OR[$_IsBOOL[v]][$_IsNUM[v]]][v][
    $_IF[$_IsVAR[v]][
        L{|g|
        $_IF[$_IsNULL[_ENV_VAR_IDX[v][e]]][$_NULL][
            $_LIST_AT[e][$_Add1[_ENV_VAR_IDX[v][e]]]
        ][g]
        }
    ][
        $_IF[$_IsLET[v]][
            L{|e| L{|g| s[_LET_B[v]][e][g]}}[$_LIST_APP[e][_LET_N[v]][_LET_V[v]][$_HEAD]]
        ][
            $_NULL
        ]
    ]
  ]
}}}
$_EVAL = $_Y[_EVAL0]