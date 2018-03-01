set(CPF_CONFIG "VS2017-static" CACHE STRING "the config name" FORCE)
set(CPF_CONFIG_FILE "${CMAKE_CURRENT_LIST_FILE}" CACHE FILEPATH "The path to the used .config.cmake file.")

include("${CMAKE_CURRENT_LIST_DIR}/../CPFCMake/DefaultConfigurations/Windows.config.cmake")

# LOCATIONS
set( CPF_WEBPAGE_URL "http://buildmasterdebian9" CACHE STRING "An url from which the distribution of the last build can be downloaded." FORCE)