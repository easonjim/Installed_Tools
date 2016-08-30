#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=..\autoit电子书教程.exe|-1
#AutoIt3Wrapper_outfile=装机工具V3.exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <INet.au3>
#include <EditConstants.au3>
DirCreate("C:\WINDOWS\temp\Systemtools")
Opt("TrayIconHide", 1)
ProgressOn("","","正在解压应用软件...",-1,-1,1)
For $i = 10 To 40 Step 10
	sleep(100)
	ProgressSet($i,"正在解压应用软件...")
Next
FileInstall("Tools\综合检测.exe","C:\WINDOWS\temp\Systemtools\综合检测.exe",1)
FileInstall("Tools\CPU检测.exe","C:\WINDOWS\temp\Systemtools\CPU检测.exe",1)
FileInstall("Tools\内存检测.exe","C:\WINDOWS\temp\Systemtools\内存检测.exe",1)
FileInstall("Tools\温度检测.exe","C:\WINDOWS\temp\Systemtools\温度检测.exe",1)
FileInstall("Tools\硬盘检测.exe","C:\WINDOWS\temp\Systemtools\硬盘检测.exe",1)
FileInstall("Tools\网卡检测.exe","C:\WINDOWS\temp\Systemtools\网卡检测.exe",1)
FileInstall("Tools\网络检测.exe","C:\WINDOWS\temp\Systemtools\网络检测.exe",1)
FileInstall("Tools\鼠标检测.exe","C:\WINDOWS\temp\Systemtools\鼠标检测.exe",1)
FileInstall("Tools\键盘检测.exe","C:\WINDOWS\temp\Systemtools\键盘检测.exe",1)
FileInstall("Tools\声卡检测.exe","C:\WINDOWS\temp\Systemtools\声卡检测.exe",1)
FileInstall("Tools\USB检测.exe","C:\WINDOWS\temp\Systemtools\USB检测.exe",1)
FileInstall("Tools\屏幕检测.exe","C:\WINDOWS\temp\Systemtools\屏幕检测.exe",1)
FileInstall("Tools\显卡检测.exe","C:\WINDOWS\temp\Systemtools\显卡检测.exe",1)
FileInstall("Skin\SkinCrafterDll.dll","C:\WINDOWS\temp\Systemtools\SkinCrafterDll.dll",1)
FileInstall("Skin\vista_style.skf","C:\WINDOWS\temp\Systemtools\vista_style.skf",1)
FileInstall("Tools\cpuz.ini","C:\WINDOWS\temp\Systemtools\cpuz.ini",1)
FileInstall("Tools\cpuz_readme_cn.txt","C:\WINDOWS\temp\Systemtools\cpuz_readme_cn.txt",1)
For $i = 40 To 50 Step 10
	sleep(100)
	ProgressSet($i,"正在解压应用软件...")
Next
ShellExecuteWait("C:\WINDOWS\temp\Systemtools\综合检测.exe")
For $i = 60 To 80 Step 10
	Sleep(100)
	ProgressSet($i,"正在检测核心硬件型号...")
Next
ShellExecuteWait("C:\WINDOWS\temp\Systemtools\AIDA64\aida64.exe",' /r /custom user.rpf /ini report.ini /silent',"C:\WINDOWS\temp\Systemtools\AIDA64")
For $i = 90 To 100 Step 10
	Sleep(100)
	ProgressSet($i,"全部完成,进入软件中...")
