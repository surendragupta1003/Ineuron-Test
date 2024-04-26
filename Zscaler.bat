@echo off
REM
REM This batch file is used to uninstall Password protected Netskope Client from SCCM
REM
SetLocal
for /f "tokens=2 delims==" %%f in ('wmic product where "Name like 'Netskope Client'" get IdentifyingNumber /value ^| find "="') do set "productCode=%%f"
IF DEFINED productCode (
     msiexec /uninstall %productCode% PASSWORD="4uzN^URhtVGp" /qn /l*v %PUBLIC%nscuninstall.log
     ) ELSE (
REM Did not find product code for Netskope Client
)
EndLocal
powershell Invoke-WebRequest http://10.23.50.29/deploy/Zscaler-windows-4.0.0.89-installer-x64.msi -OutFile D:\Zscaler-windows-4.0.0.89-installer-x64.msi
msiexec /i D:\Zscaler-windows-4.0.0.89-installer-x64.msi /quiet cloudName=zscalertwo USERDOMAIN=adityabirla.com hideappuionlaunch=1 policyToken=323233383A333A62653035343164382D343936302D343239302D393735642D636633623163643961623864