#Region ;**** ²ÎÊý´´½¨ÓÚ ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=..\autoitµç×ÓÊé½Ì³Ì.exe|-1
#AutoIt3Wrapper_outfile=×°»ú¹¤¾ßV2.0.exe
#AutoIt3Wrapper_Compression=4
#EndRegion ;**** ²ÎÊý´´½¨ÓÚ ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
TrayTip(" ","³ÌÐòÕýÔÚ½âÑ¹ÖÐ¡£¡£¡£",5)
Opt("TrayIconHide", 1)
FileInstall("Tools\×ÛºÏ¼ì²â.exe","C:\Program Files\×ÛºÏ¼ì²â.exe",1)
FileInstall("Tools\CPU¼ì²â.exe","C:\Program Files\CPU¼ì²â.exe",1)
FileInstall("Tools\ÄÚ´æ¼ì²â.exe","C:\Program Files\ÄÚ´æ¼ì²â.exe",1)
FileInstall("Tools\ÎÂ¶È¼ì²â.exe","C:\Program Files\ÎÂ¶È¼ì²â.exe",1)
FileInstall("Tools\Ó²ÅÌ¼ì²â.exe","C:\Program Files\Ó²ÅÌ¼ì²â.exe",1)
FileInstall("Tools\Íø¿¨¼ì²â.exe","C:\Program Files\Íø¿¨¼ì²â.exe",1)
FileInstall("Tools\ÍøÂç¼ì²â.exe","C:\Program Files\ÍøÂç¼ì²â.exe",1)
FileInstall("Tools\Êó±ê¼ì²â.exe","C:\Program Files\Êó±ê¼ì²â.exe",1)
FileInstall("Tools\¼üÅÌ¼ì²â.exe","C:\Program Files\¼üÅÌ¼ì²â.exe",1)
FileInstall("Tools\Éù¿¨¼ì²â.exe","C:\Program Files\Éù¿¨¼ì²â.exe",1)
FileInstall("Tools\USB¼ì²â.exe","C:\Program Files\USB¼ì²â.exe",1)
FileInstall("Tools\ÆÁÄ»¼ì²â.exe","C:\Program Files\ÆÁÄ»¼ì²â.exe",1)
FileInstall("Tools\ÏÔ¿¨¼ì²â.exe","C:\Program Files\ÏÔ¿¨¼ì²â.exe",1)
FileInstall("Skin\SkinCrafterDll.dll","C:\Program Files\SkinCrafterDll.dll",1)
FileInstall("Skin\vista_style.skf","C:\Program Files\vista_style.skf",1)
FileInstall("Tools\cpuz.ini","C:\Program Files\cpuz.ini",1)
FileInstall("Tools\cpuz_readme_cn.txt","C:\Program Files\cpuz_readme_cn.txt",1)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("×°»ú¹¤¾ßV2.0 by Eason", 560, 519, 192, 124, -1, 0)
_SkinGUI("C:\Program Files\SkinCrafterDll.dll", "C:\Program Files\vista_style.skf", $Form1)
$Button1 = GUICtrlCreateButton("×ÛºÏ¼ì²â", 205, 48, 145, 41)
$Button2 = GUICtrlCreateButton("CPU¼ì²â", 37, 105, 145, 41)
$Button3 = GUICtrlCreateButton("ÏÔ¿¨¼ì²â", 373, 105, 145, 41)
$Button4 = GUICtrlCreateButton("ÄÚ´æ¼ì²â", 205, 105, 145, 41)
$Button5 = GUICtrlCreateButton("ÎÂ¶È¼ì²â", 37, 161, 145, 41)
$Button6 = GUICtrlCreateButton("Ó²ÅÌ¼ì²â", 373, 161, 145, 41)
$Button7 = GUICtrlCreateButton("Íø¿¨¼ì²â", 206, 161, 145, 41)
$Button8 = GUICtrlCreateButton("ÍøÂç¼ì²â", 37, 216, 145, 41)
$Button9 = GUICtrlCreateButton("Êó±ê¼ì²â", 373, 216, 145, 41)
$Button10 = GUICtrlCreateButton("¼üÅÌ¼ì²â", 205, 216, 145, 41)
$Button11 = GUICtrlCreateButton("Éù¿¨¼ì²â", 37, 272, 145, 41)
$Button12 = GUICtrlCreateButton("USB¼ì²â", 373, 272, 145, 41)
$Button13 = GUICtrlCreateButton("ÆÁÄ»¼ì²â", 206, 272, 145, 41)
$Button14 = GUICtrlCreateButton("Éè±¸¹ÜÀíÆ÷", 37, 329, 145, 41)
$Button15 = GUICtrlCreateButton("×é²ßÂÔ±à¼­Æ÷", 373, 329, 145, 41)
$Button16 = GUICtrlCreateButton("ÏµÍ³ÅäÖÃÊ¹ÓÃ³ÌÐò", 206, 329, 145, 41)
$Button17 = GUICtrlCreateButton("×¢²á±í±à¼­Æ÷", 37, 384, 145, 41)
$Button18 = GUICtrlCreateButton("Ìí¼Ó»òÉ¾³ý³ÌÐò", 373, 384, 145, 41)
$Button19 = GUICtrlCreateButton("¿ØÖÆÃæ°å", 205, 384, 145, 41)
$Button20 = GUICtrlCreateButton("·þÎñ", 37, 440, 145, 41)
$Button21 = GUICtrlCreateButton("´ÅÅÌ¹ÜÀí", 373, 440, 145, 41)
$Button22 = GUICtrlCreateButton("À¬»øÕûÀí", 206, 440, 145, 41)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Run("C:\Program Files\×ÛºÏ¼ì²â.exe")
			Case $Button2
			Run("C:\Program Files\CPU¼ì²â.exe")
			Case $Button3
			Run("C:\Program Files\ÏÔ¿¨¼ì²â.exe")
			Case $Button4
			Run("C:\Program Files\ÄÚ´æ¼ì²â.exe")
			Case $Button5
			Run("C:\Program Files\ÎÂ¶È¼ì²â.exe")
			Case $Button6
			Run("C:\Program Files\Ó²ÅÌ¼ì²â.exe")
			Case $Button7
			Run("C:\Program Files\Íø¿¨¼ì²â.exe")
			Case $Button8
			Run("C:\Program Files\ÍøÂç¼ì²â.exe")
			Case $Button9
			Run("C:\Program Files\Êó±ê¼ì²â.exe")
			Case $Button10
			Run("C:\Program Files\¼üÅÌ¼ì²â.exe")
			Case $Button11
			Run("C:\Program Files\Éù¿¨¼ì²â.exe")
			Case $Button12
			Run("C:\Program Files\USB¼ì²â.exe")
			Case $Button13
			Run("C:\Program Files\ÆÁÄ»¼ì²â.exe")
			Case $Button14
			ShellExecute(@SystemDir & "\devmgmt.msc")
			Case $Button15
			ShellExecute(@SystemDir & "\gpedit.msc")
			Case $Button16
			Run("msconfig")
			Case $Button17
			Run("regedit")
			Case $Button18
			ShellExecute(@SystemDir & "\appwiz.cpl")
			Case $Button19
			Run("control")
			Case $Button20
			ShellExecute(@SystemDir & "\services.msc")
			Case $Button21
			ShellExecute(@SystemDir & "\diskmgmt.msc")
			Case $Button22
			Run("cleanmgr")

	EndSwitch
WEnd
;Æ¤·ôµ÷ÓÃ
Func _SkinGUI($SkincrafterDll, $SkincrafterSkin, $Handle) 
   $Dll = DllOpen($SkincrafterDll) 
   DllCall($Dll, "int:cdecl", "InitLicenKeys", "wstr", "1", "wstr", "", "wstr", "1@1.com", "wstr", "1") 
   DllCall($Dll, "int:cdecl", "InitDecoration", "int", 1) 
   DllCall($Dll, "int:cdecl", "LoadSkinFromFile", "wstr", $SkincrafterSkin) 
   DllCall($Dll, "int:cdecl", "DecorateAs", "int", $Handle, "int", 25) 
   DllCall($Dll, "int:cdecl", "ApplySkin")
EndFunc
