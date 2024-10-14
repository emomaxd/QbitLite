#!/bin/bash

# =========================
# Section 1: Update Git Submodules
# =========================

# Set colors for output
INFO_COLOR='\033[0;32m'  # Light green
ERROR_COLOR='\033[0;31m'  # Red
BUILD_COLOR='\033[0;34m'  # Blue
END_COLOR='\033[0m'  # No color

echo -e "${INFO_COLOR}=============================================================="
echo
echo "  [INFO] Updating Git Submodules..."
echo
echo "=============================================================="
# Navigate to the root directory (if necessary)
cd ..

# Update submodules recursively
git submodule update --init --recursive
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to update Git submodules!"
    echo "  Please check your Git configuration or repository."
    echo
    echo "=============================================================="
    exit 1
fi

# Navigate back to the project directory
cd Engine/vendor

# =========================
# Section 2: Build GLFW
# =========================

clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building GLFW..."
echo
echo "=============================================================="
sleep 2

# Navigate to the GLFW source directory
cd glfw

# Run CMake to configure the build
cmake -S . -B build
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] CMake configuration failed for GLFW!"
    echo "  Check the CMake output for issues."
    echo
    echo "=============================================================="
    exit 1
fi

# Build GLFW Debug configuration
clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building GLFW Debug Configuration..."
echo
echo "=============================================================="
sleep 2
cmake --build build/ --config Debug
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to build GLFW Debug configuration!"
    echo
    echo "=============================================================="
    exit 1
fi

# Build GLFW Release configuration
clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building GLFW Release Configuration..."
echo
echo "=============================================================="
sleep 2
cmake --build build/ --config Release
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to build GLFW Release configuration!"
    echo
    echo "=============================================================="
    exit 1
fi

# Navigate back to the vendor directory
cd ..

# =========================
# Section 3: Build Assimp
# =========================

clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building Assimp..."
echo
echo "=============================================================="
sleep 2

# Navigate to the Assimp vendor directory
cd assimp

# Run CMake to configure Assimp for both Debug and Release builds
cmake -S . -B build -DASSIMP_BUILD_ZLIB=ON -DBUILD_SHARED_LIBS=OFF
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] CMake configuration failed for Assimp!"
    echo
    echo "=============================================================="
    exit 1
fi

# Build Assimp Debug configuration
clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building Assimp Debug Configuration..."
echo
echo "=============================================================="
sleep 2
cmake --build build --config Debug
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to build Assimp Debug configuration!"
    echo
    echo "=============================================================="
    exit 1
fi

# Build Assimp Release configuration
clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building Assimp Release Configuration..."
echo
echo "=============================================================="
sleep 2
cmake --build build --config Release
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to build Assimp Release configuration!"
    echo
    echo "=============================================================="
    exit 1
fi

# Navigate back to the vendor directory
cd ..

# =========================
# Section 4: Build GLEW
# =========================

clear
echo -e "${BUILD_COLOR}=============================================================="
echo
echo "  [BUILD] Building GLEW..."
echo
echo "=============================================================="
sleep 2

# Navigate to the GLEW vendor directory
cd GLEW
cd auto
# Run Makefile for GLEW
make
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to build GLEW!"
    echo
    echo "=============================================================="
    exit 1
fi

cd ..

make
if [ $? -ne 0 ]; then
    echo -e "${ERROR_COLOR}=============================================================="
    echo
    echo "  [ERROR] Failed to build GLEW!"
    echo
    echo "=============================================================="
    exit 1
fi



# Set success message color
SUCCESS_COLOR='\033[0;33m'  # Light yellow
clear
echo -e "${SUCCESS_COLOR}=============================================================="
echo
echo "  [INFO] Build process complete with no errors!"
echo
echo "=============================================================="
