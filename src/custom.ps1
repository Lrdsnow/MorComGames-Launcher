$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
$value = 'AppsUseLightTheme'
$path_verif = Get-itemProperty -Path $path | Select-Object -ExpandProperty $value
if($path_verif -match '1') {
    "true"
} else {
    "false"
}