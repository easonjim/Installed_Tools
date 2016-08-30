#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=E:\图文处理\备用图标\警察.ico
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstants.au3>

Const $n = 10
Dim $choose[$n]

$title = GUICreate("设置屏幕分辨率程序", 360, 170)
$Group = GUICtrlCreateGroup("", 5, 5, 350, 155)
$group1 = GUICtrlCreateGroup("CRT显示器", 10, 15, 110, 90)
$group2 = GUICtrlCreateGroup("LCD显示器", 125, 15, 110, 90)
$group3 = GUICtrlCreateGroup("宽屏显示器", 240, 15, 110, 90)
$choose[1] = GUICtrlCreateRadio("800*600*32*75", 12, 35, 105, 20)
$choose[2] = GUICtrlCreateRadio("1024*768*32*75", 12, 55, 105, 20)
$choose[3] = GUICtrlCreateRadio("1280*1024*32*75", 12, 75, 105, 20)
$choose[4] = GUICtrlCreateRadio("1024*768*32*70", 127, 35, 105, 20)
$choose[5] = GUICtrlCreateRadio("1024*768*32*60", 127, 55, 105, 20)
$choose[6] = GUICtrlCreateRadio("1280*1024*32*60", 127, 75, 105, 20)
$choose[7] = GUICtrlCreateRadio("1280*720*32*60", 242, 35, 105, 20)
$choose[8] = GUICtrlCreateRadio("1440*900*32*60", 242, 55, 105, 20)
$choose[9] = GUICtrlCreateRadio("1680*1050*32*60", 242, 75, 105, 20)

$Label=GUICtrlCreateLabel(" 分辨率设置过高可能会造成黑屏,按下CTRL+R可快速降低分辨率", 10, 115)
$LabelColor=GUICtrlSetColor(-1, 0xff0000)
$HotKey=HotKeySet("^r", "DefaultChangeScreenRes")

$Button1 = GUICtrlCreateButton("确定(&W)", 220, 135, 60, 20)
$Button2 = GUICtrlCreateButton("退出(&E)", 290, 135,60, 20)

GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $Button2
			ExitLoop
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[1]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$1 = _ChangeScreenRes(800, 600, 32, 75)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[2]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$2 = _ChangeScreenRes(1024, 768, 32, 75)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[3]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$3 = _ChangeScreenRes(1280, 1024, 32, 75)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[4]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$4 = _ChangeScreenRes(1024, 768, 32, 70)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[5]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$5 = _ChangeScreenRes(1024, 768, 32, 60)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[6]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$6 = _ChangeScreenRes(1280, 1024, 32, 60)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[7]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$7 = _ChangeScreenRes(1280, 720, 32, 60)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[8]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$8 = _ChangeScreenRes(1440, 900, 32, 60)
		Case $nMsg = $Button1 And BitAND(GUICtrlRead($choose[9]), $GUI_CHECKED) = $GUI_CHECKED ;BitAND为按位"与"运算
			$9 = _ChangeScreenRes(1680, 1050, 32, 60)
	EndSelect
WEnd

Func DefaultChangeScreenRes()
	_ChangeScreenRes(800, 600, 16, 60)
EndFunc   ;==>DefaultChangeScreenRes

Func _ChangeScreenRes($i_Width = @DesktopWidth, $i_Height = @DesktopHeight, $i_BitsPP = @DesktopDepth, $i_RefreshRate = @DesktopRefresh)
	Local Const $DM_PELSWIDTH = 0x00080000
	Local Const $DM_PELSHEIGHT = 0x00100000
	Local Const $DM_BITSPERPEL = 0x00040000
	Local Const $DM_DISPLAYFREQUENCY = 0x00400000
	Local Const $CDS_TEST = 0x00000002
	Local Const $CDS_UPDATEREGISTRY = 0x00000001
	Local Const $DISP_CHANGE_RESTART = 1
	Local Const $DISP_CHANGE_SUCCESSFUL = 0
	Local Const $HWND_BROADCAST = 0xffff
	Local Const $WM_DISPLAYCHANGE = 0x007E
	If $i_Width = "" Or $i_Width = -1 Then $i_Width = @DesktopWidth ; default to current setting
	If $i_Height = "" Or $i_Height = -1 Then $i_Height = @DesktopHeight ; default to current setting
	If $i_BitsPP = "" Or $i_BitsPP = -1 Then $i_BitsPP = @DesktopDepth ; default to current setting
	If $i_RefreshRate = "" Or $i_RefreshRate = -1 Then $i_RefreshRate = @DesktopRefresh ; default to current setting
	Local $DEVMODE = DllStructCreate("byte[32];int[10];byte[32];int[6]")
	Local $B = DllCall("user32.dll", "int", "EnumDisplaySettings", "ptr", 0, "long", 0, "ptr", DllStructGetPtr($DEVMODE))
	If @error Then
		$B = 0
		SetError(1)
		Return $B
	Else
		$B = $B[0]
	EndIf
	If $B <> 0 Then
		DllStructSetData($DEVMODE, 2, BitOR($DM_PELSWIDTH, $DM_PELSHEIGHT, $DM_BITSPERPEL, $DM_DISPLAYFREQUENCY), 5)
		DllStructSetData($DEVMODE, 4, $i_Width, 2)
		DllStructSetData($DEVMODE, 4, $i_Height, 3)
		DllStructSetData($DEVMODE, 4, $i_BitsPP, 1)
		DllStructSetData($DEVMODE, 4, $i_RefreshRate, 5)
		$B = DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_TEST)
		If @error Then
			$B = -1
		Else
			$B = $B[0]
		EndIf
		Select
			Case $B = $DISP_CHANGE_RESTART
				$DEVMODE = ""
				Return 2
			Case $B = $DISP_CHANGE_SUCCESSFUL
				DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_UPDATEREGISTRY)
				DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_DISPLAYCHANGE, _
						"int", $i_BitsPP, "int", $i_Height * 2 ^ 16 + $i_Width)
				$DEVMODE = ""
				Return 1
			Case Else
				$DEVMODE = ""
				SetError(1)
				Return $B
		EndSelect
	EndIf
EndFunc   ;==>_ChangeScreenRes