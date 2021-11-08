$a = Get-Content D:\Profiles\ifatkullin\Desktop\tdms\tdmsstat50.txt

$a =$a -replace '\s{4}', '' #Удаляем пробелы в начале

$a = $a -replace '\s[A-z]{1,20}\s\(v3.0\)\s\([A-z]{1,10}\/[0-9]{5}\s[0-9]{1,4}\),\s[a-z]{1,5}', '' #iusilin iusilin Wed 7/28 10:13 Получаем такой формат

$login = $a -replace '\s[A-z]{1,20}\s[A-z]{1,3}\s.*', '' #Вырезаем первые столбец, т.е. логины

#получаем имя ПК
$PCName = $a -replace '^[A-z]{1,20}\s',''
$PCName = $PCName -replace '\s.{1,100}'

#объект для руссификации дней недели
$pocketknife = New-Object Object
Add-Member -Me NoteProperty —In $pocketknife -Na Mon -Value 'пн'
Add-Member -Me NoteProperty —In $pocketknife -Na Tue -Value 'вт'
Add-Member -Me NoteProperty —In $pocketknife -Na Wed -Value 'ср'
Add-Member -Me NoteProperty —In $pocketknife -Na Thu -Value 'чт'
Add-Member -Me NoteProperty —In $pocketknife -Na Fri -Value 'пт'
Add-Member -Me NoteProperty —In $pocketknife -Na Sat -Value 'сб'
Add-Member -Me NoteProperty —In $pocketknife -Na Sun -Value 'вс'

$Date = Date
$Date = 'Актуально на ' + $Date
"$Date `n" + '<br><br>'| Out-File D:\Profiles\ifatkullin\Desktop\tdms\TDMS.html 
'<table><thead><tr><td>ФИО</td><td>Отдел</td><td>Имя ПК</td><td>Дата</td></tr></thead>'>> D:\Profiles\ifatkullin\Desktop\tdms\TDMS.html

for ($i=0; $i -le 49; $i++){

$searchName = $login[$i]

$AD = Get-ADUser -Filter {SamAccountName -eq $searchName} -Properties Department -SearchBase 'OU=Пользователи,OU=Севзапвнипиэнергопром,DC=org,DC=szvep,DC=ru'

$cellDepartament = '<td>'+$AD.Department +'</td>'

$cellName = '<tr><td>'+ [string]($i+1)+ '. ' +  $AD.Name + '</td>'

$cellPCName = '<td>' +  $PCName[$i] + '</td>'

#Рус-ия дней недели
$aSplit = $a[$i] -split ' '
$dayWeek = $aSplit[2]
$cellFullTime = '<td>' +$pocketknife.$dayWeek + ' ' + $aSplit[3] + ' ' + $aSplit[4]+ '</td></tr>'


$allCell =$cellName + $cellDepartament + $cellPCName + $cellFullTime   >> D:\Profiles\ifatkullin\Desktop\tdms\TDMS.html
}

'</table>' >> D:\Profiles\ifatkullin\Desktop\tdms\TDMS.html
Copy-Item -Path "D:\Profiles\ifatkullin\Desktop\tdms\TDMS.html" -Destination "\\avatar\d$\Portal"

