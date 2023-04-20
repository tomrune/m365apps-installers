## Registry hacks

This folder contains an assortment of registry files that change Office behavior:
* M365Apps-EnableLocalChannelSwitch-button.reg - enables a button under File > Account where the user can change the Office channel on their PC.
* ClassicUI.reg - switches off the new "Fluent UI" look for Office by deleting the registry keys that enabled them (derived from a clean install of Office with fluent update off, these registry keys are not set - tested and them not being present does indeed turn off the new look) - restart running Office apps to make this take effect
* FluientUI.reg - switches on the new "Fluent UI" look for Office by setting the same registry keys that the "Coming soon" toggle sets. Remember to restart Office after setting this option.
