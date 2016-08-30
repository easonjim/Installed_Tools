#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>

#Include <ACN_MISC.au3>
#Include <GuiListView.au3>
Global $DesktopWidth = @DesktopWidth , $DesktopHeight = @DesktopHeight , $DesktopDepth = @DesktopDepth , $DesktopRefresh = @DesktopRefresh 
#Region ### START Koda GUI section ### Form=D:\我的文档\桌面\装机工具V3.3\装机工具V3.0.kxf
$Form1_1 = GUICreate("Form1", 586, 507, 184, 141)
$Tab1 = GUICtrlCreateTab(16, 40, 553, 441)
GUICtrlSetFont(-1, 9, 400, 0, "Arial")
$TabSheet1 = GUICtrlCreateTabItem("TabSheet1")
$ListView1 = GUICtrlCreateListView("", 32, 175, 513, 249)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label = GUICtrlCreateLabel("Label", 160, 112, 84, 37)
GUICtrlSetFont(-1, 24, 400, 0, "黑体")
$Button25 = GUICtrlCreateButton("Button25", 176, 432, 209, 33)
$TabSheet2 = GUICtrlCreateTabItem("TabSheet2")
$Button1 = GUICtrlCreateButton("Button1", 56, 143, 105, 33)
$Button2 = GUICtrlCreateButton("Button1", 176, 143, 105, 33)
$Button3 = GUICtrlCreateButton("Button1", 296, 143, 105, 33)
$Button4 = GUICtrlCreateButton("Button1", 416, 143, 105, 33)
$Button5 = GUICtrlCreateButton("Button1", 56, 191, 105, 33)
$Button6 = GUICtrlCreateButton("Button1", 176, 191, 105, 33)
$Button8 = GUICtrlCreateButton("Button1", 416, 191, 105, 33)
$Button7 = GUICtrlCreateButton("Button1", 296, 191, 105, 33)
$Button9 = GUICtrlCreateButton("Button1", 56, 239, 105, 33)
$Button10 = GUICtrlCreateButton("Button1", 176, 239, 105, 33)
$Button11 = GUICtrlCreateButton("Button1", 296, 239, 105, 33)
$Button12 = GUICtrlCreateButton("Button1", 416, 239, 105, 33)
$Button13 = GUICtrlCreateButton("Button1", 56, 287, 105, 33)
$Button14 = GUICtrlCreateButton("Button1", 176, 287, 105, 33)
$Button15 = GUICtrlCreateButton("Button1", 296, 287, 105, 33)
$Button16 = GUICtrlCreateButton("Button1", 416, 287, 105, 33)
$Button17 = GUICtrlCreateButton("Button1", 56, 335, 105, 33)
$Button18 = GUICtrlCreateButton("Button1", 176, 335, 105, 33)
$Button19 = GUICtrlCreateButton("Button1", 296, 335, 105, 33)
$Button20 = GUICtrlCreateButton("Button1", 416, 335, 105, 33)
$Button21 = GUICtrlCreateButton("Button1", 56, 383, 105, 33)
$Button22 = GUICtrlCreateButton("Button1", 176, 383, 105, 33)
$Button23 = GUICtrlCreateButton("Button1", 296, 383, 105, 33)
$Button24 = GUICtrlCreateButton("Button1", 416, 383, 105, 33)
$Input11 = GUICtrlCreateInput("Input11", 64, 439, 369, 24)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Button38 = GUICtrlCreateButton("Button38", 448, 439, 65, 25)
$TabSheet3 = GUICtrlCreateTabItem("TabSheet3")
$Button26 = GUICtrlCreateButton("Button1", 56, 143, 105, 33)
$Button27 = GUICtrlCreateButton("Button1", 176, 143, 105, 33)
$Button28 = GUICtrlCreateButton("Button1", 296, 143, 105, 33)
$Button29 = GUICtrlCreateButton("Button1", 416, 143, 105, 33)
$Button30 = GUICtrlCreateButton("Button1", 56, 191, 105, 33)
$Button31 = GUICtrlCreateButton("Button1", 176, 191, 105, 33)
$Button32 = GUICtrlCreateButton("Button1", 296, 191, 105, 33)
$Button33 = GUICtrlCreateButton("Button1", 416, 191, 105, 33)
$Button34 = GUICtrlCreateButton("Button1", 56, 239, 105, 33)
$Button35 = GUICtrlCreateButton("Button1", 176, 239, 105, 33)
$Button36 = GUICtrlCreateButton("Button1", 296, 239, 105, 33)
$Button37 = GUICtrlCreateButton("Button1", 416, 239, 105, 33)
$Button39 = GUICtrlCreateButton("Button1", 56, 287, 105, 33)
$TabSheet4 = GUICtrlCreateTabItem("TabSheet4")
GUICtrlSetState(-1,$GUI_SHOW)
$ListView2 = GUICtrlCreateListView("屏幕宽度|屏幕高度|桌面颜色深度|屏幕刷新率", 180, 88, 370, 41)
$Label1 = GUICtrlCreateLabel("当前分辨率：", 72, 100, 140, 33)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
GUICtrlCreateListViewItem($DesktopWidth & "|" & $DesktopHeight & "|" & $DesktopDepth & "|" & $DesktopRefresh,$ListView2)
$Group1 = GUICtrlCreateGroup("CRT显示器", 32, 152, 169, 225)
$Group2 = GUICtrlCreateGroup("LCD显示器", 208, 152, 169, 225)
$Group3 = GUICtrlCreateGroup("宽屏显示器", 384, 152, 169, 225)
$Radio1 = GUICtrlCreateRadio("800*600*32*75", 48, 176, 137, 17)
$Radio2 = GUICtrlCreateRadio("800*600*32*85", 48, 192, 137, 17)
$Radio3 = GUICtrlCreateRadio("1024*768*32*75", 48, 208, 137, 17)
$Radio4 = GUICtrlCreateRadio("1024*768*32*85", 48, 224, 137, 17)
$Radio5 = GUICtrlCreateRadio("1280*1024*32*75", 48, 240, 137, 17)
$Radio6 = GUICtrlCreateRadio("1280*1024*32*85", 48, 256, 137, 17)

