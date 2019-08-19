REM @echo off

set process_name=lock1234
set program_path=lock.exe

:check_process
tasklist -v | findstr /i %process_name% > NUL
if ErrorLevel 1 (
        goto start_program
) else (
        timeout /t 5 /nobreak > NUL
        echo %~dp0%program_path%
        goto check_process
)

:start_program
%~dp0%program_path%
goto check_process