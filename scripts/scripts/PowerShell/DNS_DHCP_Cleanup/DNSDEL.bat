::echo "Confirm Yes or No (Y/N)."
dnscmd %3 /NodeDelete %1 %2 /tree /f 2>> Z:\Rydd_DNS\DNS-err.log >> Z:\Rydd_DNS\DNS-OK.log

IF %ERRORLEVEL%==0 GOTO EOF
echo "DNS ble ikke slettet med argumentene %1 og %2, og dns-server: %3." >> Z:\Rydd_DNS\DNS-err.log
exit 1

:EOF
echo "DNS ble slettet med argumentene %1 og %2, og dns-server: %3" >> Z:\Rydd_DNS\DNS-OK.log
exit 0