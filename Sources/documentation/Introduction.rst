
Introduction
============

When setting up a C++ Software project multiple tasks besides writing the actual C++ code arise.

- Organizing the code-base into smaller packages.
- Versioning of the packages.
- Automatic acquisition of external software dependencies.
- Creating distribution packages that can be consumed by others.
- Setting up a build pipeline that also does additional tasks like running automated test, static/dynamic analysis, generate documentation, etc.
- Setting up a CI-server to run the pipeline.
- Setting up a homepage for the project that hosts the documentation.

The CMakeProjectFramework tries to solve the above mentioned problems by using a combination of common open source tools from the C++
ecosystem. The third party tools used by the CMakeProjectFramework are:


Required
""""""""

- `CMake`_ (meta-buildsystem)
- `Git`_ (code version control system)


Optional
""""""""

- `Jenkins`_ (CI server)
- `Cotire`_ (CMake module for pre-compiled headers)
- `Sphinx`_ (documentation generator)
- `clang-tidy`_ (static code analysis)
- `valgrind`_ (dynamic code analysis)
- `OpenCppCoverage`_ (test coverage visualization)
- `Abi Compliance Checker`_ (visualize changes in the API/ABI between package versions)
- `Graphviz`_ (generates pictures of graphs from text-based definitions)


Using the **CPF** should relieve you of writing your own higher level CMake code or other additional scripts to implement pipeline tasks.
It can additionally provide a Jenkins CI infrastructure that is (in the future) completely generated from text-files.


.. External Links
.. _Git: https://git-scm.com
.. _CMake: https://cmake.org
.. _Cotire: https://github.com/sakra/cotire
.. _Jenkins: https://jenkins.io/
.. _Sphinx: http://www.sphinx-doc.org/en/master/index.html
.. _clang-tidy: http://clang.llvm.org/extra/clang-tidy/
.. _valgrind: http://valgrind.org/
.. _OpenCppCoverage: https://github.com/OpenCppCoverage/OpenCppCoverage
.. _Abi Compliance Checker: https://github.com/lvc/abi-compliance-checker
.. _Graphviz: https://www.graphviz.org/