@echo off

:: Navigate to the parent directory
cd ..

:: Navigate to the GLFW build script directory
cd Dist/BuildScripts/Windows

:: Call the GLFW build script
call build-glfw.bat

:: Navigate to the main build script directory
cd ../../../Dist/BuildScripts/Windows

:: Call the main build script
call build.bat

:: Pause to keep the window open
pause
