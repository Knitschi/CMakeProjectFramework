#!/usr/bin/python3
"""Usage:
    1_Generate.py [<config_name>] [--help]

    Running this script will run CMake to generate the "make-files" for the given configuration. 
    <config_name> must be the base-name of a configuration file found in the "Configuration" sub-directory.
    After calling this script, the makefiles can be found in the "Generated/<config-name> sub-directory.

    When the <config_name> is given, an possibly existing "Generated/<config-name>" directory will be
    deleted before running cmake. If the <config_name> option is not given, the script will choose
    the first available config in the "Configuration" directory. It will also not delete the 
    "Generated/<config-name>" directory, so this can be used for running CMake incrementally.

    Note that when calling this for the first time, this step will download and compile all dependencies
    that are handled with the hunter package manager, so the execution may take some time.

Options:
    -h --help               Show this

"""
import sys
from Sources.CppCodeBaseBuildscripts.cppcodebasebuildscripts.docopt import docopt
from Sources.CppCodeBaseBuildscripts.cppcodebasebuildscripts import buildautomat

if __name__ == "__main__":
    args = docopt(__doc__, version='1_Generate 1.0')
    automat = buildautomat.BuildAutomat()
    if not automat.generateMakefiles(args):
        print("Error: Script 1_Generate.py failed.")
        sys.exit(2)