#NoTrayIcon
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
$Form1 = GUICreate("分辨率设置工具", 353, 241, 310, 230)
$Group1 = GUICtrlCreateGroup("分辨率设置", 8, 8, 337, 217)
$Radio1 = GUICtrlCreateRadio("19寸普屏液晶", 48, 48, 113, 17)
$Radio2 = GUICtrlCreateRadio("19寸宽屏液晶", 48, 96, 113, 17)
$Radio3 = GUICtrlCreateRadio("22寸普屏液晶", 200, 48, 113, 17)
$Radio4 = GUICtrlCreateRadio("24寸普屏液晶", 200, 96, 113, 17)
$tab0button = GUICtrlCreateButton("设    定", 48, 128, 91, 33)
$tab0button1 = GUICtrlCreateButton("恢    复", 200, 128, 91, 33)
HotKeySet("{ESC}", "DefaultRes")
$Label1 = GUICtrlCreateLabel("说明：如果不小心点错，导致电脑黑屏，无法点恢复按扭，请       直接按ESC键恢复默认设置。", 16, 168, 324, 49)
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetTip(-1, "退出")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)

While 1
        $msg = GUIGetMsg()
        Select
                Case $msg = $GUI_EVENT_CLOSE
                        ExitLoop
                Case $msg = $tab0button
                        _res()
                Case $msg = $GUI_EVENT_CLOSE Or $msg = $tab0button1
                        DefaultRes()
        EndSelect
WEnd
Func _res()
            If GUICtrlRead($Radio1) = $GUI_CHECKED Then
                _ChangeScreenRes (1280, 960, 32, 75)
        EndIf
        If GUICtrlRead($Radio2) = $GUI_CHECKED Then
                _ChangeScreenRes (1280, 1024, 32, 75)
        EndIf
        If GUICtrlRead($Radio3) = $GUI_CHECKED Then
                _ChangeScreenRes (1600, 900, 32, 75)
        EndIf
        If GUICtrlRead($Radio4) = $GUI_CHECKED Then
                _ChangeScreenRes (1920, 1080, 32, 75)
        EndIf
EndFunc   ;==>_res
Func DefaultRes()
        _ChangeScreenRes (1024, 768, 32, 75)
EndFunc   ;==>DefaultRes



Func _ChangeScreenRes($i_Width, $i_Height, $i_BitsPP, $i_RefreshRate)
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