
include(${CMAKE_CURRENT_LIST_DIR}/../CppCodeBaseCMake/DefaultConfigurations/Linux.config.cmake)

# GENERATOR AND TOOLCHAIN
set( CMAKE_GENERATOR "Ninja" CACHE STRING "The CMake generator" FORCE)
# It seems that on Linux the CMAKE_MAKE_PROGRAM is set before reaching the project() command.
# This means that we can not leave it empty here like on windows where it is determined when
# calling project()
set( CMAKE_MAKE_PROGRAM "ninja" CACHE STRING "For some generators the make program must be set manually." FORCE)
set( CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/../CppCodeBaseCMake/DefaultConfigurations/Clang.cmake" CACHE PATH "The file that defines the compiler and compile options for all compile configurations." FORCE)
set( CMAKE_BUILD_TYPE "Release" CACHE STRING "The compile configuration used by single configuration make tools." FORCE)
# we need debug and shared in one config to allow using the abi-compliance-checker
set( BUILD_SHARED_LIBS OFF CACHE BOOL "Set this to ON to create all production target libraries as shared libries. The fixture libraries and libraries created for executables are always static libraries." FORCE)
set( CCB_ENABLE_PRECOMPILED_HEADER OFF CACHE BOOL "Switch the use of precompiled headers on and off." FORCE)

# LOCATIONS
set( CCB_WEBPAGE_URL "http://feldrechengeraet" CACHE STRING "An url from which the distribution of the last build can be downloaded." FORCE)
# At some point this should be done by hunter
set(Qt5_DIR "/usr/local/Qt-5.5.1/debug/lib/cmake/Qt5" CACHE STRING "Location of Qt" FORCE)
