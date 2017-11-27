# Root CMakeLists file for the "CppCodeBase"
cmake_minimum_required (VERSION 3.8.0) 

include("CppCodeBaseCMake/ccbInit.cmake")
include("${CMAKE_TOOLCHAIN_FILE}")					# make sure the compiler is set before the project call


##################################### CREATE PROJECT ########################################
project(BuildCppCodeBase)
ccbInit()

####################################### ADD CppCodeBase Packages #############################################
# The packages must be sorted by their level in the dependency graph with the lowest levels at the beginning
set( packages
	# level 0
	lib0
	# level 1
	lib1
	# level 2
	app2A
	app2B
)

ccbAddPackages("${packages}" "")
