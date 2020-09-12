
.. _WorkingWithACPFProject:

Working with a CPF Project
==========================

This page provides practical information on how to do the day to day tasks that arise when working with a *CPF* project.
The text refers to an example project that can be retrieved from Github to illustrate the required steps.

Setting up the Environment
--------------------------

Before you start, you have to install the basic tools that are used by the CMakeProjectFramework.

.. todo:: Find out what must be installed by hand to compile the project.

Windows

- Visual Studio 2017
- Git
- Python3
- CMake 3.12.1
- OpenCppCoverage (optional)
- Doxygen

Linux

- Gcc
- Git
- Python3
- CMake 3.12.1
- Clang (optional)
- Valgrind (optional)
- Doxygen

Git, Python and CMake should be callable from the command-line. (add them to PATH on Windows)


Cloning the Example Project
---------------------------

A CPF project must be based on a git repository. The CMake code relies on it when determining package versions and when
handling packages that can be contained in git submodules. Because of the contained submodules the repository
must be cloned by using:

.. code-block:: bash

  > git clone --recursive https://github.com/Knitschi/ACPFTestProject.git



Configure, generate and build a CPF project
-------------------------------------------

In order to build a freshly cloned CPF project, four commands need to be exectuted. Sadly this is
a little more effort then the normal two steps (*generate* and *build*) that are used for a *vanilla* CMake project.
The steps are implemented with the following *Python 3* scripts.

* **0_CopyScripts.py:** Copies the other scripts to the projects root directory. 
* **1_Configure.py:** Adds a CMake configuration for the project.
* **3_Generate.py:** Create the *make-files* for a project configuration.
* **4_Make.py:** Build the project.

If you have your operating system configured to run :code:`.py` files with python 3, you can omit the explicit call to :code:`python` in the following command line examples.
If this is not the case, make sure the :code:`python --version` call returns a 3.X version. On Linux you may need to use the command
:code:`python3` instead of :code:`python`.


The Copy Step
^^^^^^^^^^^^^

In order to execute the copy step run

.. code-block:: bash

  ...\ACPFTestProject> python Sources/CPFBuildscripts/0_CopyScripts.py


in the project root directory.

This step copies some python scripts into the project's root directory. The scripts are
provided by the CPFBuildscripts package. The scripts are only copied to shorten the command-line
calls while working with the project. This step only needs to be executed
once after cloning the repository.


.. _configurationStep:

The Configuration Step
^^^^^^^^^^^^^^^^^^^^^^

In order to generate a configuration file run

.. code-block:: bash

  .../ACPFTestProject> python 1_Configure.py VS --inherits VS2017-shared


on Windows or 

.. code-block:: bash

  .../ACPFTestProject> python3 1_Configure.py Gcc --inherits Gcc-shared-debug


on Linux in the project root directory.

The purpose of the configuration step is to create the :code:`Configuration/<config>.config.cmake` file that contains a set of CMake cache variables.
These variables determine things like the CMake *generator*, or which custom targets are included in the pipeline.
The config file is used instead of the usual variable definitions in the CMake generate step.
The name of the configuration (here :code:`VS` or :code:`Gcc`) can be chosen freely.

The :code:`--inherits` option determines a base configuration from which the created file inherits default values for all required variables.
The base configuration can be provided by the CPFCMake package or the projects :code:`CIBuildConfigurations` directory, which is the common
use case. Some of the values in the configuration file, like library locations or test file directories must be set to values that are 
specific to the machine onto which the project was cloned.
After running the script you have the chance to edit the default values in the created configuration file in order to change the values to something
that is adequate for the local build. On a CI server it may sometimes be useful to set non default values of variables directly with the command line
call. This can be done by adding :code:`-D` options to the script call.

.. code-block:: bash

  ...\ACPFTestProject> 1_Configure.py VS --inherits VS2017-shared -D HUNTER_ROOT="C:/MyHunterLibs" -D CPF_TEST_FILES_DIR=="C:/Temp"


