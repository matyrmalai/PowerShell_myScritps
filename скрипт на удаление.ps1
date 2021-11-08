    $PCname = @(Get-Content D:\1.txt)
    $a = ''
    ForEach($PCname1 in $PCname) {
    RMDIR  \\$PCname1\c$\ProgramData\Autodesk\CLM\LGS\*
    RMDIR  \\$PCname1\c$\ProgramData\Autodesk\ADUT\*
    $PCname1
     $a = $a +'; '+ $PCname1
    }$a > D:\321.txt