# This package contains the global documentation files of the CMakeProjectFramework.

include(cpfInitPackageProject)
include(cpfAddSphinxPackage)

cpfInitPackageProject()

set( sources
	BasicConcepts.rst
    CPFLogo.svg
	Introduction.rst
    ProjectOrganisation.rst
    SettingUpACPFProject.rst
    SettingUpTheCPFCIInfrastructure.rst
	SolvedProblems.rst
	WorkingWithACPFProject.rst
	../index.rst
	cmake.py
	colors.py
	conf.py
	create_identifiers.py
	.static/cmake.css
	.templates/layout.html
)

#[[
cpfAddDoxygenPackage(
    SOURCES ${sources}
    DOXYGEN_CONFIG_FILE "${CMAKE_CURRENT_SOURCE_DIR}/DoxygenConfig.txt"
    DOXYGEN_LAYOUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/DoxygenLayout.xml"
    DOXYGEN_STYLESHEET_FILE "${CMAKE_CURRENT_SOURCE_DIR}/DoxygenStylesheet.css"
    HTML_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/header.html"
    HTML_FOOTER "${CMAKE_CURRENT_SOURCE_DIR}/footer.html"
    PROJECT_LOGO "${CMAKE_CURRENT_SOURCE_DIR}/CPFLogo.svg"
    RUN_DOXYINDEXER
)

]]
cpfAddSphinxPackage(
	#CONFIG_FILE conf.py
	OTHER_FILES ${sources}
	ADDITIONAL_SPHINX_ARGUMENTS "-W"
	OUTPUT_SUBDIR html
)





