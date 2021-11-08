$a = "ssilkin"
$b = "piashkin"
Invoke-Command -ComputerName $a -ScriptBlock {msg * "Через 10 мин запланирована перезагрузка ПК. Сохраните все файлы и закройте программы!"}
Invoke-Command -ScriptBlock {echo Y | netdom renamecomputer $a /newname:$b /userd:org\ilnfat /passwordd:JavaGo2!* /REBoot:600}
Write-Host 'Сейчас будет переименован ПК' $a 'на' $b