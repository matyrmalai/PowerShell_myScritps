   $PCname = @(Get-Content D:\2.txt)
    ForEach($PCname1 in $PCname) {
Send-MailMessage -From $PCname1@szvep.ru -To ifatkullin@szvep.ru -Body '123' -Subject 'ACAD' -SmtpServer 172.16.0.8 -Encoding UTF8}