A project can have multiple configurations in parallel. This can be achieved by running the :code:`1_Configure.py` script, multiple times
with different configuration names. However, if only one configuration is available, the configuration argument can be omitted
in the following generate and build steps.


Notes on the Configuration File Mechanism
"""""""""""""""""""""""""""""""""""""""""

The custom mechanism with the additional configuration file distinguishes the workflow of the CPF project from the
standard CMake command line workflow, where the configure and generate step are executed at the same time.
A disadvantage of CPF's config file mechanism is that configuration information is duplicated in the :code:`config.cmake` file and the :code:`CMakeCache.txt` file.
The developer has to remember that instead of editing the :code:`CMakeCache.txt` file one now has to edit the :code:`config.cmake` file and then
re-execute the generate step.
The additional command line call may also come unexpected to developers who are used to work with *normal* CMake projects. 

However, CMake itself provides a similar three step work-flow when using the CMake-GUI application. 
Here the user can also change values of variables in the :code:`CMakeCache.txt` file before executing the generate step. 
This indicates that there is a certain need for a three-step approach.

The CPF mechanism has some advantages over the two step work-flow which in my opinion outweigh the disadvantages.

- Developers are relieved of remembering long lists of variable definitions that need to be typed
  whenever they need to re-generate the project. Especially when working on CMake code it becomes often necessary
  to delete the build directory in order to create fresh project. With the CPF mechanism the manual work of creating a
  project configuration is not lost when the build directory is deleted.

- The project can define default configurations that are used by the projects CI job. This can be used
  to define *officially* supported compiler configurations and platforms.


.. _generateStep:

The Generate Step
^^^^^^^^^^^^^^^^^

To execute the generate step run

.. code-block:: bash

  ...\ACPFTestProject> python 3_Generate.py VS


on Windows or

.. code-block:: bash

  .../ACPFTestProject> python3 3_Generate.py Gcc


on Linux in the project root directory.

The generate step is the equivalent to the normally used :code:`cmake -H. -B_build -G"generator" -D...` call.
In fact running the command will print the underlying CMake command line.
The command creates the build-directory :code:`Generated/VS` that holds the generated *make-files* for the generator that is set 
in the config file. In this example this is the Visual Studio solution for the Windows case and the make files
in the Linux case.

- When the configuration argument is not given, the script will use the first configuration that is available in the :code:`Configuration` directory.

- You can use the :code:`--clean` option to delete the complete :code:`Generated\<config>` directory before executing the generate step.
  This is sometimes necessary when an existing configuration is changed.


.. _buildStep:

The Build Step
^^^^^^^^^^^^^^

To execute a full build run

.. code-block:: bash

  ...\ACPFTestProject> python 4_Make.py VS --target pipeline --config Debug


on Windows or

.. code-block:: bash

  .../ACPFTestProject> python3 4_Make.py Gcc --target pipeline


on Linux. This will compile the binaries as well as executing extra pipeline tasks like running the tests, do code analysis,
generate the documentation or other steps that your project may have enabled via its configuration file.

- When the configuration argument is not given, the script will use the first configuration for which the generate step was already executed.

- Adding the :code:`--clean` option will cause a complete rebuild instead of an incremental one.

- With the :code:`--target` option one can specify which target should be build. During development this is useful if only
  a smaller part of the pipeline should be executed. Here is a :ref:`list of available custom targets <customtargets>`.
  If the :code:`--target` option is omitted completely, the script will only build the binary targets of the project.

- The :code:`--config` option is only required for multi-configuration generators like Visual Studio. If it is not
  specified, the :code:`Debug` configuration will be build.


The Anatomy of a CPF Project 
----------------------------

Now that you have built the project, it is time to take a look at the content of the test project.


.. _cannonicalprojectstructure:

The canonical Directory Structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The CMakeProjectFramework enforces a fixed directory structure for the top level directories of the project.
Here are the most important parts of that directory layout.
Note that depending on the configuration that you built, not all of the shown directories and files will exist in your project.
Many of the displayed directories do not exist in a freshly cloned CPF project.

.. code-block:: bash

  ACPFTestProject
  │   .gitignore
  │   .gitmodules
  │   1_Configure.py
  │   3_Generate.py
  │   4_Make.py
  │   README.rst
  │   ... [other scripts that help with day to day tasks]
  │
  ├───Configuration
  │       VS.config.cmake
  │       Gcc.config.cmake
  │       ... [more configuration files]
  │
  ├───Generated
  │   ├───VS
  │   │   │   CMakeCache.txt
  │   │   │   CMakeGraphVizOptions.cmake
  │   │   │   CPFDependencies.dot
  │   │   │
  │   │   ├───BuildStage
  │   │   ├───html
  │   │   ├───_CPF
  │   │   ├───_pckg
  │   │   ... [the usual CMake generated directories and files]
  │   │
  │   ├───Gcc
  │   ... [more configuration directories]
  │
  └───Sources
      │   CMakeLists.txt
      │   packages.cmake
      │
      ├───CIBuildConfigurations
      │   cpfCiBuildConfigurations.json
      │   VS2017-shared.config.cmake
      │   Gcc-shared-debug.config.cmake    
      │   ... [more config files]
      │            
      ├───APackage
      │   │   CMakeLists.txt
      │   │   function.cpp
      │   │   function.h
      │   │   ... [more package source files]
      │   │
      │   ├───MyCustomDirectory
      │   │   ... [source files in sub-directories]
      │   │
      │   ... [more package subdirectories]
      │  
      ├───BPackage
      │
      ... [more package directories or global file directories]



The Root Directory
""""""""""""""""""

The :code:`ACPFTestProject` directory is the root directory of the project. This is the directory that you get when cloning a CPF project.
Most of the command line operations that are needed to handle the CPF project are executed in this directory. The directory contains
scripts to configure and build the project. It also contains the :ref:`Sources <sources_dir>`, :ref:`Configuration <configuration_dir>` and :ref:`Generated <generated_dir>` directories.
The :ref:`Sources <sources_dir>` directory is stored in the repository, while the other two are generated when setting up the project.


.. _sources_dir:

The Sources Directory
"""""""""""""""""""""

