# Root CMakeLists file for the "CMakeProjectFramework"
cmake_minimum_required (VERSION 3.8.0) 

include("CPFCMake/cpfInit.cmake")
include("${CMAKE_TOOLCHAIN_FILE}")					# make sure the compiler is set before the project call


##################################### CREATE PROJECT ########################################
project(CMakeProjectFramework)
cpfInit()

####################################### ADD Packages #############################################

set( externalPackages
	cotire
)

set( globalFiles
	documentation/CMakeProjectFrameworkDocumentation.dox
	documentation/ProjectOrganisation.dox
	documentation/SettingUpACPFProject.dox
	documentation/SettingUpTheCPFCIInfrastructure.dox
	documentation/WorkingWithACPFProject.dox
)

cpfAddPackages( "${externalPackages}" "${globalFiles}")

