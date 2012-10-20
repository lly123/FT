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

_ENV_VAR_IDX = L{|v| L{|e| $_LIST_IDX[e][L{|n| $_IF[$_IsVAR[n]][$_VAR_EQ[n][v]][$_FALSE] }]}}
$_EVAL = L{|v| L{|e|
  $_IF[$_OR[$_IsBOOL[v]][$_IsNUM[v]]][v][
    $_IF[$_IsVAR[v]][
        $_IF[$_IsNULL[_ENV_VAR_IDX[v][e]]][$_NULL][
            $_LIST_AT[e][$_Add1[_ENV_VAR_IDX[v][e]]]
        ]
    ][
        $_NULL
    ]
  ]
}}