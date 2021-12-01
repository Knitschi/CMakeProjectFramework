# This package contains the global documentation files of the CMakeProjectFramework.

include(cpfPackageProject)
include(cpfAddSphinxPackageComponent)

cpfPackageProject(
    TARGET_NAMESPACE doc
    COMPONENTS SINGLE_COMPONENT
	LANGUAGES NONE
)

set( sources
	BasicConcepts.rst
    CPFLogo.svg
	Introduction.rst
    ProjectOrganisation.rst
    SettingUpACPFProject.rst
    SettingUpTheCPFCIInfrastructure.rst
	SolvedProblems.rst
	WorkingWithACPFProject.rst
	Glossary.rst
	../index.rst
	cmake.py
	colors.py
	conf.py
	create_identifiers.py
	.static/cmake.css
	.templates/layout.html
)


cpfAddSphinxPackageComponent(
	OTHER_FILES ${sources}
	# We remove the warnings as errors flag for now because i do not spend the time to fix them now
	# I should fix them when doing some work on the documentation.
	# ADDITIONAL_SPHINX_ARGUMENTS "-W"
	SOURCE_SUFFIXES rst md
)

