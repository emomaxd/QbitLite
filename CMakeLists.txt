cmake_minimum_required(VERSION 3.10)
project(Qbit-App)

set(CMAKE_CXX_STANDARD 17)

# Include the Engine directory
add_subdirectory(Engine)
add_subdirectory(Sandbox)

# Set Engine as the startup project
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT Sandbox)

# Remove ALL_BUILD and ZERO_CHECK targets
set(CMAKE_SUPPRESS_REGENERATION true)
