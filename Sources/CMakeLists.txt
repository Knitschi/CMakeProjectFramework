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
	${CPF_DOCUMENTATION_DIR}/CMakeProjectFrameworkDocumentation.dox
	${CPF_DOCUMENTATION_DIR}/ProjectOrganisation.dox
	${CPF_DOCUMENTATION_DIR}/SettingUpACPFProject.dox
	${CPF_DOCUMENTATION_DIR}/SettingUpTheCPFCIInfrastructure.dox
	${CPF_DOCUMENTATION_DIR}/WorkingWithACPFProject.dox
)

cpfAddPackages( "${externalPackages}" "${globalFiles}")

