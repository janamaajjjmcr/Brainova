@echo off
setlocal enabledelayedexpansion

echo =======================================
echo    Brainova APK Build Tool - v3.0
echo =======================================

:: Check for Flutter
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Flutter is not installed or not in PATH.
    pause
    exit /b 1
)

echo [1/4] Cleaning project...
:: Deeper cleaning
call flutter clean
if exist android\.gradle (
    echo [INFO] Removing android .gradle cache...
    rmdir /s /q android\.gradle
)

echo [2/4] Fetching dependencies...
call flutter pub get

echo [3/4] Building Release APK...
echo [INFO] This might take a few minutes. Please wait...
:: Explicitly build release with skip validation
call flutter build apk --release --android-skip-build-dependency-validation

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Build failed! Please check the errors above.
    pause
    exit /b 1
)

echo [4/4] Finalizing...
set OUTPUT_PATH=build\app\outputs\flutter-apk\app-release.apk

if exist "%OUTPUT_PATH%" (
    echo.
    echo =======================================
    echo    SUCCESS! APK Built Successfully
    echo =======================================
    echo Path: %OUTPUT_PATH%
    echo.
    echo [TIP] Upload this file to GitHub or your phone.
) else (
    echo [ERROR] Could not find the built APK at %OUTPUT_PATH%
)

pause
