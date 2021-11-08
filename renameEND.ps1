$ExcelObj = New-Object -comobject  Excel.Application #создает процесс Excel, нужно закрывать вручную
$ExcelWorkBook = $ExcelObj.Workbooks.Open("D:\aaa.xlsx")
$ws = $ExcelWorkBook.Sheets.Item(1) #выводит все доступные свойства объекта Excel
$rows = $ws.UsedRange.Rows.Count #выводим количество непустых строк Excel
$reboot = 10#1800 # задаем через какое время будет перезагружен ПК

for ($i=1; $i -le $rows; $i++){ # нужно указать сколько строк в excel
$a= $ExcelObj.cells.Item($i, 1).text #1ый столбец имя ПК
$b= $ExcelObj.cells.Item($i, 2).text #2ый столеб логин пользователя
if($a -eq $b) {
   Write-Host "совпадает" $a 'c' $b
}
elseif((Test-Connection -computer $a -Count 1 -Quiet) -eq $True){
#echo "$a - host is UP"
#Invoke-Command -ComputerName $a -ScriptBlock {msg * "Через 30 мин запланирована перезагрузка ПК"}
Invoke-Command -ScriptBlock {echo Y | netdom renamecomputer $a /newname:$b /userd:org\ilnfat /passwordd:JavaGo2!* /REBoot:$reboot}
   Write-Host 'Сейчас будет переименован ПК' $a 'на' $b
}
}
