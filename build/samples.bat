"%ProgramFiles%\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" msbuild\samples.proj /fl1 /flp1:LogFile=samples.log;Verbosity=Normal /m -tv:Current
pause