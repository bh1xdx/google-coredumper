################################################################################
# This cmake script added by jliu(jerry-liu@outlook.com or bh1xdx@gmail.com)   #
################################################################################

INCLUDE (${CMAKE_ROOT}/Modules/CheckIncludeFile.cmake)
#INCLUDE (${CMAKE_ROOT}/Modules/CheckTypeSize.cmake)
#INCLUDE (${CMAKE_ROOT}/Modules/CheckFunctionExists.cmake)
#INCLUDE (${CMAKE_ROOT}/Modules/CheckCXXSourceCompiles.cmake)
#INCLUDE (${CMAKE_ROOT}/Modules/TestBigEndian.cmake)
#INCLUDE (${CMAKE_ROOT}/Modules/CheckSymbolExists.cmake)

CHECK_INCLUDE_FILE("dlfcn.h"            HAVE_DLFCN_H)
CHECK_INCLUDE_FILE("elf.h"              HAVE_ELF_H)
CHECK_INCLUDE_FILE("errno.h"            HAVE_ERRNO_H)
CHECK_INCLUDE_FILE("fcntl.h"            HAVE_FCNTL_H)
CHECK_INCLUDE_FILE("inttypes.h"         HAVE_INTTYPES_H)
CHECK_INCLUDE_FILE("linux/unistd.h"     HAVE_LINUX_UNISTD_H)
CHECK_INCLUDE_FILE("memory.h"           HAVE_MEMORY_H)
CHECK_INCLUDE_FILE("pthread.h"          HAVE_PTHREAD_H)
CHECK_INCLUDE_FILE("signal.h"           HAVE_SIGNAL_H)
CHECK_INCLUDE_FILE("stdint.h"           HAVE_STDINT_H)
CHECK_INCLUDE_FILE("stdlib.h"           HAVE_STDLIB_H)
CHECK_INCLUDE_FILE("strings.h"          HAVE_STRINGS_H)
CHECK_INCLUDE_FILE("string.h"           HAVE_STRING_H)
CHECK_INCLUDE_FILE("sys/prctl.h"        HAVE_SYS_PRCTL_H)
CHECK_INCLUDE_FILE("sys/ptrace.h"       HAVE_SYS_PTRACE_H)
CHECK_INCLUDE_FILE("sys/resource.h"     HAVE_SYS_RESOURCE_H)
CHECK_INCLUDE_FILE("sys/socket.h"       HAVE_SYS_SOCKET_H)
CHECK_INCLUDE_FILE("sys/stat.h"         HAVE_SYS_STAT_H)
CHECK_INCLUDE_FILE("sys/sysctl.h"       HAVE_SYS_SYSCTL_H)
CHECK_INCLUDE_FILE("sys/time.h"         HAVE_SYS_TIME_H)
CHECK_INCLUDE_FILE("sys/types.h"        HAVE_SYS_TYPES_H)
CHECK_INCLUDE_FILE("sys/uio.h"          HAVE_SYS_UIO_H)
CHECK_INCLUDE_FILE("sys/wait.h"         HAVE_SYS_WAIT_H)
CHECK_INCLUDE_FILE("unistd.h"           HAVE_UNISTD_H)

set(PACKAGE                             "coredumper")
set(PACKAGE_BUGREPORT                   "opensource@google.com")
set(PACKAGE_NAME                        "coredumper")
set(PACKAGE_STRING                      "coredumper 1.2.1")
set(PACKAGE_TARNAME                     "coredumper")
set(PACKAGE_VERSION                     "1.2.1")

set(VERSION                     "1.2.1")

#fixme
set(STDC_HEADERS                     1)


set(INPUT_FILE      "${GCOREDUMPER_ROOT_DIR}/src/config.h.cmake.in")
set(OUTPUT_FILE     "${CMAKE_CURRENT_BINARY_DIR}/config.h")

include_directories(${CMAKE_CURRENT_BINARY_DIR})

configure_file(${INPUT_FILE} ${OUTPUT_FILE})


#endif // __GCOREDUMPER_CONFIG_H__
