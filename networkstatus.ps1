if ((Test-Connection -computer ya.ru -quiet) -eq $True)
{Write-Host ":)"}
Else {Write-Host ":("}