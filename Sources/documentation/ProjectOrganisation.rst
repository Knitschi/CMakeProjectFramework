
Project Organization
====================

The CMakeProjectFramework master repository contains some of the documentation of the CMakeProjectFramework and provides the configuration
for its official build job. The master repository also serves as an "owner" for the packages that implement the various aspects
of the CI system. The packages are located in their own repositories and added as Git submodules to the master repository. 

The packages are:

..
  - :ref:`CPFCMake`: Contains CMake code that implements the additional CI tasks as custom targets.
  - :ref:`CPFBuildscripts`: Provides python scripts that shorten the frequently used CMake calls.
  - :ref:`CPFMachines`: Provides a python script that sets up a Jenkins-CI server and web-servers that provide CI-jobs for CPF-projects.


Package Dependencies
--------------------

Here is a simplified graph the illustrates the dependencies between the packages of the CMakeProjectFramework. 

.. graphviz::

  digraph G {
    node [ fontsize=11, fontname="Helvetica-Bold" ]
    edge [ fontsize=11, fontname="Helvetica" ]
    {
    
      node [shape=box, fontcolor="#4665C0"];
      CPFBuildscripts [ URL="\ref CPFBuildscripts"];
      CPFCMake [ URL="\ref CPFCMake"];
      CPFMachines [ URL="\ref CPFMachines"];
    }
    "MyMachinesConfig" -> "CPFMachines" [ label="Uses setup script and provides config." ]
    "CPFMachines" -> "CPFBuildscripts" [ label="Uses scripts in buildjob." ]
    "CPFMachines" -> "CPFCMake" [ label="Uses CMake scripts for version tagging." ]
    "CPFBuildscripts" -> "CPFCMake" [ label="Uses custom targets and config file mechanics."  ]
    "CPFCMake" -> "3rd party tools and libs" [ label="Uses 3rd party tools provided by CPFMachines and hunter." style = dashed ]
  }

MyBuildRepository represents a project that uses the CMakeProjectFramework. 

:: note: In the long run, the dependency between CPFCMake and %CPFMachines should be removed 
by making CPFCMake acquire all of the third party software via hunter, instead of using the pre-installed
software from the build slaves.

Dependencies
------------

:: todo: Add a description on how to get the dependencies with the supported package managers.

