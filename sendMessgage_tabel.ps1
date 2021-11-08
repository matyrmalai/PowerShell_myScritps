$day = Get-Date -Format %d

switch ( $day )
{
    26 { Send-MailMessage -From it@szvep.ru -To ifatkullin@szvep.ru -BodyAsHtml -Body 'Добрый день! Необходимо заполнить табель.' -Subject 'Заполнить Табель' -SmtpServer 172.16.0.8 -Encoding UTF8    }
    28 { Send-MailMessage -From it@szvep.ru -To mkorotkova@szvep.ru -BodyAsHtml -Body 'Добрый день! Необходимо заполнить табель.' -Subject 'Заполнить Табель' -SmtpServer 172.16.0.8 -Encoding UTF8    }
    29 { Send-MailMessage -From it@szvep.ru -To ekozlova@szvep.ru -BodyAsHtml -Body 'Добрый день! Необходимо заполнить табель.' -Subject 'Заполнить Табель' -SmtpServer 172.16.0.8 -Encoding UTF8    }
}

