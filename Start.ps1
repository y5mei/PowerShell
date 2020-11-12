#Set-ExecutionPolicy RemoteSigned

# Set up the Resource Folder, Filter, and the Destination Folder
# the Source Folder is the folder where this script is going to monit for any file creation action
# the Destination Folder is the folder where to archive the file after printed by the default printer
$resource = 'E:\Google Drive\Kligerberg Suggetstion Auto Print\Demo\Source_Folder'
$filter = '*.*'                             # <-- set filter according to your requirements
$destination = 'E:\Google Drive\Kligerberg Suggetstion Auto Print\Demo\Destination_Folder'


# The Code block here will listen to any FileSystem actions
$fsw = New-Object IO.FileSystemWatcher $resource, $filter -Property @{
 IncludeSubdirectories = $false              # <-- set this according to your requirements
 NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'
}

# If any file was created, powershell will call the default printer to print it out and then sleep for 10 secs. 
$onCreated = Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action {
 $path = $Event.SourceEventArgs.FullPath
 $name = $Event.SourceEventArgs.Name
 $changeType = $Event.SourceEventArgs.ChangeType
 $timeStamp = $Event.TimeGenerated
 Write-Host "The file '$name' was $changeType at $timeStamp, and the file name is $path"
 Start-Process -FilePath $path -Verb Print -PassThru | %{sleep 10;$_} | kill
 Move-Item $path -Destination $destination -Force -Verbose # Force to overwrite files with same name
 
}

