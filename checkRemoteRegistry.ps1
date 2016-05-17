#function that starts the remote registry on the computer 
Function startRemoteRegistry ($computer) {

    $RemoteReg = Get-WmiObject -ComputerName $computer -Class Win32_Service -Filter "Name='RemoteRegistry'"
    $StartRemoteReg = $RemoteReg.startservice()

}

#function that is checking the registry path with the subkey and hive that you specify that
#outputs results on the console whether the key is found or not. 
Function checkRegPath ($computer, $RegSubKey, $RegHive) {

    $Hive = [Microsoft.Win32.RegistryHive]“$RegHive”;
    $RegKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($Hive,$computer);
    $FullRegPath = $RegKey.OpenSubKey($RegSubKey);

    if (!$FullRegPath) {
        Write-Host "Specified registry key cannot be found" -ForegroundColor Red
        StopRegService -computer $computer
    }
    else {
        Write-Host "Key is on the system" -ForegroundColor Green
    }

}

#function that stops the registry service
Function StopRegService ($computer) {

    $RemoteRegService = Get-WmiObject -ComputerName $computer -Class Win32_Service -Filter "Name='RemoteRegistry'"
    $stopRegService = $RemoteRegService.stopservice()

}

#asking the user for input
$computerQ = Read-Host "Enter the computer name"
$subKeyQ = Read-Host "What is the key you are searching for"
$hiveQ = Read-Host "What hive are you searching in"

#storing the answers from the input questions
$computer = $computerQ
$subKey = $subKeyQ
$hive = $hiveQ

#calling the start function
StartRemoteRegistry -computer $computer

Start-Sleep -Seconds 2

#calling the check Reg Path function
CheckRegPath -computer $computer -RegSubKey $subKey -RegHive $hive

Start-Sleep -Seconds 2

#stoping the remote registry service
StopRegService -computer $computer


