$SEDFiler = Get-ChildItem C:\users\tomrune\GitHub\trb-m365apps-installers\IExpressPackages\*.SED

foreach($sed in $SEDFiler) {
    iexpress.exe /N $sed

}