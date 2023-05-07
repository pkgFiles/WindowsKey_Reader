class ProjectUIEvents {

    getValues(*) {
        global data

        try {
            data := ProjectUIEvents().ReadCommandOutput(A_ComSpec " /c cscript c:\windows\system32\slmgr.vbs -dli ")
            hwnd := ControlGetHwnd(keyLabel)
            ControlSetText(data, hwnd)
            keyLabel.SetFont("c000000")
            saveInFileBtn.Enabled := true
        } catch Error as err {
            MsgBox(err.Message . "`n`nThe Programm will now Exit.", "Error -> getValues(*)")
            ExitApp
        }
    }

    saveAsTxtFile(*) {
        try {
            FileAppend(data, A_Desktop . "\KeyData.txt")

            if FileExist(A_Desktop . "\KeyData.txt") {
                ControlSetText("Successfully saved", keyLabel)
                keyLabel.SetFont("c00b012")
            } else {
                ControlSetText("Error: File can't be saved", keyLabel)
                keyLabel.SetFont("ca80000")
            }
        } catch Error as err {
            MsgBox(err.Message, "Error -> saveAsTxtFile(*)")
        }
    }

    ; Read Command or Shell output
    ; New Syntax for AHK V2 by - ★ Install Package Files (@pkgFiles)
    ; Original by - @jeeswg
    ReadCommandOutput(Target, Size:="") {
        DetectHiddenWindows 1
        ComSpec := A_ComSpec ? A_ComSpec : ComSpec
        Run(ComSpec,, "Hide", &PID)
        WinWait("ahk_pid" PID)
        DllCall("kernel32\AttachConsole", "UInt", PID)
        oShell := ComObject("WScript.Shell")
        oExec := oShell.Exec(Target)
        StdOut := ""
        
        if !(Size = "") {
            ObjSetCapacity(StdOut, Size)
        }
    
        while !oExec.StdOut.AtEndOfStream {
            StdOut := oExec.StdOut.ReadAll()
        }
        
        DllCall("kernel32\FreeConsole")
        ProcessClose(PID)
        return StdOut
    }
}