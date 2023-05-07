#SingleInstance Force
#NoTrayIcon true
#Include createProjectUI.ahk

; Check Windows Version & Admin Privileges
if (A_OSVersion ~= "10" || A_OSVersion ~= "11") {
    if A_IsAdmin = 0 {
        try {
            Run '*RunAs ' A_ScriptFullPath
        }
        catch Error as err {
            MsgBox(err.Message . "`n`nNo admin privileges. Please try again...", "A_IsAdmin = " . A_IsAdmin) ; optional -> no error message if removed
            ExitApp
        }
    } 
    
    if A_IsAdmin = 1 {
        ; create GUI Object
        ProjectGui := Gui()

        ; Init
        Main()._Init()
    }
} else {
    MsgBox Format("({1}): Your OSVersion is not compatible", A_ScriptName), ("Error")
    ExitApp
}