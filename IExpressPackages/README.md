# IExpress Packager for M365 Apps

The purpose of this folder is to automatically generate EXE script runners that can be given to users who want to install Office.
Note! User needs local admin rights to install Office using this tool.

## How to use
- You need IExpress - this is tool built into Windows
- Run the BatchCreateEXE.ps1 script - this will use the SED and LIC(ence) file for each package to generate an EXE with the same name

You can then give the appropriate EXE file to the user.