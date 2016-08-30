#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=..\autoit电子书教程.exe
#AutoIt3Wrapper_outfile=装机工具V3.2 X86&X64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=装机工具V3.2
#AutoIt3Wrapper_Res_Fileversion=3.2.0.0
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <INet.au3>
#include <EditConstants.au3>
#Include <WinAPIEx.au3>
#Include <GuiListView.au3>
#Include <GuiListView.au3>
DirCreate(@ProgramFilesDir & "\Systemtools")
Opt("TrayIconHide", 1)
Global $Systemtools = @ProgramFilesDir & "\Systemtools"
ProgressOn("","","正在解压应用软件...",-1,-1,1)
For $i = 10 To 40 Step 10
	sleep(100)
	ProgressSet($i,"正在解压应用软件...")
Next
FileInstall("Tools\综合检测.exe",$Systemtools & "\综合检测.exe",1)
FileInstall("Tools\CPU检测.exe",$Systemtools & "\CPU检测.exe",1)
FileInstall("Tools\内存检测.exe",$Systemtools & "\内存检测.exe",1)
FileInstall("Tools\温度检测.exe",$Systemtools & "\温度检测.exe",1)
FileInstall("Tools\硬盘检测.exe",$Systemtools & "\硬盘检测.exe",1)
FileInstall("Tools\网卡检测.exe",$Systemtools & "\网卡检测.exe",1)
FileInstall("Tools\网络检测.exe",$Systemtools & "\网络检测.exe",1)
FileInstall("Tools\鼠标检测.exe",$Systemtools & "\鼠标检测.exe",1)
FileInstall("Tools\键盘检测.exe",$Systemtools & "\键盘检测.exe",1)
FileInstall("Tools\声卡检测.exe",$Systemtools & "\声卡检测.exe",1)
FileInstall("Tools\USB检测.exe",$Systemtools & "\USB检测.exe",1)
FileInstall("Tools\屏幕检测.exe",$Systemtools & "\屏幕检测.exe",1)
FileInstall("Tools\显卡检测.exe",$Systemtools & "\显卡检测.exe",1)
FileInstall("Skin\Skin.dll",$Systemtools & "\Skin.dll",1)
FileInstall("Skin\aero.she",$Systemtools & "\aero.she",1)
FileInstall("Tools\cpuz.ini",$Systemtools & "\cpuz.ini",1)
FileInstall("Tools\cpuz_readme_cn.txt",$Systemtools & "\cpuz_readme_cn.txt",1)
For $i = 40 To 50 Step 10
	sleep(100)
	ProgressSet($i,"正在解压应用软件...")
Next
ShellExecuteWait($Systemtools & "\综合检测.exe")
For $i = 60 To 80 Step 10
	Sleep(100)
	ProgressSet($i,"正在检测核心硬件型号...")
Next
ShellExecuteWait($Systemtools & "\AIDA64\aida64.exe",' /r /custom user.rpf /ini report.ini /silent',$Systemtools & "\AIDA64")
For $i = 90 To 100 Step 10
	Sleep(100)
	ProgressSet($i,"全部完成,进入软件中...")
