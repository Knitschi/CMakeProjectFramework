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


cpfAddSphinxPackage(
	OTHER_FILES ${sources}
	ADDITIONAL_SPHINX_ARGUMENTS "-W"
	OUTPUT_SUBDIR html
	SOURCE_SUFFIXES rst md
)

