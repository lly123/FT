require "./Util"

sum = L{|n, f| if n == 1 then f[1] else sum[n-1, L{|v| f[n + v] }] end}
sum[100, L{|v| p v}]

p "--------"

$_Print0[$_0Sub[$_02][$_03]]
$_Print0[$_0Mul[$_01][$_03]]

$_Print0[ $_1IF[$_TRUE][$_02][$_01] ]
$_Print0[ $_0IF[ $_0GT[$_02][$_02] ][ $_01 ][ $_00 ] ]

p "--------"

$_Print0[$_1IF[$_IsTUPLE[ $_T[$_1][$_NULL] ]][$_00][$_01]]
$_Print[ $_LEN[$_LIST[$_TAIL[$_1]][$_2][$_HEAD]] ]

p "--------"

list = $_LIST[$_TAIL[$_2]][$_TRUE][$_5][$_HEAD]
$_Print[$_LEN[list]][0]
$_Print[$_LIST_AT[list][$_0]][0]
$_PrintList[list][0]

p "--------"
list = $_LIST_SUB[list][$_1][$_FALSE]
$_PrintList[list][0]

p "--------"
list = $_LIST[$_TAIL[$_1]][$_2][$_5][$_HEAD]
list = $_LIST_MAP[list][ L{|v| $_1Add1[v]} ]
$_PrintList[list][0]

p "--------"
$_Print[$_LIST_IDX[list][L{|v| $_1EQ[v][$_3]}]][0]

p "--------"
s1 = $_STR[$_LIST[$_TAIL[$_A_]][$_B_][$_C_][$_HEAD]]
s2 = $_STR[$_LIST[$_TAIL[$_A_]][$_B_][$_C_][$_HEAD]]
$_Print[ $_STR_EQ[s1][s2] ][0]

v1 = $_VAR[$_0]
v2 = $_VAR[$_1]
$_Print[ $_VAR_EQ[v1][v2] ][0]

p "--------"
v = $_VAR[$_0]
x = $_VAR[$_1]
e = $_NULL

l = $_LET[v][$_9][$_Add1[$_2]]

$_Print[$_EVAL[l][e]][0]
p "-------->>"

p Time.now

e = $_NULL
sum = $_VAR[$_0]
v = $_VAR[$_1]

p = $_LET[sum][
      $_PROC[v][
        $_IF[$_EQ[v][$_2]][
          $_Add[v][$_3]
        ][
          $_Do[sum][$_Add1[v]]
        ]
      ]
    ][$_Do[sum][$_1]]

$_Print[$_EVAL[p][e]][0]

p Time.now

p "--------"