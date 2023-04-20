# Usage
This is a folder to put the latest ODT in. ODT is delivered with a number of sample configuration files, but only setup.exe is necessary for the [Configurations](/ODT-Configurations/Configurations.md)

- Download the [latest ODT](https://www.microsoft.com/en-us/download/details.aspx?id=49117)
- Extract it as follows: `officedeploymenttool_*version*.exe /extract:c:\temp\ODT /quiet`
- Copy desired configuration file and the setup.exe file together in a folder
- Run `.\setup.exe /configure config.xml`
