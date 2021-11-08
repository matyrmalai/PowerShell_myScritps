$PCname = @(Get-Content D:\1.txt)
$b = ''
  ForEach($PCname1 in $PCname) {
Copy-Item -Path "c:\asave" -Destination "\\$PCname1\C$\Program Files (x86)\AVEVA\Everything3D2.10\PMLUI\des\addins"
$PCname1
}