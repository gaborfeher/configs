; Unity-style Ctrl+NUM hotkeys for window resize with AutoHotKey (Windows)

#SingleInstance force

GetMonitorOfActiveWindow() {
	WinGetActiveStats, winTitle, winW, winH, winX, winY

	SysGet, numDisplays, MonitorCount
	SysGet, idxPrimary, MonitorPrimary

	Loop %numDisplays% {
		SysGet, mon, MonitorWorkArea, %a_index%
		if (winX >= monLeft && winX < monRight && winY >= monTop && winY < monBottom) {
			return %a_index%
		}
	}
	; Return Primary Monitor if can't find
	return idxPrimary
}

GetWorkingAreaOfActiveWindow(byref monLeft, byref monTop, byref monWidth, byref monHeight) {
	WinGetClass, class, A
	if (class = "WorkerW" || RegExMatch(class, "^Shell_.*TrayWnd$") > 0) {
		MsgBox % "bad window" . %class%
		Exit
	}
	id := GetMonitorOfActiveWindow()
	SysGet, mon, MonitorWorkArea, %id%
	monWidth := (monRight - monLeft)
	monHeight := (monBottom - monTop)
}


^m::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
	; MsgBox % "Mon: " . monLeft . " " . monRight
Return

^NumpadHome::
^Numpad7::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft, monTop, monWidth / 2, monHeight / 2
Return

^NumpadUp::
^Numpad8::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft, monTop, monWidth, monHeight / 2
Return

^NumpadPgUp::
^Numpad9::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft + monWidth / 2, monTop, monWidth / 2, monHeight / 2
Return

^NumpadLeft::
^Numpad4::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft, monTop, monWidth / 2, monHeight
Return

^NumpadClear::
^Numpad5::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft, monTop, monWidth, monHeight
Return

^NumpadRight::
^Numpad6::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft + monWidth / 2, monTop, monWidth / 2, monHeight
Return

^NumpadEnd::
^Numpad1::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft, monTop + monHeight / 2, monWidth / 2, monHeight / 2
Return

^NumpadDown::
^Numpad2::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft, monTop + monHeight / 2, monWidth, monHeight / 2
Return

^NumpadPgDn::
^Numpad3::
	GetWorkingAreaOfActiveWindow(monLeft, monTop, monWidth, monHeight)
 	WinMove, A,, monLeft + monWidth / 2, monTop + monHeight / 2, monWidth / 2, monHeight / 2
Return