$Radio10 = GUICtrlCreateRadio("1024*768*32*60", 224, 176, 137, 17)
$Radio11 = GUICtrlCreateRadio("1024*768*32*70", 224, 192, 137, 17)
$Radio12 = GUICtrlCreateRadio("1280*1024*32*60", 224, 208, 137, 17)
$Radio13 = GUICtrlCreateRadio("1280*1024*32*70", 224, 224, 137, 17)

$Radio19 = GUICtrlCreateRadio("1024*600*32*60", 400, 176, 137, 17)
$Radio20 = GUICtrlCreateRadio("1280*800*32*60", 400, 192, 137, 17)
$Radio21 = GUICtrlCreateRadio("1366*768*32*60", 400, 208, 137, 17)
$Radio22 = GUICtrlCreateRadio("1440*900*32*60", 400, 224, 137, 17)
$Radio23 = GUICtrlCreateRadio("1600*900*32*60", 400, 240, 137, 17)
$Radio24 = GUICtrlCreateRadio("1680*1050*32*60", 400, 256, 137, 17)
$Radio25 = GUICtrlCreateRadio("1920*1080*32*60", 400, 272, 137, 17)
$Radio26 = GUICtrlCreateRadio("1920*1200*32*60", 400, 288, 137, 17)
$Button40 = GUICtrlCreateButton("设  定", 144, 440, 121, 33)
$Button41 = GUICtrlCreateButton("恢  复", 328, 440, 121, 33)
HotKeySet("^r","huifu")
$Label2 = GUICtrlCreateLabel("说明：如果不小心点错，导致电脑黑屏，无法点恢复按扭，请直接按Ctrl+R键恢复调节前设置", 32, 392, 524, 49)
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button40
			fenbianlv()
			xianshi()
		Case $Button41
			huifu()

	EndSwitch
