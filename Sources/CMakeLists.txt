# Root CMakeLists file for the "CMakeProjectFramework"
include("${CMAKE_TOOLCHAIN_FILE}") # make sure the compiler is set before the project call	 
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/CPFCMake/Functions")
include(cpfInit)
								

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

