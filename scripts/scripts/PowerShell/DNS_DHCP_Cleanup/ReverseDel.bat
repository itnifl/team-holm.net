::echo "Confirm Yes or No (Y/N)."
::%1 er dns server
::%2 er suffix/dns-zone
::%3 er to f&oslash;rste IP'er, reverse
::%4 er DNS navnet det gjelder
::%5 er hele IP til den hosten som skal f&aring; sin PTR slettet
:: Feks: dnscmd 10.54.54.54 /RecordDelete 233.10.in-addr.arpa 31.4 PTR cgawf030n.domene.net

dnscmd %1 /RecordDelete %2 %3 PTR %4 /f
IF %ERRORLEVEL%==0 GOTO EOF
echo "PTR for %5 ble ikke slettet med argumentene %4, %3, og %2, og dns-server: %1" >> Z:\Rydd_DNS\IP-err.log
exit 1

:EOF
echo "PTR for %5 ble slettet med argumentene %4, %3, og %2, og dns-server: %1" >> Z:\Rydd_DNS\IP-OK.log
exit 0