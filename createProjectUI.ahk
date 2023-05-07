#Include ProjectUIEvents.ahk

GuiWidth := 450
GuiHeight := 250

class createProjectUI {

    buildGui() {
        ProjectGui.Title := "Windows Key [Reader] - Windows 10/11" ;Title
        ProjectGui.BackColor := "cffffff"
    }

    buildGuiObjects() {
        global keyLabel,saveInFileBtn

        ;Labels
        copyrightReserved := ProjectGui.AddText("w255", "© 2023 All Rights Reserved - ★ Install Package Files")
        copyrightReserved.SetFont(, "Arial")
        copyrightReserved.Move((GuiWidth - 255) / 2, (GuiHeight - 20))
        copyrightReserved.SetFont("c00cccc")

        keyLabel := ProjectGui.AddText(, "Status: N/A")
        keyLabel.Move(20, 10, 450, 150)

        ;Links
        githubLink := ProjectGui.AddLink(, '<a href="https://github.com/pkgFiles">@GitHub</a>')
        githubLink.Move(5, (GuiHeight - 40), 50)
        githubLink.SetFont(, "Arial")

        twitterLink := ProjectGui.AddLink(, '<a href="https://twitter.com/pkgFiles">@Twitter</a>')
        twitterLink.Move(5, (GuiHeight - 20), 50)
        twitterLink.SetFont(, "Arial")

        ;Buttons
        getValuesBtn := ProjectGui.AddButton("w100", "Get Key/Values")
        getValuesBtn.Move((GuiWidth - 100) / 2, ((GuiHeight - 20) / 2) + 50)
        getValuesBtn.OnEvent("Click", ProjectUIEvents().getValues)
        
        saveInFileBtn := ProjectGui.Add("Button", "w75 Disabled", "Save as File")
        saveInFileBtn.Move((GuiWidth - 75) / 2, ((GuiHeight - 20) / 2) + 80)
        saveInFileBtn.OnEvent("Click", ProjectUIEvents().saveAsTxtFile)
    }
}

; Main -> Reference to start Gui
class Main {

    _Init() {
        Main().createGui()
    }

    createGui() {
        createProjectUI().buildGui()
        createProjectUI().buildGuiObjects()
        ProjectGui.Show Format("w{1} h{2}", GuiWidth, GuiHeight)
    }
}