The *Sources* directory contains all the files that are checked into the repository.
After cloning a CPF repository, this should be the only existing directory in the cpf-root-directory. The Sources directory contains
the root :code:`CMakeLists.txt` file of the repository, global files and directories for the packages that contain the *payload* code
of the project. There is a set of files that are in every CPF project.

- **CMakeLists.txt:** The root :code:`CMakeLists.txt` file creates the CI-project. This is the *host* project that contains the
  package projects that are created by the packages :code:`CMakeLists.txt` files. The CPF dependencies are pulled in by including the
  :ref:`cpfInit <cpfInitModule>` module. The Packages are added by calling the :ref:`cpfAddPackages` function. Both are provided by the :ref:`cpfCMake` package.

- **packages.cmake:** This file defines a CMake variable that holds a list of package names that are :code:`OWNED` by this
  CI-project or are :code:`EXTERNAL` packages. *Owned* means, that the CI-job that builds this repository is responsible for verifying that all automated checks for
  the package pass before it is marked with a version tag. More information about package ownership can be found :ref:`here <packageOwnership>`.

- **CIBuildConfigurations:** This directory provides the CI job with information about the project configurations that should
  be build by the CI job. These configurations are defined in files like :code:`VS.config.cmake` which contain a
  set of CMake cache variables. More information about the config file mechanism can be found :ref:`here <configurationStep>`.

- **CIBuildConfigurations/cpfCiBuildConfigurations.json:** A file that contains a list of configurations that are build by the
  projects CI job. This is only needed if the infrastructure provided by :ref:`CPFMachines` is used.

- **APackage:** A directory that contains a package. The name of the package directory can be chosen by the user. 
  It also defines the name of the main library, executable or custom target that is created by this package. 
  A CPF project can have multiple package directories.
  The package directory contains all source files that belong to the package. These can hold the production code, test code or 
  the package documentation. The package directory must contain a :code:`CMakeLists.txt` file that calls the
  :ref:`cpfInitPackageProject` and one of the :code:`cpfAdd<X>Package()` functions. The directory structure within the package directory can be chosen freely.
  The relative directories of source files must be prepended when adding the files to the packages :code:`CMakeLists.txt` file.


