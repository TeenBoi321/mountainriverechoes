@echo off
REM ============================================================
REM  mountainriverechoes (山河回响) WebUI - Windows launcher
REM  Starts the local server at http://127.0.0.1:8766
REM  Double-click this file. Keep the window open while using it.
REM ============================================================
cd /d "%~dp0"

set "PY=venv\Scripts\python.exe"

if not exist "%PY%" (
    echo [ERROR] Virtual environment not found: %CD%\venv
    echo         Please run install first:
    echo         python -m venv venv ^&^& venv\Scripts\python.exe -m pip install -r requirements.txt flask
    echo.
    pause
    exit /b 1
)

echo Starting mountainriverechoes WebUI ...
echo URL: http://127.0.0.1:8766
echo Press CTRL+C in this window (or run stop-webui.bat) to quit.
echo.

REM open the browser a few seconds later, after the server is up
start "" cmd /c "timeout /t 4 >nul & start "" http://127.0.0.1:8766"

"%PY%" webui\mountainriverechoes.py

echo.
echo Server stopped.
pause