WEnd
;定义分辨率按钮执行函数
Func fenbianlv()
	If GUICtrlRead($Radio1) = $GUI_CHECKED Then
		_ChangeScreenRes(800,600,32,75)
	EndIf
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then
		_ChangeScreenRes(800,600,32,85)
	EndIf
	If GUICtrlRead($Radio3) = $GUI_CHECKED Then
		_ChangeScreenRes(1024,768,32,75)
	EndIf
	If GUICtrlRead($Radio4) = $GUI_CHECKED Then
		_ChangeScreenRes(1024,768,32,85)
	EndIf
	If GUICtrlRead($Radio5) = $GUI_CHECKED Then
		_ChangeScreenRes(1280,1024,32,75)
	EndIf
	If GUICtrlRead($Radio6) = $GUI_CHECKED Then
		_ChangeScreenRes(1280,1024,32,85)
	EndIf
	If GUICtrlRead($Radio10) = $GUI_CHECKED Then
		_ChangeScreenRes(1024,768,32,60)
	EndIf
	If GUICtrlRead($Radio11) = $GUI_CHECKED Then
		_ChangeScreenRes(1024,768,32,70)
	EndIf
	If GUICtrlRead($Radio12) = $GUI_CHECKED Then
		_ChangeScreenRes(1280,1024,32,60)
	EndIf
	If GUICtrlRead($Radio13) = $GUI_CHECKED Then
		_ChangeScreenRes(1280,1024,32,70)
	EndIf
	If GUICtrlRead($Radio19) = $GUI_CHECKED Then
		_ChangeScreenRes(1024,600,32,60)
	EndIf
	If GUICtrlRead($Radio20) = $GUI_CHECKED Then
		_ChangeScreenRes(1280,800,32,60)
	EndIf
	If GUICtrlRead($Radio21) = $GUI_CHECKED Then
		_ChangeScreenRes(1366,768,32,60)
	EndIf
	If GUICtrlRead($Radio22) = $GUI_CHECKED Then
		_ChangeScreenRes(1440,900,32,60)
	EndIf
	If GUICtrlRead($Radio23) = $GUI_CHECKED Then
		_ChangeScreenRes(1600,900,32,60)
	EndIf
	If GUICtrlRead($Radio24) = $GUI_CHECKED Then
		_ChangeScreenRes(1680,1050,32,60)
	EndIf
	If GUICtrlRead($Radio25) = $GUI_CHECKED Then
		_ChangeScreenRes(1920,1080,32,60)
	EndIf
	If GUICtrlRead($Radio26) = $GUI_CHECKED Then
		_ChangeScreenRes(1920,1200,32,60)
	EndIf
EndFunc
;定义列表框随调节显示函数
Func xianshi()
	Global $DesktopWidth1 = @DesktopWidth , $DesktopHeight1 = @DesktopHeight , $DesktopDepth1 = @DesktopDepth , $DesktopRefresh1 = @DesktopRefresh 
	_GUICtrlListView_DeleteAllItems($ListView2);刷新列表功能
	GUICtrlCreateListViewItem($DesktopWidth1 & "|" & $DesktopHeight1 & "|" & $DesktopDepth1 & "|" & $DesktopRefresh1,$ListView2)
EndFunc
;定义恢复调节分辨率前的函数
Func huifu()
	_ChangeScreenRes($DesktopWidth,$DesktopHeight,$DesktopDepth,$DesktopRefresh)
	xianshi();只是为了达到显示列表的目的，应和上面的热键功能
EndFunc
;$DesktopWidth  , $DesktopHeight  , $DesktopDepth  , $DesktopRefresh 运行前读取的分辨率
;$DesktopWidth1  , $DesktopHeight1  , $DesktopDepth1  , $DesktopRefresh1 运行后读取的分辨率
	