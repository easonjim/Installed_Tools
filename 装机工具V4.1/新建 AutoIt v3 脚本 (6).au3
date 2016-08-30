GUICreate("My GUI combo") 
	$cb = GUICtrlCreateCombo("item1", 10, 10) 
	GUICtrlSetData(-1, "item2|item3|ghghg|a", "item3")
	GUISetState()
	While 1
		$msg = GUIGetMsg()		
		If $msg = -3 Then ExitLoop
		If $msg = $cb Then ConsoleWrite(GUICtrlRead($cb) & @CRLF)
	WEnd