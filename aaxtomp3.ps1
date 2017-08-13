Param(
   [string]$keyfile,
   [string]$filename,
   [string]$outname
)

$key=Get-Content $keyfile

Start-Process -Wait -FilePath ffmpeg\bin\ffprobe -RedirectStandardError output.txt -NoNewWindow $filename
$output=Get-Content output.txt
Remove-Item output.txt
$chapters=$output | Select-String "Chapter #"

New-Item $outname -type directory 2>&1 | Out-Null
foreach ($chapter in $chapters) {
   $name="$outname-Chapter" + ($chapter -replace "^.*\#","" -replace
   ":","" -replace " start.*$","") + ".mp3"
   Write-Output "Converting $name"
   $start=$chapter -replace "^.*start ","" -replace ", end.*$",""
   $end=$chapter -replace "^.* end ",""
   ffmpeg\bin\ffmpeg.exe -y -activation_bytes $key -i $filename -ss $start -to $end -ab 128k -vn $outname\$name 2>&1 | out-null
}