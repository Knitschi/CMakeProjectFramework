
Problems solved by the CPF
==========================

This page is the sales brochure for the CPF. It lists a number of problems that I encountered while working on professional C++ projects
and that the CPF tries to solve or wants to solve in the future. It should give you all the reasons you need for switching over to the
CPF side of the force.


Solved problems
---------------

A list of problems that are solved by the current CPF version.


Problems during Development
^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Problem:** Your are new to the fascinating world of C++ and maybe even programming.
  You want to set up your long term cross-platform C++ codebase, but you have enough trouble 
  with getting your source code to compile. You have no experience in defining a directory
  structure for your code, splitting your code into libraries or providing binary packages
  for your users.<br>
  <b>Solution:</b> The CPF does this and more for you. If you set up a new code-base you should
  try the CPF.<br><br>

- **Problem:** You would like to use the latest CMake features in your project but you
  are not to eager to spend the time become a CMake expert and update your CMake code.<br>
  <b>Solution:</b> The CPF hides all the implementation details of a modern CMake project behind
  a relatively small interface. I may not be a CMake expert, but I have spend quite some time with
  it now and I try to keep the CPF's CMake code at the state of the art. Feel free to inform me
  if you think that something in the CPF could be done better than it is done today.<br><br>

- **Problem:** When using vanilla CMake, the project configurations that you defined with CMakes
  <code>-D</code> options are lost when you delete your build-tree.<br>
  <b>Solution:</b> The \ref CPFConfiguration "CPF config file mechanics" keeps your configuration
  out of the build-tree.<br><br>

- **Problem:** You are not the youngest anymore and you have trouble remembering long lists
  of CMake cache variable names that you need when configuring your project with CMake on
  the command line. You also fall asleep while trying to enter the long commands in the console.<br>
  <b>Solution:</b> The \ref CPFConfiguration "CPF config file mechanics" keeps the command lines
  short and lets you edit your configuration in a text-file that already lists all available variables.<br><br>

- **Problem:** You dont want to specify the source and build directories whenever you have
  to re-generate your make-files with CMake.<br>
  <b>Solution:</b> A CPF project has defined locations for the source- and build-tree. This allows
  it to remove the need for specifying them when calling its CMake wrapper scripts.<br><br>


.. todo: Is that all here?


Problems related to the CI Pipeline
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Problem:** You want to define a set of officially supported project configurations.
  These configurations should be build by the CI server to verify they work.<br>
  <b>Solution:</b> The \ref CPFConfiguration "CPF config file mechanics" allow adding a fixed
  set of build configurations to your project. If you use the CI server of the \ref CPFMachines
  package it will automatically build the defined configuration.<br><br>

- **Problem:** You want a unique version to be injected into the build for each commit.
  The version should come from your git repository and support official release versions
  as well as intermediate developer versions.<br>
  <b>Solution:</b> The CPF does this for you.<br><br>

- **Problem:** You realized that implementing your CI pipeline with linear scripts caused
  your build-times to explode when you added additional pipeline tasks.<br>
  <b>Solution:</b> The CPF uses CMakes custom target mechanism to implement all build-steps.
  This allows your build-tool to run tasks in parallel that do not depend on each other.<br><br>

- **Problem:** While implementing your CI pipeline with linear scripts you realized that
  you would like to automatically re-execute your pipeline steps when source files change
  and to not re-execute them when they are up to date. You really do not have the time
  to implement a frame-work for this.<br>
  <b>Solution:</b> Again, with the custom targets we exploit that this functionality
  has already been implemented by your build-system.<br><br>

- **Problem:** You would like to regularly run clang-tidy on your code, but you have
  no time to write the required scripts.<br>
  <b>Solution:</b> The CPF provides a custom target per package to run clang-tidy.<br><br>

- **Problem:** You would like to regularly run your automated tests with valgrind, but you have
  no time to write the required scripts.<br>
  <b>Solution:</b> The CPF provides a custom target that implements that.<br><br>


\todo add all custom targets


Problems related to the Server Infrastructure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Problem:** You need to setup a build-server and configure a build-job for your C++ project.<br>
  <b>Solution:</b> The CPF provides a script that sets-up the server and the build-job for your
  CPF project.<br><br>

- **Problem:** You need a web-server to host the html-pages that are generated by your CI pipeline.<br>
  <b>Solution:</b> The CPF will setup that server for you and the build-job will make sure that the
  html pages are updated with each build.<br><br>

- **Problem:** You installed a complex infrastructure of build-servers, build-jobs and web-servers.
  No you realize that you cannot remember how you did it, or that you forgot to maintain your documentation
  properly.<br>
  <b>Solution:</b> The CPF generates the server infrastructure completely from scripts using docker containers.
  This means that you can check your machine configuration into a repository and always re-create it when
  it somehow gets lost. The scripts also document how the machines are set up.<br><br>


Future Solutions
----------------

A list of problems that we would like to solve in the future.

- **Problem:** When working on a large codebase, we would like to import packages that
  we do not change as binary packages in order to reduce build times. Sometimes it turns
  out that we need to change those packages after all, maybe in order to fix a bug.
  Now we would prefer if the package was inlined in our projects source tree in order
  to get quick edit-build cycles. The CPF wants to make this change possible by simply
  setting a flag in the configurations file. For inlined packages we can use git submodules
  and for binary packages the hunter package manager.<br><br>

- **Problem:** Your realized that putting your code-base into one monolithic repository
  forces you to globally adapt all packages to API-changes in a lower level package.
  You now want a solution with multiple repositories that allows using multiple versions
  of a package at the same time and do step-wise dependency updates.<br>
  <b>Solution:</b> The CPF believes it supports this, but it has not been tested. The plan
  is to make sure this works in the future.<br><br>


