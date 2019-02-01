/**
\page CPFSettingUpTheInfrastructure Setting up the CPF CI server infrastructure

This page contains a tutorial on how to use the scripts provided by the *CPFMachines* package to
set up a continuous integration server infrastructure for you CPF projects. The tutorial assumes
that you are familiar with the \ref CPFWorkingWithCPF and the \ref CPFSettingUpACPFProject tutorials.
The tutorial also assumes that you have a CPF project provided by a remote git repository that
can be pulled and pushed to via the SSH protocol. It assumes you can clone that repository with

\verbatim
>git clone --recursive ssh://myuser@mydebianpc:/home/myuser/repositories/MyCPFProject.git
\endverbatim


\section CPFMachinesTutorial Step by step tutorial for setting up the CPF CI infrastructure

The main functionality of the *CPFMachines* package is provided by a python script \c setup.py.
The script accesses the machines that belong to your environment over SSH in order to setup a
Jenkins CI server, build slaves and web-servers for your CPF project pages.
The script reads a configuration \c .json file that contains values like machine access data,
the number of slaves that you desire, etc. This tutorial gives you an example on how to use
create a correct configuration file, provide the host machines for your servers and finally
how to run the \c setup.py script.


\subsection CPFCreateConfigRepository 1. Create a repository for your configuration files

In order to use the *CPFMachines* package you will have to create some custom configuration files,
that will define some basic properties of your server setup. It is not necessary but recommended
that you add these files to a git repository. You can also use this repository to add other
files with helper scripts and such that you use for handling your infrastructure.

\verbatim
>mkdir MyCPFMachines.git
>cd MyCPFMachines.git
>git init --bare --share
>cd ..
>git clone MyCPFMachines.git
\endverbatim 

We now add the *CPFMachines* package as a git submodule.

\verbatim
>cd MyCPFMachines
>git submodule add https://github.com/Knitschi/CPFMachines.git
\endverbatim 


\subsection CPFProvideMachinesWithSSHAccess 3. Provide host machines with SSH access

If you want your CPF project to be build on Linux and Window, you have to at least provide one
Debian 8.9 and one Windows 10 machine. This tutorial assumes this minimalist setup. The machines can be virtual or physical ones. 
After you learned the basics you can still add more machines for in order to provide more build slaves. 
If you do not care for Windows builds, you can leave away the Windows machine.
If you only want to do Windows builds, you will still need the Linux machine as it will host the jenkins and
web server.

1. Get two fresh physical or virtual machines and install Windows 10 on one, and Debian 8.9 on the other. Both machines must be
attached to the local network.
2. Create an account on the Debian machine that can be accessed via SSH.
3. Install docker on the debian machine.
3. Create an account on the Windows machine that can be accessed via SSH with the Bitvise SSH server.
4. Install build tools on the Windows machine.

\todo Add more detailed instructions for the above steps?

\note Currently more manual steps are required

The further steps assume that you can now run

\verbatim 
>ssh myuser@mydebianpc "echo blub"
>ssh myuser@mywindowspc "echo blub"
\endverbatim

on the machine that you want to use to run the \c setup.py script. Replace the user and machine names with the ones
that you actually use.


\subsection CPFCreateConfigFile 4. Create a configuration file for your infrastructure

We now add a configuration file to our MyCPFMachines repository. The file contains information about our host machines
and which build-jobs we want to have on the CI server. Add a new file \c MyCPFMachines/MyConfig.json with the following
content:

#### MyConfig.json ####

\verbatim
{
  "CPFMachinesVersion": "0.0.0",
  "HostMachines": [
    {
      "MachineID": "MyMaster",
      "HostNameOrIP": "mydebianpc",
      "User": "myuser",
      "OSType": "Linux",
      "TemporaryDirectory": "/home/myuser/temp"
    },
    {
      "MachineID": "MyWindowsSlave",
      "HostNameOrIP": "mywindowspc",
      "User": "myuser",
      "OSType": "Windows",
      "TemporaryDirectory": "C:/temp"
    }
  ],
  "JenkinsConfig": {
    "UseUnconfiguredJenkins": true,
    "JenkinsAdminUser": "myuser",
    "JenkinsAdminUserPassword": "1234password",
    "CPFJobs": [
      {
        "JenkinsJobBasename": "MyCPFProject",
        "Repository": "ssh://myuser@mydebianpc:/home/myuser/repositories/MyCPFProject.git",
        "WebServerConfig": {
          "MachineID": "MyMaster",
          "HostHTMLShare": "/home/myuser/mycpfproject_html_share"
        }
      }
    ]
  },
  "JenkinsMasterHost": {
    "MachineID": "MyMaster",
    "HostJenkinsMasterShare": "/home/myuser/jenkins_home"
  },
  "JenkinsSlaves": [
    {
      "MachineID": "MyMaster",
      "Executors": "1"
    },
    {
      "MachineID": "MyWindowsSlave",
      "Executors": "1"
    }
  ],
  "RepositoryHost": {
    "MachineID": "MyMaster",
    "SSHDir": "/home/myuser/.ssh"
  }
}
\endverbatim

With this configuration you will get the jenkins master server, a jenkins linux agent and the web-server on the *mydebianpc* machine.
The *mywindowspc* will be used to run a jenkins windows agent. Jenkins will be configured to have one build job *MyCPFProject* that
will build your CPF project. You can get more information about the configuration file \ref CPFMachinesConfigFile "here".

\note Adding passwords for your accounts to the config file is optional. It may be saver to leave them out, but it comes with
the inconvenience that you have to re-enter them whenever you want to run the \c setup.py script. 

\todo Improve the setup script to allow the creation of an admin account on the first run.

\subsection CPFRunSetupScript 5. Run the setup.py script

We now have done all the manual preparations that are necessary to install the servers.

\verbatim 
>python -m CPFMachines.setup MySetup.json
\endverbatim

Running the script may take quite some time, as some of the required tools are freshly compiled when running the script.
If the script fails to run successfully, see if you can find the problem on the trouble shooting page \ref CPFMachinesProblems "here".


\subsection CPFAddCommitHooks 6. Add commit hooks to your repositories
*/
