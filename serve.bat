@echo off
echo Starting local web server for Aerotest Manuals...
echo.
echo The website will be available at: http://localhost:8000
echo Press Ctrl+C to stop the server
echo.

REM Check if Python is available
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Using Python HTTP server...
    python -m http.server 8000
) else (
    REM Check if Node.js is available
    node --version >nul 2>&1
    if %errorlevel% equ 0 (
        echo Python not found. Checking for Node.js...
        REM Check if http-server is installed globally
        npx http-server --version >nul 2>&1
        if %errorlevel% equ 0 (
            echo Using Node.js http-server...
            npx http-server -p 8000 -c-1
        ) else (
            echo Installing http-server...
            npm install -g http-server
            echo Using Node.js http-server...
            npx http-server -p 8000 -c-1
        )
    ) else (
        echo Neither Python nor Node.js found.
        echo Please install Python or Node.js to run a local server.
        echo.
        echo Python: https://www.python.org/downloads/
        echo Node.js: https://nodejs.org/
        pause
    )
)

pause
