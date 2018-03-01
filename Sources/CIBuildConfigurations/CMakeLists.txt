# This package contains files that provide build-configurations for the CI-Build-Server.
include(cpfAddPackage)

cpfInitPackageProject(
	PACKAGE_NAME
	cibc
)

set(files
	Clang-static-release.config.cmake
	cpfCIBuildConfigurations.json
	Gcc-shared-debug.config.cmake
	VS2017-shared.config.cmake
	VS2017-static.config.cmake
)

cpfAddFilePackage( ${PACKAGE_NAME} "${files}" )