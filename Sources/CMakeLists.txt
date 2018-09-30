# Root CMakeLists file for the "CMakeProjectFramework"
include("${CMAKE_TOOLCHAIN_FILE}") # make sure the compiler is set before the project call	 
list(APPEND CMAKE_MODULE_PATH 
	"${CMAKE_CURRENT_LIST_DIR}/CPFCMake/Functions"
	"${CMAKE_CURRENT_LIST_DIR}/CPFCMake/Variables"
)
include(cpfConstants)
cmake_minimum_required(VERSION ${CPF_MINIMUM_CMAKE_VERSION})
include(cpfInit)

##################################### CREATE PROJECT ########################################
project(CMakeProjectFramework)
cpfInit()

####################################### ADD Packages #############################################

set( externalPackages
	cotire
)

set( globalFiles
	${CPF_DOCUMENTATION_DIR}/BasicConcepts.dox
	${CPF_DOCUMENTATION_DIR}/CMakeProjectFrameworkDocumentation.dox
	${CPF_DOCUMENTATION_DIR}/CPFLogo.png
	${CPF_DOCUMENTATION_DIR}/CPFLogo.svg
	${CPF_DOCUMENTATION_DIR}/CPFLogoSmall.png
	${CPF_DOCUMENTATION_DIR}/CPFLogoSmall.svg
	${CPF_DOCUMENTATION_DIR}/DoxygenConfig.txt
	${CPF_DOCUMENTATION_DIR}/DoxygenLayout.xml
	${CPF_DOCUMENTATION_DIR}/DoxygenStylesheet.css
	${CPF_DOCUMENTATION_DIR}/footer.html
	${CPF_DOCUMENTATION_DIR}/header.html
	${CPF_DOCUMENTATION_DIR}/ProjectOrganisation.dox
	${CPF_DOCUMENTATION_DIR}/SettingUpACPFProject.dox
	${CPF_DOCUMENTATION_DIR}/SettingUpTheCPFCIInfrastructure.dox
	${CPF_DOCUMENTATION_DIR}/SolvedProblems.dox
	${CPF_DOCUMENTATION_DIR}/WorkingWithACPFProject.dox
)

cpfAddPackages( "${externalPackages}" "${globalFiles}")

