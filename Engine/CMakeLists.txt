# Define directories for third-party libraries
set(GLEW_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/GLEW")
set(GLEW_WIN_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/glewWin")
set(GLFW_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/glfw")
set(IMGUI_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/imgui")
set(GLM_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/glm")
set(ASSIMP_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/assimp")



# Glob source files
file(GLOB_RECURSE ENGINE_SRC
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.h"
)
file(GLOB IMGUI_SRC
    "${IMGUI_DIR}/*.cpp"
    "${IMGUI_DIR}/backends/imgui_impl_glfw.cpp"
    "${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp"
)


# Create Engine library
add_library(Engine 
    ${ENGINE_SRC}
    ${IMGUI_SRC}
)

# Include directories
target_include_directories(Engine PRIVATE 
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/vendor
    ${CMAKE_CURRENT_SOURCE_DIR}/vendor/spdlog/include
    ${GLFW_DIR}/include 
    ${GLEW_DIR}/include
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${GLM_DIR}/glm
    ${GLM_DIR}

)

# Compile definitions
target_compile_definitions(Engine PRIVATE GLEW_STATIC)

# Link libraries based on the operating system
if(WIN32)
    target_precompile_headers(Engine PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/src/qbpch.h")
    target_compile_definitions(Engine PRIVATE QB_PLATFORM_WINDOWS GLFW_INCLUDE_NONE)

    

    target_link_directories(Engine PRIVATE 
        ${GLFW_DIR}/build/src
        ${GLEW_WIN_DIR}/Windows/lib/Release/x64
    )
    target_link_libraries(Engine PRIVATE 
        glew32s 
        glfw3 
        opengl32 
        gdi32 
        winmm
    )
elseif(UNIX)
    target_precompile_headers(Engine PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/src/qbpch.h")
    target_compile_definitions(Engine PRIVATE QB_PLATFORM_LINUX GLFW_INCLUDE_NONE STBI_NO_SIMD)

    target_link_directories(Engine PRIVATE 
        ${GLFW_DIR}/build/src 
        ${GLEW_DIR}/lib
    )
    target_link_libraries(Engine PRIVATE 
        glfw3 
        GLEW 
        m 
        dl 
        pthread 
        GL
    )
else()
    message(FATAL_ERROR "Unsupported operating system")
endif()
