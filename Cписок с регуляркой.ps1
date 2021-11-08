$a = Get-Content D:\Profiles\ifatkullin\Desktop\tdms\tdmsstat50.txt

$a =$a -replace '\s{4}', '' #Удаляем пробелы в начале

$a = $a -replace '\s[A-z]{1,20}\s\(v3.0\)\s\([A-z]{1,10}\/[0-9]{5}\s[0-9]{1,4}\),\s[a-z]{1,5}', '' #iusilin iusilin Wed 7/28 10:13 Получаем такой формат

$login = $a -replace '\s[A-z]{1,20}\s[A-z]{1,3}\s.*', '' #Вырезаем первые столбец, т.е. логины

$pocketknife = New-Object Object
Add-Member -Me NoteProperty —In $pocketknife -Na Mon -Value 'ПН'
Add-Member -Me NoteProperty —In $pocketknife -Na Tue -Value 'ВТ'
Add-Member -Me NoteProperty —In $pocketknife -Na Wed -Value 'СР'
Add-Member -Me NoteProperty —In $pocketknife -Na Thu -Value 'ЧТ'
Add-Member -Me NoteProperty —In $pocketknife -Na Fri -Value 'ПТ'
Add-Member -Me NoteProperty —In $pocketknife -Na Sat -Value 'СБ'
Add-Member -Me NoteProperty —In $pocketknife -Na Sun -Value 'ВС'

for ($i=0; $i -le 49; $i++){
$searchName = $login[$i]
$AD = Get-ADUser -Filter {SamAccountName -eq $searchName} -SearchBase 'OU=Пользователи,OU=Севзапвнипиэнергопром,DC=org,DC=szvep,DC=ru'
$paste = [string]($i+1)+ '. '+ $AD.Name+ ' | PC Name: '
#Добавляем ФИО вместо логина
$a[$i] = $a[$i] -replace '^[A-z]{1,20}\s', $paste
##Рус-ия дня недели
$dayWeek = $a[$i] -split ' '
$c = $dayWeek[8]
$recodeWeek = ' | '+ $pocketknife.$c+' '
$a[$i] = $a[$i] -replace '\s[A-z]{3}\s', $recodeWeek
} 
$Date = Date
$Date = 'Актуально на ' + $Date
"$Date`n "| Out-File D:\Profiles\ifatkullin\Desktop\tdms\tdmsstat501.txt
$a >> D:\Profiles\ifatkullin\Desktop\tdms\tdmsstat501.txt