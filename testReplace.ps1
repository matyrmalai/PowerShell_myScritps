$ADComputer = @(Get-ADComputer -Filter * -SearchBase "OU=Компьютеры, OU=Севзапвнипиэнергопром, DC=org, DC=szvep,DC=ru" | Sort | Select -Expand Name)
$ADComputer

(gc D:\text.txt) -replace '111', $ADComputer| Out-File -encoding ASCII \\$ADComputer\D$\text.txt