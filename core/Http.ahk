GetUpdateInfo(){
    GuiControl Main:Disabled, MainCheckUpdate
    req := ComObjCreate("Winhttp.winhttprequest.5.1")
    req.open("GET", "https://ghproxy.com/https://raw.githubusercontent.com/Marcus0605/DNFAutoFire/main/Version", true)
    req.Option(4) = 0x3300
    req.send()
    req.WaitForResponse()
    body := req.ResponseText
    HTTP_code := req.Status
    global __Version
    if (HTTP_code == 200){
        json := JSON2Object(body)
        version := json["tag_name"]
        info:= json["body"]
        downloadUrl := "https://ghproxy.com/https://github.com/Marcus0605/DNFAutoFire/releases/download/" . version . "/DNFAutoFire.exe"
        size := json["assets"][1]["size"]
        info := RegExReplace(info, "\s\r\nMD5.+")
        if("v" . __Version != version){
            MsgBox 0x2044, 检查更新, 当前版本 v%__Version%`nGithub版本 %version%`n`n版本说明`n%info%`n`n是否立即更新并重启？
            IfMsgBox Yes, {
                DownloadToFile(downloadUrl, size)
            }
        }else{
            MsgBox 0x2040, , 已经是最新版本
        }
    } else {
        MsgBox 0x10, , 版本检查出错，请稍后重试(HTTP_CODE:%HTTP_code%)
    }
    GuiControl Main:Enable, MainCheckUpdate
}

DownloadToFile(url, size){
    if (!fileDest) {
        SplitPath,url,fileDest
        fileDest:=A_ScriptDir "\" fileDest
    }
    if (!regExMatch(url,"i)https?://"))
        url:="https://" url
    try {
        hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
        hObject.Open("GET",url, true)
        if (userAgent){
            hObject.SetRequestHeader("User-Agent",userAgent)
        }
        hObject.Send()
        ShowGuiUpdateProgress()
        hObject.WaitForResponse()
        uBytes:=hObject.responseBody
        cLen:=uBytes.MaxIndex()
        fileHandle:=FileOpen(fileDest,"w")
        VarSetCapacity(f,cLen,0)
        loop % cLen+1{
            NumPut(uBytes[A_Index-1],f,A_Index-1,"UChar")
            UpdateProgressSetData(A_Index/size*100)
        }
        err:=fileHandle.RawWrite(f,cLen+1)
        FileEncoding cp54936
        file := FileOpen("Update.bat", "w")
        command := "@echo off`r`ntaskkill /f /im DAF连发工具.exe`r`ntimeout /t 3 /nobreak > NUL`r`ndel DAF连发工具.exe`r`ntimeout /t 3 /nobreak > NUL`r`nren DNFAutoFire.exe DAF连发工具.exe`r`ntimeout /t 1 /nobreak > NUL`r`nstart DAF连发工具.exe"
        file.Write(command)
        file.Close()
        Sleep, 1000
        Run, Update.bat
    } catch e
        return % e.message
}

try{
    FileDelete, Update.bat
}