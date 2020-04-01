
################################################################################
# This cmake script added by jliu(jerry-liu@outlook.com or bh1xdx@gmail.com)   #
################################################################################

project(gcoredumper C)

INCLUDE (${GCOREDUMPER_ROOT_DIR}/cmake/check.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(GCOREDUMPER_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(GCOREDUMPER_BIN_DIR ${CMAKE_CURRENT_BINARY_DIR})

add_definitions(-DGCOREDUMPER_LIB -D_GNU_SOURCE)


if(NOT WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unknown-pragmas -fpermissive")
endif(NOT WIN32)

include_directories(${GCOREDUMPER_SRC_DIR}/
                    ${GCOREDUMPER_SRC_DIR}/../include
                    )

aux_source_directory(. GCOREDUMPER_SRCS)


file(GLOB_RECURSE GCOREDUMPER_HEADERS "*.h" "*.hpp" "${GCOREDUMPER_SRC_DIR}/../include/*.h")


# Resource for MSFT Windows
if(WIN32)
    file(GLOB_RECURSE GCOREDUMPER_RC "*.rc")
    set(GCOREDUMPER_LINK_GLAGS /DEF:${GCOREDUMPER_SRC_DIR}/gcoredumper.def)
    set(GCOREDUMPER_RC_FLAGS "/l 0x809")
else(WIN32)
    set(GCOREDUMPER_LINK_GLAGS -fvisibility=default)
endif(WIN32)

if(BUILD_GCOREDUMPER_SHARED_LIBS)
    add_library(${PROJECT_NAME} SHARED ${GCOREDUMPER_HEADERS} ${GCOREDUMPER_SRCS}  ${GCOREDUMPER_RC})
else(BUILD_GCOREDUMPER_SHARED_LIBS)
    add_library(${PROJECT_NAME} STATIC ${GCOREDUMPER_HEADERS} ${GCOREDUMPER_SRCS}  ${GCOREDUMPER_RC})
endif(BUILD_GCOREDUMPER_SHARED_LIBS)

set_target_properties(${PROJECT_NAME} PROPERTIES
                       DEBUG_POSTFIX   -d
                       VERSION "${GCOREDUMPER_VERSION_MAJOR}.${GCOREDUMPER_VERSION_MINOR}.${GCOREDUMPER_VERSION_PATCH}" SOVERSION "${GCOREDUMPER_VERSION_SOVER}")

#set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS ${GCOREDUMPER_LINK_GLAGS})

target_link_libraries( ${PROJECT_NAME} ${GCOREDUMPER_LIBS} )


