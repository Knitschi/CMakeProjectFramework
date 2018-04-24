
set(CPF_CONFIG "VS2017-shared" CACHE STRING "the config name" FORCE)
set(CPF_CONFIG_FILE "${CMAKE_CURRENT_LIST_FILE}" CACHE FILEPATH "The path to the used .config.cmake file.")

include("${CMAKE_CURRENT_LIST_DIR}/../CPFCMake/DefaultConfigurations/Windows.config.cmake")

set( BUILD_SHARED_LIBS ON CACHE BOOL "Set this to ON to create all production target libraries as shared libries. The fixture libraries and libraries created for executables are always static libraries." FORCE)

# LOCATIONS
set( CPF_WEBPAGE_URL "http://buildmasterdebian9:8082" CACHE STRING "An url from which the distribution of the last build can be downloaded." FORCE)
# we need a shorter test file directory to prevent trouble with path limitations
set( CPF_TEST_FILES_DIR "C:/Temp/CPF_tests/${CPF_CONFIG}" CACHE PATH "The directory under which the automated tests may create temporary files." FORCE )