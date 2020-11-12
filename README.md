# Welcome to PowerShell AutoPrint
###  Explanation
---
This is a **Windows PowerShell Script**  made in Jan. 2018 for the [KLINGELNBERG P26 Gear Measuring Centre](https://www.klingelnberg.com/en/business-divisions/precision-measuring-centers/precision-measuring-centers/detail-page/product/p-26/) located at Guelph, Eston Manufacturing. Klingelnberg is running under a virtual machine inside of Windows10, but this virtual machine does not support internet printer. It used to be a nightmare for the CMM operators to manually print each page of the inspection results. 

<img src="https://raw.githubusercontent.com/y5mei/Saved-Pictures/master/Klingberg.jpg" alt="P26" style="zoom:125%;" />

This **Start.ps1** script will keep monitoring a user defined resource folder, if any file is created, renamed or copied to that folder, PowerShell will call the default printer to print it out, and then move the file to the destination folder.

The **Start.ps1** script will keep monitoring the resource folder in the background as long the PowerShell ISE is running. Run the **End.ps1** script to terminate the monitoring without close the PowerShell ISE interface.

<img src="https://github.com/y5mei/Saved-Pictures/blob/master/KFlowChart.JPG" alt="P26" style="zoom:100%;" />

###  Usage
---

1. Setup the path to the resource folder (the folder to be monitored by PowerShell) in line 6 of Start.ps1 file.
	Here's an example:

```powershell
$resource = 'E:\Google Drive\Kligerberg\Demo\Source_Folder'
```
2. Setup the full path to the destination folder (where PowerShell is going to paste the files to) in line 8 of Start.ps1 file.
```powershell
$destination = 'E:\Google Drive\Kligerberg\Demo\Destination_Folder'
```


3. Start the PowerShell Script with PowerShell ISE and keep it running in the background.
4. If you decide to not monitoring the folder anymore, close the PowerShell ISE, or if you just want to temporarily stop the monitoring,  run the **End.ps1** script to stop the monition without getting out of the PowerShell ISE.

<img src="https://github.com/y5mei/Saved-Pictures/blob/master/powershellInstruction.gif" alt="ins" style="zoom:100%;" />

### How to active PowerShell on your computer
---
There are 4 ways you can active PowerShell on your computer:

1. To active PowerShell on you computer, you can do: win+R cmd -> PowerShell -> `Set-ExecutionPolicy RemoteSigned`
2. Or, at the beginning of you script, write down: `Set-ExecutionPolicy RemoteSigned`
3. Or, You can try and set the policy of the process itself: powershell.exe -`ExecutionPolicy bypass`
4. If your domain administrator hasn't forbidden it, you can do this:
`Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser`