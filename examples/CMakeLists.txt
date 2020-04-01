
################################################################################
# This cmake script added by jliu(jerry-liu@outlook.com or bh1xdx@gmail.com)   #
################################################################################

Project(gcoredumper_examples)

# SRC.
set(GCOREDUMPER_EXAMPLES_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(.
                    ../src
                    )
if(NOT WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Og")
endif(NOT WIN32)

aux_source_directory(. GCOREDUMPER_EXAMPLES_SRCS)

file(GLOB_RECURSE GCOREDUMPER_EXAMPLES_HEADERS "*.h")

# LINK
set(GCOREDUMPER_EXAMPLES_LIBS pthread
        debug gcoredumper-d optimized gcoredumper
    )


message(STATUS "GCOREDUMPER_EXAMPLES-LIBS: ${GCOREDUMPER_EXAMPLES_LIBS}")

link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
                 )

message(STATUS "GCOREDUMPER_EXAMPLES-LIB-DIRS: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")

add_executable(${PROJECT_NAME} ${GCOREDUMPER_EXAMPLES_HEADERS} ${GCOREDUMPER_EXAMPLES_SRCS})

target_link_libraries( ${PROJECT_NAME} ${GCOREDUMPER_EXAMPLES_LIBS} )

add_dependencies(${PROJECT_NAME} gcoredumper)

set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX   -d)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})


