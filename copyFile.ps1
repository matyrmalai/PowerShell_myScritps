#$ADComputer = @(Get-ADComputer -Filter * -SearchBase "OU=Компьютеры, OU=Севзапвнипиэнергопром, DC=org, DC=szvep,DC=ru" | Sort | Select -Expand Name)
$ADComputer = @("kkalmykov","piivanov")
ForEach ($item in $ADComputer){


IF((Test-Path -Path "\\$item\C$\Program Files\Zabbix Agent 2") -eq $true) {

Write-Host $item
Copy-Item -Path "D:\Zabbix_Agent\zabbix_agent2.conf" -Destination "\\$item\C$\Program Files\Zabbix Agent 2\"
Invoke-Command -ComputerName $item -ScriptBlock {Restart-Service -Name 'Zabbix Agent 2'}

}
}