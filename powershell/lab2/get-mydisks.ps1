function get-mydisks {
get-physicalDisk | format-list Manufacturer, Model, SerialNumber, FirmwareVersion, Size
}

get-mydisks