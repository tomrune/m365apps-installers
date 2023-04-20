# Available configurations
Here is a list of the currently available configurations ***(per 20th april 2023)***

## ProPlus (Microsoft 365 E/A/G and M365 Apps for Enterprise)
* Beta x64 - installs Insider Beta channel 
  * _NOTE! Not supported by Microsoft - only for testing_ 
  * Formerly known as Insider Fast
  * No set interval for these releases

* Current Channel Preview x64 - previews of the Current Channel
  * Formerly known as Insider Slow
  * This is a supported version of Office
  * Typically available a couple weeks ahead of the next Current Channel
  * Released some time during the month

* Current Channel - Microsofts suggested release for M365 Business and Consumer subscriptions, and Enterprises that can deal with such frequent updates
  * Note! Only the current version is supported. Employees must ensure to update Office prior to be current on updates prior to filing support tickets.
  * Formerly known as Monthly
  * Contains the same features as the preceeding Current Channel Preview unless one of the features has an issue.

* Monthly Enterprise x64
  * Recommended for most employees in most companies, an (IMHO) reasonable medium between new features, quality of these features and predictable release cycle for IT. Current and previous versions are supported. 
    * Note! Using the M365 Admin portal, it is possible to force a rollback of Office to a previous version
  * Follows patch tuesday - only released on the second tuesday of the month
  * Has no former name as it is a fairly recent offering
  * While current channel can give a prediction of upcoming features, it is best to use the release notes. There is no Preview version for this edition. 

* Semi Annual Preview x*NN* - aka SAC-P, preview for Semi Annual
  * This version should be used by some employees in organisations that utilise Semi Annual channel to test the upcoming version.
    * New release every march or september, current and previous two is supported
  * Use release notes to know what is coming. 
   * **Typically controlled with management software like Config Manager.**

* Semi Annual Enterprise - SAC or SAEC
  * Recommended for computers in production where other tools, addins or automation interacts with Office and testing can be complicated
  * Use the SAC Preview to prepare for and file support requests.
  * Updates every july (with announced march SAC-P features) and december (with september SAC-P features). Current and last two versions supported.
  * **Typically controlled with management software like Config Manager.**

## Business
* Business Premium 64 - the Office version included in M365 Business Standard, M365 Business Premium and the stand alone M365 Apps for Business plans. 
  * Uses Current Channel and x64 edition. 

## Project & Visio
* ProjectPro64-MatchInstalled - this will install the subscription edition of Project Pro (part of P3/P5 offerings)
  * Matches the language packs and channel of the prior installed M365 suite on the machine. 
  * **Note! Requires M365 ProPlus to be installed already.**

* VisioPro64-MatchInstalled - this will install the subscription edition of Visio Pro (part of Visio P2 offering)
  * Matches the language packs and channel of the prior installed M365 suite on the machine. 
  * **Note! Requires M365 ProPlus to be installed already.**

## Long Term Servicing Channel
* VL - LTSC2019x64 - installs the 2019 Volume Licence version *(unmodified sample script from ODT)*
* VL - LTSC2021x64 - installs the 2021 Volume Licence version *(unmodified sample script from ODT)*
