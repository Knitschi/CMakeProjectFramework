

Problems solved by the CPF
==========================

This page is the sales brochure for the CPF. It lists a number of problems that I encountered while working on professional C++ projects
and that the CPF tries to solve or wants to solve in the future. It should give you all the reasons you need for switching over to the
CPF side of the force.


Problems encountered in Day to Day Development
----------------------------------------------


Getting a CMake C++ Project Setup right requires Work and Experience
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** Your are new to the fascinating world of C++ and maybe even programming.
You want to set up your long term cross-platform C++ code-base, but you have enough trouble 
with getting your source code to compile. You are not sure what a good directory
structure for your code may be, how you can split your code into multiple libraries,
how you can provide binary packages for your users and you are a little overwhelmed by CMake
in general.

**Solution:**
The CPF tries to find reasonable solutions for the above mentioned problems and tries
to hide the CMake implementation details behind a relatively small interface. Using
the CPF should reduce the time that you spend on maintaining the projects infrastructure.


Vanilla CMake can not store multiple Project Configurations outside the Build-Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** When using vanilla CMake, you can use :code:`-D` options to store one project
configuration within the project's build-tree. This does not completely fit your project's needs which
supports multiple configurations that you store outside the build-tree in some scripts
that contain the call to CMake and store your :code:`-D` options.

**Solution:** The CPF adds a :ref:`configuration management <configurationManagement>` to your project that offers an
`official` place for multiple configurations that are kept outside the build-tree.
This also offers an interface for your CI server to query the available configurations
that should be build.


Typing lengthy CMake Commands is tedious
""""""""""""""""""""""""""""""""""""""""

**Problem:** When running CMake from the command line your need to remember the lengthy
commands and generator names.

**Solution:** The :ref:`cpfbuildscripts` package provides python scripts that wrap the
underlying cmake calls in order to reduce the amount of arguments that must be given by the user.
This can be done because the scripts can exploit the :ref:`cannonical project structure <cannonicalprojectstructure>` and the configurations
provided by the :ref:`configuration management <configurationManagement>`.



Problems related to the CI Pipeline
-----------------------------------

Read the Version Number automatically from the Repository and inject it into the Build
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** You want a unique version to be injected into the build for each commit.
The version should come from your git repository and support official release versions
as well as internal developer versions.

**Solution:** The CPF automatically reads version information from the release tags.
It uses this information to derive an internal version number and inject it into the
project via generated header files. The only manual work that must be done is setting
*release* tags for the commits which are chosen to be official releases. If you choose
to also use the build-job script that is provided by :ref:`cpfmachines`, the build-job
will also add internal version tags for all successfully build commits.

.. seealso:

  :ref:`versioning`


Build Pipeline Parallelization
""""""""""""""""""""""""""""""

**Problem:** You realized that implementing your CI pipeline with linear scripts caused
your build-times become unacceptably long after adding additional pipeline tasks.
The only way to shorten the turnover times is to parallelize the execution of independent
tasks.

**Solution:** The CPF uses CMakes custom target mechanism to implement all build-steps.
This allows your build-tool to run tasks in parallel that do not depend on each other.


Re-run outdated Pipeline Steps during Development
"""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** While implementing your CI pipeline with linear scripts you realized that
you would like to automatically re-execute your pipeline steps when source files change
and to not re-execute them when they are up to date. You really do not have the time
to implement a framework for this.

**Solution:** Again, with the custom targets we exploit that this functionality
has already been implemented by your build-system.


Extend the Build Pipeline with static/dynamic Code Analysis, Documentation Generation, etc ...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** Your build pipeline only creates the binaries for your project. You would like to
further profit from your build server by adding more steps to the pipeline like, code analysis
or documentation generation.

**Solution:** The CPF provides multiple optional pipeline steps like this that are based on free open-source
tools. Among the integrated tools are: clang-tidy, clang-format, valgrind, OpenCppCoverage, sphinx
and some others. To see the full list read the :ref:`custom targets  <customtargets>` documentation.


Problems related to the Server Infrastructure
---------------------------------------------

Setting up a Jenkins Instance with multiple Build-Clients
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** You need to setup a build-server and configure a build-job for your C++ project.

**Solution:** The CPF provides a script that sets-up the server and the build-job for your
CPF project.


Publish the Project's html-pages on a Web-Server
"""""""""""""""""""""""""""""""""""""""""""""""" 

**Problem:** You need a web-server to host the html-pages that are generated by your CI pipeline.

**Solution** The CPF will setup that server for you and the build-job will make sure that the
html pages are updated with each build.


Version Control for the Build Infrastructure
""""""""""""""""""""""""""""""""""""""""""""

**Problem:** You installed a complex infrastructure of build-servers, build-jobs and web-servers.
No you realize that you cannot remember how you did it, or that you forgot to maintain your documentation
properly.

**Solution:** The CPF generates the server infrastructure completely from scripts using docker containers.
This means that you can check your machine configuration into a repository and always re-create it when
it somehow gets lost. The scripts also document how the machines are set up.


Future Solutions
----------------

A list of problems that we would like to solve in the future.


Make Switching between inlined and pre-build Dependencies easy
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** When working on a large codebase, we would like to import packages that
we do not change as binary packages in order to reduce build times. Sometimes it turns
out that we need to change those packages after all, maybe in order to fix a bug.
Now we would prefer if the package was inlined in our projects source tree in order
to get quick edit-build cycles. The CPF wants to make this change possible by simply
setting a flag in the configurations file. For inlined packages we can use git submodules
and for binary packages the hunter package manager.


Support non-monolithic code bases of arbitrary size
"""""""""""""""""""""""""""""""""""""""""""""""""""

**Problem:** Your realized that putting your code-base into one monolithic repository
forces you to globally adapt all packages to API-changes in a lower level package.
You now want a solution with multiple repositories that allows using multiple versions
of a package at the same time and do step-wise dependency updates.

**Solution:** By allowing separate repositories for package projects and build-projects,
the CPF enables a non-monolithic setup. However I have not yet tested the CPF in real large
code bases yet so I can not promise that it works. 

