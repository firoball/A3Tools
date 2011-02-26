@REM do not modify this part
@del error.log
@rd html /s /q

@echo Log file generated %date% %time% >>error.log

@REM adjust pathes to local installation
c:\programme\doxygen\bin\doxygen.exe Doxyfile 2>>error.log
"c:\programme\HTML Help Workshop\hhc.exe" html\index.hhp 2>>error.log

@REM do not modify this part
@move html\index.chm index.chm