@echo off
REM ============================================================
REM  mountainriverechoes (山河回响) WebUI - Windows stopper
REM  Asks the running server to shut itself down gracefully.
REM ============================================================

echo Stopping mountainriverechoes WebUI ...
curl -s -X POST http://127.0.0.1:8766/api/shutdown >nul 2>&1

if errorlevel 1 (
    echo [WARN] No server responded on http://127.0.0.1:8766
    echo        It may already be stopped.
) else (
    echo Shutdown request sent.
)

timeout /t 2 >nul
exit /b 0
