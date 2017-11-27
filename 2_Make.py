#!/usr/bin/python3
"""Usage:
    2_Make.py [<config_name>] [--target <target>] [--config <config>] [--help]

    This script builds the given target in the given configuration.

    Explicitly stating <config_name> will also cause a full rebuild if the target has previously been make.
    If no <config_name> is given, the first configuration in the "Configuration" subdirectory will be used.
    This configuration will then be make incrementally.

    If no <target> is given, the "ALL_BUILD" target will be make.

Options:
    -h --help               Show this
    --target <target>       Specify the build target.
    --config <config>       Specify the configuration for multi-config build systems.
                            This is usually Debug or Release. 

""" 

import sys
from Sources.CppCodeBaseBuildscripts.cppcodebasebuildscripts.docopt import docopt
import Sources.CppCodeBaseBuildscripts.cppcodebasebuildscripts.buildautomat as buildautomat

if __name__ == "__main__":
    args = docopt(__doc__, version='2_Make 1.0')
    automat = buildautomat.BuildAutomat()
    if not automat.make(args):
        print("Error: Script 2_Make.py failed.")
        sys.exit(2)
