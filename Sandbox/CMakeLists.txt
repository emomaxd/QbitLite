project(Sandbox)

set(GLEW_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Engine/vendor/glew")
set(GLFW_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Engine/vendor/glfw")
set(IMGUI_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Engine/vendor/imgui")
set(GLM_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Engine/vendor/glm")


file(GLOB_RECURSE SANDBOX_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
file(GLOB_RECURSE SANDBOX_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp")
file(GLOB_RECURSE SANDBOX_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.h")

add_executable(Sandbox ${SANDBOX_SOURCES} ${SANDBOX_HEADERS})

# Include directories
target_include_directories(Sandbox PRIVATE 
    ${CMAKE_CURRENT_SOURCE_DIR}/../Engine
    ${CMAKE_CURRENT_SOURCE_DIR}/../Engine/src
    ${CMAKE_CURRENT_SOURCE_DIR}/../Engine/vendor
    ${CMAKE_CURRENT_SOURCE_DIR}/../Engine/vendor/spdlog/include
    ${GLFW_DIR}/install/include 
    ${GLEW_DIR}/include
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${GLM_DIR}
    ${GLM_DIR}/glm

)

if(WIN32)
    target_precompile_headers(Sandbox PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../Engine/src/qbpch.h")
    target_compile_definitions(Sandbox PRIVATE QB_PLATFORM_WINDOWS GLFW_INCLUDE_NONE)

    

    target_link_directories(Sandbox PRIVATE 
        ${GLFW_DIR}/install/lib
        ${GLEW_DIR}/Windows/lib/Release/x64
    )
    target_link_libraries(Sandbox PRIVATE 
        glew32s 
        glfw3 
        opengl32 
        gdi32 
        winmm
        Engine
    )
elseif(UNIX)
    target_link_directories(Sandbox PRIVATE 
        ${GLFW_DIR}/install/lib 
        ${GLEW_DIR}/lib
    )
    target_link_libraries(Sandbox PRIVATE 
        glfw3 
        GLEW 
        m 
        dl 
        pthread 
        GL
        Engine
    )
else()
    message(FATAL_ERROR "Unsupported operating system")
endif()

# Enable "Show All Files" option for Visual Studio projects
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(TARGET Sandbox PROPERTY VS_SOLUTION_SHOW_ALL_FILES ON)
