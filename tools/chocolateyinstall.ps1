$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sourceforge.net/projects/yetanotherbacnetexplorer/files/SetupYabe_v1.2.0.exe/download'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'yabe*'
  checksum      = '06D98C456E006F3199D002346F3487F0B11FEACF74302D830168D2E6D9C16B88'
  checksumType  = 'sha256'
  silentArgs    = "/silent /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
