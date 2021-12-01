
Glossary
========

.. list-table:: 
	:widths: 50 300
	:header-rows: 0

	*	- CI project
		- The top-level CMake project of a CPF project. The :code:`CMakeLists.txt` file of the CI Project is only used by this projects build-job. Therefore the CI project holds the files that are only required for the buildjob and that are not needed by other consumers of the contained packages. The CI project can hold one or more package projects.
	*	- package
		- The package is the entity that can be consumed by other CI projects. It can contain one ore more package components. A package defines its external dependencies and has its own version.
	*	- package project
		- The package project is a CMake project that is defined in a :code:`CMakeLists.txt` file that is below the root :code:`CMakeLists.txt` file. The package project is intended to be included by other CI projects, so it should not impose any kind of build-configuration on the consuming CI project.
	*	- package component
		- A package component can hold one or more targets which often are C++ binaries like libraries or executables. The package component usually exists of one main-target that is of interest for the consumers and optionally of other auxiliary targets that may implement test or test utility libraries and other custom functionality.
	*	- package archive
		- The package archive is a file that may contain the main binary artefacts of a package, but it can also contain documentation or source files. The package archive can be a zip archive or similar format. This file is intended to be handed to consumers that do not have access to the packages sources.
	*	- install component
		- Install components are sets of files that are added to package archives. This can be components like binary files, source files or files that contain the documentation of the package.
