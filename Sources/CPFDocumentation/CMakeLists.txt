# This package contains the global documentation files of the CMakeProjectFramework.

include(cpfInitPackageProject)
include(cpfAddDoxygenPackage)

cpfInitPackageProject( CPFDoc )

set(doxygenHeader header.html)
set(doxygenFooter footer.html)
set(smallProjectLogo CPFLogoSmall.svg)

set( sources
    ${doxygenHeader}
    ${doxygenFooter}
    ${smallProjectLogo}
    BasicConcepts.dox
    CMakeProjectFrameworkDocumentation.dox
    CPFLogo.png
    CPFLogo.svg
    CPFLogoSmall.png
    ProjectOrganisation.dox
    SettingUpACPFProject.dox
    SettingUpTheCPFCIInfrastructure.dox
    SolvedProblems.dox
    WorkingWithACPFProject.dox
)

get_property( doxygenConfigFiles TARGET CPFDoxygenConfig PROPERTY CPF_DOXYGEN_CONFIG_FILES )

cpfAddDoxygenPackage(
    SOURCES ${sources}
    ${doxygenConfigFiles}
    HTML_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/${doxygenHeader}"
    HTML_FOOTER "${CMAKE_CURRENT_SOURCE_DIR}/${doxygenFooter}"
    PROJECT_LOGO "${CMAKE_CURRENT_SOURCE_DIR}/${smallProjectLogo}"
)


