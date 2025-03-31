Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

' Get the script's directory
scriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)
filePath = scriptDir & "\NUM.txt"

If WScript.Arguments.Count > 0 Then
    Set objFile = objFSO.CreateTextFile(filePath, True) ' True means overwrite if file exists
    objFile.WriteLine(WScript.Arguments(0)) ' Write the argument (number) into the file
    objFile.Close ' Close the file
End If

' Read NUM.txt
Set objFile = objFSO.OpenTextFile(scriptDir & "\NUM.txt", 1)
num = Trim(objFile.ReadLine)
objFile.Close

' Run NtQuerySystemInformation.exe with the number from NUM.txt
objShell.Run "NtQuerySystemInformation.exe " & num, 0, False