
if exist "test\%1" goto import
goto fail
:import
cd test\%1
%WINOBJC_HOME%\bin\vsimporter.exe -interactive
goto end
:fail
@echo valid values:
@dir test /AD /B
:end