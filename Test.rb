require "./Two"
require "./Util"

$_Print0[$_0Sub[$_02][$_03]]
$_Print0[$_0Mul[$_01][$_03]]

$_Print0[ $_IF[$_TRUE][$_02][$_01] ]
$_Print0[ $_0IF[ $_0GT[$_02][$_02] ][ $_01 ][ $_00 ] ]

p "--------"

$_Print0[$_IF[$_IsTUPLE[ $_T[$_1][$_NULL] ]][$_00][$_01]]
$_Print[ $_LEN[$_LIST[$_TAIL[$_1]][$_2][$_HEAD]] ]

p "--------"

list = $_LIST[$_TAIL[$_2]][$_TRUE][$_5][$_HEAD]
$_Print[$_LEN[list]][0]
$_Print[$_LIST_AT[list][$_0]][0]
$_PrintList[list][0]

p "--------"
list = $_LIST_SUB[list][$_1][$_FALSE]
$_PrintList[list][0]
