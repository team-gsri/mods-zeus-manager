$path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\bohemia interactive\AddonBuilder').path
$exe = "$path\AddonBuilder.exe"

Get-ChildItem .\addons -Directory | ForEach-Object {
  $addonFullPath = $_.FullName
  $addonOutputPath = "$(Get-Location)\addons"
  $includeFilename = "$(Get-Location)\.local\include.txt"
  $pboPrefixFilename = "$addonFullPath\`$PBOPREFIX$"
  $prefix = if(Test-Path $pboPrefixFilename) { "-prefix='$(Get-Content $pboPrefixFilename)'" }
  & "$exe" "$addonFullPath" "$addonOutputPath" "$prefix" "-include=$includeFilename"
}