Next
Sleep(500)
ProgressOff()
$CPU = IniRead("C:\WINDOWS\temp\Systemtools\AIDA64\Reports\Report.ini","中央处理器(CPU)","中央处理器(CPU)|处理器名称","")
$nanqiao = IniRead("C:\WINDOWS\temp\Systemtools\AIDA64\Reports\Report.ini","芯片组","芯片组1|北桥属性|北桥","")
$beiqiao = IniRead("C:\WINDOWS\temp\Systemtools\AIDA64\Reports\Report.ini","芯片组","芯片组2|南桥属性|南桥","")
$Vidao = IniRead("C:\WINDOWS\temp\Systemtools\AIDA64\Reports\Report.ini","PCI/AGP 视频","PCI/AGP 视频1","")
$Audio = IniRead("C:\WINDOWS\temp\Systemtools\AIDA64\Reports\Report.ini","PCI/PnP 音频","PCI/PnP 音频1","")
$Network = IniRead("C:\WINDOWS\temp\Systemtools\AIDA64\Reports\Report.ini","PCI/PnP 网络","PCI/PnP 网络1","")
$waiwangip = _GetIP()
#Region ### START Koda GUI section ### Form=d:\我的文档\桌面\装机工具v3.0\装机工具v3.0.kxf
$Form1_1 = GUICreate("装机工具V3.0 by Eason", 586, 507, 187, 127)
_SkinGUI("C:\WINDOWS\temp\Systemtools\SkinCrafterDll.dll", "C:\WINDOWS\temp\Systemtools\vista_style.skf", $Form1_1)
$Tab1 = GUICtrlCreateTab(16, 40, 553, 441)
GUICtrlSetFont(-1, 10, 400, 0, "Arial")
$TabSheet1 = GUICtrlCreateTabItem("===>基本硬件信息<===")
$Label1 = GUICtrlCreateLabel("CPU：", 64, 94, 46, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label2 = GUICtrlCreateLabel("主板：", 56, 134, 54, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label3 = GUICtrlCreateLabel("显卡：", 56, 214, 54, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label4 = GUICtrlCreateLabel("声卡：", 56, 254, 54, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label5 = GUICtrlCreateLabel("网卡：", 56, 294, 54, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label6 = GUICtrlCreateLabel("计算机名：", 32, 334, 78, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label7 = GUICtrlCreateLabel("内网地址：", 32, 374, 78, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Label8 = GUICtrlCreateLabel("外网地址：", 32, 414, 78, 18)
GUICtrlSetFont(-1, 11, 400, 0, "黑体")
$Input1 = GUICtrlCreateInput($CPU, 128, 90, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input2 = GUICtrlCreateInput("[南桥] " & $nanqiao, 128, 130, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input3 = GUICtrlCreateInput("[北桥] " & $beiqiao, 128, 170, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input4 = GUICtrlCreateInput($Vidao, 128, 210, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input5 = GUICtrlCreateInput($Audio, 128, 250, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input6 = GUICtrlCreateInput($Network, 128, 290, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input7 = GUICtrlCreateInput(@ComputerName, 128, 330, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input8 = GUICtrlCreateInput(@IPAddress1, 128, 370, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input9 = GUICtrlCreateInput($waiwangip, 128, 410, 385, 24,$ES_READONLY)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$TabSheet2 = GUICtrlCreateTabItem("===>Windows内部工具<===")
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
HotKeySet("{Enter}","_entercmd")
$Input11 = GUICtrlCreateInput("", 64, 440, 369, 24)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Button38 = GUICtrlCreateButton("运行命令", 448, 440, 65, 25)
$TabSheet3 = GUICtrlCreateTabItem("===>设备检测工具<===")
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
			Exit
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
        Case $Button38
                $inputcmd = GUICtrlRead($Input11)
                ShellExecute($inputcmd)
        Case $Button26
                Run("C:\WINDOWS\temp\Systemtools\AIDA64\aida64.exe")
        Case $Button27
                Run("C:\WINDOWS\temp\Systemtools\CPU检测.exe")
        Case $Button28
                Run("C:\WINDOWS\temp\Systemtools\内存检测.exe")
        Case $Button29
                Run("C:\WINDOWS\temp\Systemtools\显卡检测.exe")
        Case $Button30
                Run("C:\WINDOWS\temp\Systemtools\鼠标检测.exe")
        Case $Button31
                Run("C:\WINDOWS\temp\Systemtools\网卡检测.exe")
        Case $Button32
                Run("C:\WINDOWS\temp\Systemtools\网络检测.exe")
        Case $Button33
                Run("C:\WINDOWS\temp\Systemtools\硬盘检测.exe")
        Case $Button34
                Run("C:\WINDOWS\temp\Systemtools\键盘检测.exe")
        Case $Button35
                Run("C:\WINDOWS\temp\Systemtools\USB检测.exe")
        Case $Button36
                Run("C:\WINDOWS\temp\Systemtools\温度检测.exe")
        Case $Button37
                Run("C:\WINDOWS\temp\Systemtools\声卡检测.exe")
		Case $Button39
                Run("C:\WINDOWS\temp\Systemtools\屏幕检测.exe")
				

	EndSwitch
WEnd
;皮肤调用
Func _SkinGUI($SkincrafterDll, $SkincrafterSkin, $Handle) 
   $Dll = DllOpen($SkincrafterDll) 
   DllCall($Dll, "int:cdecl", "InitLicenKeys", "wstr", "1", "wstr", "", "wstr", "1@1.com", "wstr", "1") 
   DllCall($Dll, "int:cdecl", "InitDecoration", "int", 1) 
   DllCall($Dll, "int:cdecl", "LoadSkinFromFile", "wstr", $SkincrafterSkin) 
   DllCall($Dll, "int:cdecl", "DecorateAs", "int", $Handle, "int", 25) 
   DllCall($Dll, "int:cdecl", "ApplySkin")
EndFunc
;回车运行命令的函数
Func _entercmd()
        Local $enterinput
        $enterinput = GUICtrlRead($Input11)
        ShellExecute($enterinput)
EndFunc
;回车运行命令的函数结束


