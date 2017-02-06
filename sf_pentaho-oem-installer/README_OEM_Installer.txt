		2017-13-05 Christopher Morehouse

*********************************PREREQUISITE*****************************************
*You need to create the pentaho unix user that will be running the BA Server process.*
*You need to log in as this user in order to complete the steps below                *
**************************************************************************************

This installer is used to automate the installation of the archive installer for BA Server only. DI Server has not been scripted yet at the time of this writing.
If installing on a single server, each step of the process has a folder prefix numbered 1-7. You can follow this sequence to install each component for BA Server on
a single box. For installs that require the database to be on a separate server, you can run folders 1 and 2 separately on another box, or if an existing BA Server 
install needs to download plugins or license files, you can run those scripts separately as well.

Each section is explained in detail as follows:

1_install_database
At the time of this writing, this folder only has a script to automatically download and install postgres for Ubuntu. Scripts for other databases and OS types can be added at a later time.
To run, execute InstallPostgres.sh. Postgres will be downloaded, extracted, and installed to /usr/local/postgresql-9.4.1.
*NOTE* This script will also create a linux postgres user that will run the postgres process. You will be promted through the installation to create a password for this linux user as
well as a password for the postgres superuser.

2_install_database_tables
At the time of this writing, this folder only has a script to execute the DDL for the BA Server repository for postgres. Additional folders exist for future scripts for Oracle and MySQL.
To run, execute executeAllScripts.sh.
*NOTE* You will be prompted for the "postgres" user password as well as the "pentaho_user" postgres user. The postgres user password is need to log on to the database, and the "pentaho_user" 
password is needed to connect to the quartz database to create tables. By default the password for "pentaho_user" is "password" (without quotes).

3_install_java
To run, execute installJRE7u79.sh. This will download, extract, and install Sun JRE 7 update79 to /usr/lib/jvm/jre1.7.0_79. Additional scripts can be added for future versions of Java.

4_install_ba_server
The installServer521.sh script is configured to download BA Server 5.2.1. Additional scripts can be added for other versions of BA Server. To download BA Server, the script accesses 
box.com via ftp. You will be prompted for your box.com username and password. Upon download, the script will execute the archive installer which will prompt you to enter a folder path where
the installation will reside.

5_configure_pentaho_server_with_repository
Before running, you will need to edit the ConnectionInfo.properties file to configure the location of the pentaho-solutions and tomcat folders within the BA installation completed in step 4.
You will also need to supply the usernames and passwords for the postgres users used for the hibernate, jackrabbit, and quartz tables within the repository. Default values have already been 
preconfigured here. Once ConnectionInfo.properties has been configured, run StartRepositoryConfiguration.sh. A separate README file is located here for further details on this script.

6_install_plugins
This script downloads and installs all plugins for BA Server 5.2.1. Additional scripts can be created for other versions of BA Server. Since the plugins are downloaded from box.com's ftp site,
you will be prompted for your box.com username and password. Once downloaded and extracted, the script will start the installer for each plugin. You will be prompted for the installation path, 
please use the path to the pentaho-solutions/system folder.

7_install_licenses
This script downloads, extracts, and installs the latest developer licenses from box.com. You will be prompted for you box.com username and password as well as the folder path to
the license-installer.
