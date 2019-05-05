



The |project|
=============

The **CMakeProjectFramework** framework provides a solution for organizing a cross-platform Git and CMake based C++ software project. 
At the low level it implements the execution of additional tasks like test-execution, packaging or documentation generation. 
This part is implemented with CMake and can be used without the higher level part, which implements a Jenkins based CI-infrastructure that can
be used to provide continuous integration services for a CPF project.

.. note:: This project is work in progress. The release 1.0 has yet to come.


Index
-----


.. toctree::
  :maxdepth: 1
  :caption: Introduction to the CPF:

  documentation/Introduction
  documentation/SolvedProblems
  documentation/BasicConcepts

.. toctree::
  :maxdepth: 1
  :caption: Tutorials:

  documentation/WorkingWithACPFProject
  documentation/SettingUpACPFProject
  documentation/SettingUpTheCPFCIInfrastructure

.. toctree::
  :maxdepth: 1
  :caption: Developer References:

  documentation/ProjectOrganisation
  CPFCMake/documentation/CPFCMake
  CPFBuildscripts/documentation/CPFBuildscripts
  CPFMachines/documentation/CPFMachines
  CPFTests/documentation/CPFTests

Motivation
----------

In the smaller sized teams and companies that I have worked with, improving the CI system was often a somewhat neglected part of the development. Although the eco-system
provides a number of open source tools that do the heavy lifting, it is still quite some work to integrate all the tools into a full featured CI production 
system. Implementing new features in the production code often had higher priority then the work on the infrastructure.

This situation bugged me and I started to implement a CI pipeline and infrastructure for my own C++ toy code-base. At some point the *infrastructure* code started
to get bigger then the C++ *payload* code. I decided to pull the *infrastructure* code out into its own repository which now has become the **CMakeProjectFramework**.

At it's current state the project is not battle tested. As far as I know I am the only user and the project currently lacks the generality to be useful
to everybody. However, I am interested in changing that and making the project useful to hobby developers or small teams that have not yet a CI pipeline in place.
If you are interested in using the project or joining its development, feel free to contact me via Github.


Limitations
-----------

* The CMakeProjectFramework is currently only developed on Linux and Windows. 
  In the long run I would also like to support development on MacOS,
  and cross-compiling to any other platform that is supported by CMake.
* Setting up the CI infrastructure currently requires still a lot of manual work.
* When using the **CPF** on Windows, one can easily run into the 260 character limit for filesystem paths. 
  If this is hit, the only fix is to reduce the length of package names and the project name.
  On Windows 10 the limit can be switched off though.



Similar projects
----------------

Here is an incomplete list of projects that have functionality overlaps with the CPF.

* `build2`_
* `Meson`_
* `BASIS`_
* `JAWS`_



.. External Links
.. _build2: https://build2.org
.. _Meson: https://github.com/mesonbuild/meson
.. _BASIS: https://github.com/cmake-basis/BASIS
.. _JAWS: https://github.com/DevSolar/jaws


