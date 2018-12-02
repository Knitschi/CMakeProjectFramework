# This package contains the global documentation files of the CMakeProjectFramework.

include(cpfInitPackageProject)
include(cpfAddDoxygenPackage)

cpfInitPackageProject()

set( sources
    BasicConcepts.dox
    CMakeProjectFrameworkDocumentation.dox
    CPFLogo.png
    CPFLogo.svg
    CPFLogoSmall.png
    Introduction.dox
    ProjectOrganisation.dox
    SettingUpACPFProject.dox
    SettingUpTheCPFCIInfrastructure.dox
    SolvedProblems.dox
    WorkingWithACPFProject.dox
)

cpfAddDoxygenPackage(
    SOURCES ${sources}
    DOXYGEN_CONFIG_FILE "${CMAKE_CURRENT_SOURCE_DIR}/DoxygenConfig.txt"
    DOXYGEN_LAYOUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/DoxygenLayout.xml"
    DOXYGEN_STYLESHEET_FILE "${CMAKE_CURRENT_SOURCE_DIR}/DoxygenStylesheet.css"
    HTML_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/header.html"
    HTML_FOOTER "${CMAKE_CURRENT_SOURCE_DIR}/footer.html"
    PROJECT_LOGO "${CMAKE_CURRENT_SOURCE_DIR}/CPFLogoSmall.svg"
)


