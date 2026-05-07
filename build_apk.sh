#!/bin/bash

echo "======================================="
echo "   Brainova APK Build Tool"
echo "======================================="
echo ""

# Check if flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "Error: Flutter is not installed or not in your PATH."
    exit 1
fi

echo "Cleaning old builds..."
flutter clean

echo "Getting dependencies..."
flutter pub get

echo "Building Release APK..."
echo "This may take a few minutes..."
flutter build apk --release

if [ $? -eq 0 ]; then
    echo ""
    echo "======================================="
    echo "   BUILD SUCCESSFUL!"
    echo "======================================="
    echo ""
    echo "The APK file can be found at:"
    echo "build/app/outputs/flutter-apk/app-release.apk"
    echo ""
    
    # Open the folder based on OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open build/app/outputs/flutter-apk/
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open build/app/outputs/flutter-apk/
    fi
else
    echo ""
    echo "======================================="
    echo "   BUILD FAILED!"
    echo "======================================="
    echo ""
    echo "Please check the error messages above."
fi
