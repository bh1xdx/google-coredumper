
################################################################################
# This cmake script added by jliu(jerry-liu@outlook.com or bh1xdx@gmail.com)   #
################################################################################

cmake_minimum_required(VERSION 3.6.3)
set(CMAKE_DISABLE_IN_SOURCE_BUILD   ON)
set(CMAKE_DISABLE_SOURCE_CHANGES    ON)

project(gcoredumper CXX)

set(GCOREDUMPER_VERSION_MAJOR 0)
set(GCOREDUMPER_VERSION_MINOR 0)
set(GCOREDUMPER_VERSION_PATCH 1)
set(GCOREDUMPER_VERSION_SOVER 1)

if(OVERRIDE_CXX_STANDARD_FLAGS)
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_CXX_EXTENSIONS Off)
endif()


option(BUILD_GCOREDUMPER_SHARED_LIBS "Build libraries as shared ones" OFF)
option(BUILD_GCOREDUMPER_EXAMPLE     "Build examples"                 ON)


#set unified output path
set(GCOREDUMPER_OUT_DIR  ${CMAKE_BINARY_DIR}/output)
set(GCOREDUMPER_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

message(STATUS "${PROJECT_NAME} OUTPUT DIRECTORY: ${GCOREDUMPER_OUT_DIR}")
message(STATUS "${PROJECT_NAME} BUILD_GCOREDUMPER_EXAMPLE=${BUILD_GCOREDUMPER_EXAMPLE}")


set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${GCOREDUMPER_OUT_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${GCOREDUMPER_OUT_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${GCOREDUMPER_OUT_DIR})



add_subdirectory(src)

if(BUILD_GCOREDUMPER_EXAMPLE)
    add_subdirectory(examples)
    set_property(TARGET gcoredumper          PROPERTY FOLDER "gcoredumper")
    set_property(TARGET gcoredumper_examples PROPERTY FOLDER "gcoredumper")
endif()
