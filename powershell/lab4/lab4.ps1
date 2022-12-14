function get-hardwareinfo {
Write-Host "System hardware information:"
get-CimInstance -ClassName win32_computersystem | Format-List
}

function get-osinfo {
Write-Host "OS description:"
get-ciminstance win32_operatingsystem | select Name,Version | format-list
}

function get-CPU {
Write-Host "Processor Information:"
	get-ciminstance win32_processor | select Description,NumberOfCores,MaxClockSpeed,L2CacheSize,L3CacheSize | format-list
}


function get-raminf {
Write-Host "RAM infomation:"
	get-ciminstance win32_physicalmemory | select BankLabel,Description,DeviceLocator,Capacity,Manufacturer | format-table
}

function get-mydisks {
Write-Host "Physical drive infomation:"
Get-WmiObject -classname Win32_DiskDrive |
where-object DeviceID -ne $NULL |
Foreach-Object {
                $drive = $_
                $drive.GetRelated("Win32_DiskPartition") |
                foreach {$logicaldisk =$_.GetRelated("win32_LogicalDisk");
                        if($logicaldisk.size) {
                                New-Object -TypeName PSobject -Property @{
                                    Manufacturer = $drive.Manufacturer
                                    DriveLetter = $logicaldisk.DeviceID
                                    Model = $drive.model
                                    Size = [String]($logicaldisk.size/1gb -as [int])+"GB"
                                    Free = [string]((($logicaldisk.freespace / $logicaldisk.size) * 100) -as [int])+ "%"
                                    FreeSpace = [string]($logicaldisk.freespace / 1gb -as [int]) +"GB"
                                        }|
                                            Format-Table -AutoSize Manufacturer, Model, size, Free, FreeSpace
                                }
                         }
                 }
            }

function get-networks {
Write-Host "Network information:"
	get-ciminstance win32_networkadapterconfiguration | where {$_.IPEnabled -eq 'true'} | select Description,Index,IPAddress,IPSubnet,DNSDomain,DNSServerSearchOrder | ft
}


function get-gpu {
Write-Host "GPU Information:"
$H=(get-wmiobject -class win32_videocontroller).CurrentHorizontalResolution -as [string]
$V=(get-wmiobject -class Win32_Videocontroller).CurrentVerticalResolution -as [string]
$Bit=(get-wmiobject -class Win32_Videocontroller).CurrentBitsperPixel -as [string]
$sum= $H + " x " + $V + " and " + $Bit + "bit"
get-wmiobject -class win32_videocontroller |
Format-List @{n="Video Card Vendor"; e={$_.AdapterCompatibility}}, Description, @{n="Resolution"; e={$sum -as [string]}}
}

get-hardwareinfo
get-osinfo
get-CPU
get-raminf
get-mydisks
get-networks
get-gpu