Next
Sleep(500)
ProgressOff()
$CPU = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","中央处理器(CPU)","中央处理器(CPU)|处理器名称","")
$beiqiao = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","芯片组","芯片组1|北桥属性|北桥","")
$nanqiao = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","芯片组","芯片组2|南桥属性|南桥","")
$Vidao = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","PCI/AGP 视频","PCI/AGP 视频1","")
$Audio = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","PCI/PnP 音频","PCI/PnP 音频1","")
$Network = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","PCI/PnP 网络","PCI/PnP 网络1","")
$waiwangip = _GetIP()
;皮肤调用
$skins = $Systemtools & "\aero.she"
$Dll = DllOpen($Systemtools & "\Skin.dll")
DllCall($Dll, "int", "SkinH_AttachEx", "str", $skins, "str", "mhgd")
DllCall($Dll, "int", "SkinH_SetAero", "int", 1)
;皮肤调用结束
#Region ### START Koda GUI section ### Form=D:\我的文档\桌面\装机工具V3.1\装机工具V3.0.kxf
$Form1_1 = GUICreate("装机工具V3.2 by Eason", 586, 507, 222, 136)
$Tab1 = GUICtrlCreateTab(16, 40, 553, 441)
GUICtrlSetFont(-1, 9, 400, 0, "Arial")
$TabSheet1 = GUICtrlCreateTabItem("基本硬件信息")
$ListView1 = GUICtrlCreateListView("硬件|型号 ", 32, 175, 513, 249)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
_GUICtrlListView_SetColumnWidth($ListView1,0,80);设置项目的宽度
_GUICtrlListView_SetColumnWidth($ListView1,1,410);设置项目的宽度
GUICtrlCreateListViewItem("CPU|" & $CPU,$ListView1)
GUICtrlCreateListViewItem("主板|[北桥] " & $beiqiao,$ListView1)
GUICtrlCreateListViewItem("|[南桥] " & $nanqiao,$ListView1)
GUICtrlCreateListViewItem("显卡|" & $Vidao,$ListView1)
GUICtrlCreateListViewItem("声卡|" & $Audio,$ListView1)
GUICtrlCreateListViewItem("网卡|" & $Network,$ListView1)
GUICtrlCreateListViewItem("计算机名|" & @ComputerName,$ListView1)
GUICtrlCreateListViewItem("内网地址|" & @IPAddress1,$ListView1)
GUICtrlCreateListViewItem("外网地址|" & $waiwangip,$ListView1)
$Label = GUICtrlCreateLabel("核心硬件型号", 200, 112, 276, 37)
GUICtrlSetFont(-1, 24, 400, 0, "黑体")
$Button25 = GUICtrlCreateButton("重新检测", 176, 432, 209, 33)
$TabSheet2 = GUICtrlCreateTabItem("Windows内部工具")
$Button1 = GUICtrlCreateButton("自动登陆", 56, 144, 105, 33)
$Button2 = GUICtrlCreateButton("启动项目", 176, 144, 105, 33)
$Button3 = GUICtrlCreateButton("安全策略", 296, 144, 105, 33)
$Button4 = GUICtrlCreateButton("组策略", 416, 144, 105, 33)
$Button5 = GUICtrlCreateButton("策略结果", 56, 192, 105, 33)
$Button6 = GUICtrlCreateButton("注册表", 176, 192, 105, 33)
$Button8 = GUICtrlCreateButton("设备管理", 416, 192, 105, 33)
$Button7 = GUICtrlCreateButton("共享管理", 296, 192, 105, 33)
$Button9 = GUICtrlCreateButton("用户管理", 56, 240, 105, 33)
$Button10 = GUICtrlCreateButton("证书管理", 176, 240, 105, 33)
$Button11 = GUICtrlCreateButton("网络连接", 296, 240, 105, 33)
$Button12 = GUICtrlCreateButton("数据源", 416, 240, 105, 33)
$Button13 = GUICtrlCreateButton("系统服务", 56, 288, 105, 33)
$Button14 = GUICtrlCreateButton("系统日志", 176, 288, 105, 33)
$Button15 = GUICtrlCreateButton("DX  诊断", 296, 288, 105, 33)
$Button16 = GUICtrlCreateButton("DW  医生", 416, 288, 105, 33)
$Button17 = GUICtrlCreateButton("屏幕键盘", 56, 336, 105, 33)
$Button18 = GUICtrlCreateButton("磁盘管理", 176, 336, 105, 33)
$Button19 = GUICtrlCreateButton("碎片整理", 296, 336, 105, 33)
$Button20 = GUICtrlCreateButton("磁盘清理", 416, 336, 105, 33)
$Button21 = GUICtrlCreateButton("声卡设置", 56, 384, 105, 33)
$Button22 = GUICtrlCreateButton("鼠标设置", 176, 384, 105, 33)
$Button23 = GUICtrlCreateButton("添加或删除程序", 296, 384, 105, 33)
$Button24 = GUICtrlCreateButton("控制面板", 416, 384, 105, 33)
$TabSheet3 = GUICtrlCreateTabItem("设备检测工具")
$Button26 = GUICtrlCreateButton("综合检测", 56, 144, 105, 33)
$Button27 = GUICtrlCreateButton("CPU检测", 176, 144, 105, 33)
$Button28 = GUICtrlCreateButton("内存检测", 296, 144, 105, 33)
$Button29 = GUICtrlCreateButton("显卡检测", 416, 144, 105, 33)
$Button30 = GUICtrlCreateButton("鼠标检测", 56, 192, 105, 33)
$Button31 = GUICtrlCreateButton("网卡检测", 176, 192, 105, 33)
$Button32 = GUICtrlCreateButton("网络检测", 296, 192, 105, 33)
$Button33 = GUICtrlCreateButton("硬盘检测", 416, 192, 105, 33)
$Button34 = GUICtrlCreateButton("键盘检测", 56, 240, 105, 33)
$Button35 = GUICtrlCreateButton("USB检测", 176, 240, 105, 33)
$Button36 = GUICtrlCreateButton("温度检测", 296, 240, 105, 33)
$Button37 = GUICtrlCreateButton("声卡检测", 416, 240, 105, 33)
$Button39 = GUICtrlCreateButton("屏幕检测", 56, 288, 105, 33)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			_WinAPI_AnimateWindow($Form1_1,BitOR($AW_BLEND, $AW_HIDE),450) ;淡化消失效果
			Exit_()
		Case $Button1
                Run("control userpasswords2")
        Case $Button2
                Run("msconfig.exe")
        Case $Button3
                Run("mmc secpol.msc")
        Case $Button4
                Run("mmc gpedit.msc")
        Case $Button5
                Run("mmc rsop.msc")
        Case $Button6
                Run("regedit.exe")
        Case $Button8
                Run("mmc devmgmt.msc")
        Case $Button7
                Run("mmc fsmgmt.msc")
        Case $Button9
                Run("mmc lusrmgr.msc")
        Case $Button10
                Run("mmc certmgr.msc")
        Case $Button11
                Run("control ncpa.cpl")
        Case $Button12
                Run("control odbccp32.cpl")
        Case $Button13
                Run("mmc services.msc")
        Case $Button14
                Run("mmc eventvwr.msc")
        Case $Button15
                Run("dxdiag.exe")
        Case $Button16
                Run("drwtsn32.exe")
        Case $Button17
                Run("osk.exe")
        Case $Button18
                Run("mmc diskmgmt.msc")
        Case $Button19
                Run("mmc dfrg.msc")
        Case $Button20
                Run("cleanmgr.exe")
        Case $Button21
                Run("control mmsys.cpl,,3")
        Case $Button22
                Run("control main.cpl,,2")
		Case $Button23
				ShellExecute(@SystemDir & "\appwiz.cpl")
		Case $Button24
				Run("control")
        Case $Button26
                Run($Systemtools & "\AIDA64\aida64.exe")
        Case $Button27
                Run($Systemtools & "\CPU检测.exe")
        Case $Button28
                Run($Systemtools & "\内存检测.exe")
        Case $Button29
                Run($Systemtools & "\显卡检测.exe")
        Case $Button30
                Run($Systemtools & "\鼠标检测.exe")
        Case $Button31
                Run($Systemtools & "\网卡检测.exe")
        Case $Button32
                Run($Systemtools & "\网络检测.exe")
        Case $Button33
                Run($Systemtools & "\硬盘检测.exe")
        Case $Button34
                Run($Systemtools & "\键盘检测.exe")
        Case $Button35
                Run($Systemtools & "\USB检测.exe")
        Case $Button36
                Run($Systemtools & "\温度检测.exe")
        Case $Button37
                Run($Systemtools & "\声卡检测.exe")
		Case $Button39
                Run($Systemtools & "\屏幕检测.exe")
		Case $Button25
				echo()
				
				

	EndSwitch
