from conans import ConanFile

class SimpleOneLibCPFTestProject(ConanFile):
    
    url = "https://knitschi.github.io/CMakeProjectFramework/LastBuild/doc/sphinx/html/"
    license = "MIT"
    description = "The CMakeProjectFramework provides a solution for organizing cross-platform C++ software projects that are based on Git and CMake."

    # Dependencies
    python_requires = "CPFConanfile/0.0.20@knitschi/development",
    python_requires_extend = "CPFConanfile.CPFBaseConanfile",

    cpf_conanfile_module = None

    def init(self):

        self.cpf_conanfile_module = self.python_requires["CPFConanfile"].module

        self.cpf_conanfile_module.init_impl(
            self,
            self.cpf_conanfile_module.CPFBaseConanfile,
            "https://github.com/Knitschi/CMakeProjectFramework.git",
            path_CPFCMake='Sources/CPFCMake',
            path_CPFBuildscripts='Sources/CPFBuildscripts',
            path_CIBuildConfigurations='Sources/CIBuildConfigurations'
            )