.. _configuration_dir:

The Configuration Directory
"""""""""""""""""""""""""""

The *Configuration* directory contains CMake files that define the locally used configurations of the project. This directory is
generated by calling the :code:`1_Configure.py` script in the :ref:`configuration step <configurationStep>`. 
This directory is used to keep manually created project configurations out of the potentially short lived *Generated* directory.


.. _generated_dir:

The Generated Directory
"""""""""""""""""""""""

The *Generated* directory contains all files that are generated by the :ref:`generate- <generateStep>` and :ref:`build step <buildStep>`.
All contents of that directory can be deleted without loosing any manual work.
However you will have to re-execute the *generate* and *build* step after deleting this directory.

The *Generated* directory contains one subdirectory for each configuration for which the *generate* step is executed. 
The configuration directories are the CMake *build* directories that contain the usual CMake generated files as well 
as some special directories that are created by the CMake code of the CPF.

**CPF specific Build Directory Content:**

- **Generated/<config>/html:** The primary output directory of the project. It contains created distribution packages in the :code:`Downloads` subdirectory.
  The :code:`doxygen` subdirectory contains the entry page of the generated project page, which leads to the documentation and other optionally generated
  html pages like coverage report.

- **Generated/<config>/BuildStage:** This directory contains all the binaries that are generated when building the project. When running an
  executable during debugging or automated testing, it is run from within this directory.

- **Generated/<config>/_CPF:** A directory that is used for all internal files that are generated by the custom targets of the CPFCMake package.
  If everything goes well, the contents are only of interest when developing the CPFCMake package itself.

- **Generated/<config>/_pckg:** A directory that is used to accumulate the contents of the created distribution packages.
  If everything goes well, the contents are only of interest when developing the CPFCMake package itself.


CI project, Package Projects and Package Ownership in Practice
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The :ref:`basic concepts <basicConcepts>` page mentions, that the *CPF* wants to separate CI-functionality related cmake code from *payload* code.
In the repository this is reflected by the two layers of :code:`CMakeLists.txt` files. The CI-project is defined by
the root :code:`CMakeLists.txt` file in the *Sources* directory. The package projects are defined by the :code:`CMakeLists.txt` files
in the :code:`Sources/<package>` directories.

In the *ACPFTestProject* we have quite a number of packages. The packages *APackage*, *CPackage*, *DPackage* *documentation* and *EPackage*.
are listed in the :code:`Sources/packages.cmake` file, which defines them as *owned* packages. This means that
it is this CI-project's responsibility to provide their *official* build pipeline that ensures that they build and work.
CPackage and documentation are *fixed* packages, which means that they are in the same repository as the CI-project. It is called *fixed*
because this fixes the package version to the version of the CI-project. The other owned packages are *loose*, because
they are pulled in via the git-submodule mechanism which allows them to have their version incremented independently
from the other packages.

The packages *BPackage*, *CPFBuildscripts*, *CPFCMake*, *documentation*, *FPackage*, *GPackage*
and *libSwitchWarningsOff* are external packages. External packages are always pulled in via the git-submodule mechanism.



Common Git Operations on a CPF Project
--------------------------------------

.. todo:: Describe to most common git operations. (update of packages etc. )



Consuming Binary Library Packages created by a CPF Project
----------------------------------------------------------

The :ref:`cpfAddCppPackage` allows you to create binary packages for your library targets.
These packages contain *.cmake* files that can be used by other *CMake* based projects to consume
your libraries with the :code:`find_package( ... CONFIG ... )` function.

.. note:: 

  Currently binary packages with :ref:`internal versions <internalVersion>` are not consumable
  by other CMake projects. This is because the standard package files do not know how to handle the internal
  version number format of the *CPF*.