WEnd
;退出删除文件夹定义
Func Exit_()
	GUISetState(@SW_SHOW)
	DllClose($Dll)
	DirRemove($Systemtools,1)
	Exit
EndFunc
;重新扫描按钮定义
Func echo()
	_GUICtrlListView_DeleteAllItems($ListView1);刷新列表功能
	ProgressOn("","","正在检测硬件中...",-1,-1,1)
	For $i = 10 To 70 Step 10
		Sleep(100)
	ProgressSet($i,"正在检测硬件中...")
	Next
	ShellExecuteWait($Systemtools & "\AIDA64\aida64.exe",' /r /custom user.rpf /ini report.ini /silent',$Systemtools & "\AIDA64")
	For $i = 70 To 90 Step 10
		Sleep(100)
	ProgressSet($i,"正在导入中...")
	Next
	$CPUC = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","中央处理器(CPU)","中央处理器(CPU)|处理器名称","")
	$beiqiaoC = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","芯片组","芯片组1|北桥属性|北桥","")
	$nanqiaoC = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","芯片组","芯片组2|南桥属性|南桥","")
	$VidaoC = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","PCI/AGP 视频","PCI/AGP 视频1","")
	$AudioC = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","PCI/PnP 音频","PCI/PnP 音频1","")
	$NetworkC = IniRead($Systemtools & "\AIDA64\Reports\Report.ini","PCI/PnP 网络","PCI/PnP 网络1","")
	$waiwangipC = _GetIP()
	GUICtrlCreateListViewItem("CPU|" & $CPUC,$ListView1)
	GUICtrlCreateListViewItem("主板|[北桥] " & $beiqiaoC,$ListView1)
	GUICtrlCreateListViewItem("|[南桥] " & $nanqiaoC,$ListView1)
	GUICtrlCreateListViewItem("显卡|" & $VidaoC,$ListView1)
	GUICtrlCreateListViewItem("声卡|" & $AudioC,$ListView1)
	GUICtrlCreateListViewItem("网卡|" & $NetworkC,$ListView1)
	GUICtrlCreateListViewItem("计算机名|" & @ComputerName,$ListView1)
	GUICtrlCreateListViewItem("内网地址|" & @IPAddress1,$ListView1)
	GUICtrlCreateListViewItem("外网地址|" & $waiwangipC,$ListView1)
	For $i = 90 To 100 Step 10
		Sleep(100)
	ProgressSet($i,"导入完成！")
	Next
	Sleep(300)
	ProgressOff()
EndFunc

	

	