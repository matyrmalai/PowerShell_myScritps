$ADComputer = @(Get-ADComputer -Filter * -SearchBase "OU=Компьютеры, OU=Севзапвнипиэнергопром, DC=org, DC=szvep,DC=ru" | Sort | Select -Expand Name)

ForEach ($item in $ADComputer){

  if (Get-Service -ComputerName $item "Zabbix Agent" -ErrorAction SilentlyContinue){
    Write-Warning "$item имеет service Zabbix"
    Invoke-Command -ComputerName $item -ScriptBlock {Stop-Service -Name 'Zabbix Agent'}
    (Get-WmiObject -ComputerName $item Win32_Service -filter "name='Zabbix Agent'").Delete()

    
}elseif (Get-Service -ComputerName $item "Zabbix Agent 2" -ErrorAction SilentlyContinue){
    Write-Warning "$item имеет service Zabbix Agent 2"
    Invoke-Command -ComputerName $item -ScriptBlock {Stop-Service -Name 'Zabbix Agent 2'}
    (Get-WmiObject -ComputerName $item Win32_Service -filter "name='Zabbix Agent 2'").Delete()

    
}else{
Write-Warning "$item не найдены сервисы"
}
}
