$ADComputer = @(Get-ADComputer -Filter * -SearchBase "OU=Компьютеры, OU=Севзапвнипиэнергопром, DC=org, DC=szvep,DC=ru" | Sort | Select -Expand Name)


ForEach($PCname in $ADComputer) {
$path = "\\$PCname\c$\Program Files\Autodesk\AutoCAD 2016\"
if ((Test-Connection -ComputerName $PCname -count 1 -quiet) -and (Test-Path -Path $path)){
    Write-Host $PCname "online and have folder"
    $MySession = New-PSSession -computer $PCname
    Invoke-Command -Session $MySession -ScriptBlock {Stop-Process -Name "acad" -Force}
    Remove-item  $path -Recurse -Force

}else{
    Write-Host $PCname "offline"
}
}