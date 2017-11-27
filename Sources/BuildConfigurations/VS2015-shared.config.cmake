
include("${CMAKE_CURRENT_LIST_DIR}/../CppCodeBaseCMake/DefaultConfigurations/Windows.config.cmake")

set( BUILD_SHARED_LIBS ON CACHE BOOL "Set this to ON to create all production target libraries as shared libries. The fixture libraries and libraries created for executables are always static libraries." FORCE)

# LOCATIONS
set( CCB_WEBPAGE_URL "http://feldrechengeraet" CACHE STRING "An url from which the distribution of the last build can be downloaded." FORCE)
