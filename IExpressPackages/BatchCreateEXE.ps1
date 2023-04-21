## Script that generates EXE files for Office
# The script handles the limitation of IExpress not working properly with local folders 

# Health check - do we have PSINI installed?
Write-Progress -Activity "Build EXE files" -Status "Determines if PSINI is installed" -Id 1 -PercentComplete 5
if((Get-Module PSINI) -eq $null) {Write-Error "Missing PSINI - Please install it"; break}

# If health check passed, we can cleanup old temp files
Remove-Item $PSScriptRoot\*.CAB -Force
Remove-Item $PSScriptRoot\*.DDF -Force
Remove-Item $PSScriptRoot\*.INF -Force
# Remove old EXE Files
Remove-Item $PSScriptRoot\*.EXE -Force

# Resolves local enviroment paths
Write-Progress -Activity "Build EXE files" -Status "Determines local paths" -Id 1 -PercentComplete 10
$SEDFilesToProcess = Get-ChildItem "$PSScriptRoot\*.SED" # All the SED-files in the folder
$SEDFolder = (Resolve-Path "$PSScriptRoot").Path # Path to this folder
$ODTFolder = (Resolve-Path "$PSScriptRoot\..\ODT").Path # Path to ODT folder for setup.exe
$ODTConfigFolder = (Resolve-Path "$PSScriptRoot\..\ODT-Configurations").Path # Path to ODT Configs for XML file (folder name must match SED file name)

# Give some feedback on the way
Write-Progress -Activity "Build EXE files" -Status "Updates SED Files with proper paths" -Id 1 -PercentComplete 25
$SEDprogress = 1
$EXEProgress = 0

# Let's update the SED files with what we know
foreach($sedFile in $SEDFilesToProcess) {
    # Show where we are
    $FilesToProcess = $SEDFilesToProcess.Count
    $sedName = $sedFile.BaseName # This is the name of the SED file without file extention
    Write-Host "Processing $sedName.sed - $SEDprogress / $FilesToProcess"

    # Prepare SED for processing
    $sedConfigFolder = "$ODTConfigFolder\$sedName" # Name of folder containing XML file
    $tempSEDObject = Get-IniContent $sedFile # Read the SED file into an object for manipulation
    # Build an array where we set the paths
    $newSedPaths = @{
        'SourceFiles0' = "$ODTFolder\"
        'SourceFiles1' = "$SEDFolder\"
        'SourceFiles2' = "$sedConfigFolder\"
    }
    # Write the updated settings into the SED file
    Set-IniContent -InputObject $tempSEDObject -NameValuePairs $newSedPaths -Sections "SourceFiles" | Out-IniFile -FilePath $sedFile -Force
    
    # Progress to next
    $SEDprogress++
    if($CurrentProgress -gt 50) {Write-Progress -Activity "Build EXE files" -Status "Updates SED Files with proper paths" -Id 1 -PercentComplete 40}
}

## Let's make those EXE files now that the SED Files point to the correct folders
# We run Iexpress in automatic build mode so you can see the progress.
Write-Progress -Activity "Build EXE files" -Status "Compiling EXE files" -Id 1 -PercentComplete 50
foreach($sedFile in $SEDFilesToProcess) {
    # Show where we are
    $sedName = $sedFile.BaseName # Name of SED file without extension
    $CurrentProgress = [Math]::Round((($EXEprogress *100) / $SEDFilesToProcess.Count))
    Write-Progress -Activity "Compiling EXE files $CurrentProgress %" -Status "Compiling $sedName" -Id 2 -ParentId 1 -PercentComplete $CurrentProgress
        
    # Make sure that we compile only one SED at the time to avoid race conditions and to make it easier to track errors
    Start-Process -Filepath "$env:windir\system32\iexpress.exe" -ArgumentList "/N $sedFile -Encoding ASCII" -Wait

    # Update progress indicator
    $EXEprogress++
    if($CurrentProgress -gt 50) {Write-Progress -Activity "Build EXE files" -Status "Compiling EXE files" -Id 1 -PercentComplete 75}
}
# Cleanup those progress bars
Write-Progress -Activity "Compiling EXE files" -Status "Done" -Id 2 -ParentId 1 -Completed
Write-Progress -Activity "Build EXE files" -Status "Compiling EXE files" -Id 1 -Completed

# END
