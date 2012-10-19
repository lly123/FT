require "./Two"
require "./Util"

$_Print0[$_0Sub[$_02][$_03]]
$_Print0[$_0Mul[$_01][$_03]]

$_Print0[ $_IF[$_TRUE][$_02][$_01] ]
$_Print0[ $_0IF[ $_0GT[$_02][$_02] ][ $_01 ][ $_00 ] ]

p "--------"

#$_LEN[$_LIST[$_TAIL[$_1]][$_HEAD]]
$_Print0[$_IF[$_IsTUPLE[ $_T[$_1][$_NULL] ]][$_00][$_01]]
$_Print[ $_LEN[$_LIST[$_TAIL[$_1]][$_2][$_HEAD]] ]

p "--------"

list = $_LIST[$_TAIL[$_2]][$_3][$_5][$_HEAD]
#$_PrintList[list]
$_Print[$_IsZero[$_0]][0]

$_Print[$_FST[list]][0]
$_Print[$_LIST_AT[list][$_2]][0]
#$_Print[ $_Add[$_1][$_5] ]

