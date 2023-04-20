# ODT Configuration Scripts 
These are config.xml files for typical scenarios I often run into. 
Most of the scripts are set to:
- install a new Office client onto a bare computer from the cloud
- match any language packs already present on the computer
- install proofing tools for norwegian, british english and US english

## Usage
- Download the latest ODT and extract it as follows: `officedeploymenttool_*version*.exe /extract:c:\temp\ODT /quiet`
- Copy desired configuration file and the setup.exe file together in a folder
- Run `.\setup.exe /configure config.xml`

## Available configurations
See [Configurations](Configurations.md)

## What version and channel of Office am I currently on?
You can determine this by going to File >> Account, then looking at the right side coloumn of information. 
Under "About <OfficeApp>", you should see the version on the second row formatted as YYMM (Year Month), and the channel you are on the third line.
