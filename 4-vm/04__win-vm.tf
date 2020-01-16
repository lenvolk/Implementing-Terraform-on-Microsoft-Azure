variable "windows_vms" {
  default = {
    vm1 = {
      suffix_name                       = "rds"                    #(Mandatory) suffix of the vm
      id                                = "1"                      #(Mandatory) Id of the VM
      storage_image_reference_offer     = "WindowsServer"          #(Optional)
      storage_image_reference_publisher = "MicrosoftWindowsServer" #(Optional)
      storage_image_reference_sku       = "2019-Datacenter"        #(Optional)
      storage_image_reference_version   = "Latest"                 #(Optional)
      storage_data_disks                = []                       #(Mandatory) For no data disks set []
      enable_ip_forwarding              = true                     #(Optional) 
      subnet_iteration                  = "1"                      #(Mandatory) Id of the Subnet
      zones                             = ["1"]                    #Availability Zone id, could be 1, 2 or 3, if you don't need to set it to "", WARNING you could not have Availabilitysets and AvailabilityZones
      vm_size                           = "Standard_DS1_v2"        #(Mandatory) 
      managed_disk_type                 = "Premium_LRS"            #(Mandatory) 
    }
  }
}
