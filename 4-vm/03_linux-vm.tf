variable "linux_vms" {
  default = {
    vm1 = {
      suffix_name          = "nva"             #(Mandatory) suffix of the vm
      id                   = "1"               #(Mandatory) Id of the VM
      storage_data_disks   = []                #(Mandatory) For no data disks set []
      subnet_iteration     = "1"               #(Mandatory) Id of the Subnet
      zones                = ["1"]             #Availability Zone id, could be 1, 2 or 3, if you don't need to set it to null or delete the line
      vm_size              = "Standard_DS1_v2" #(Mandatory) 
      managed_disk_type    = "Premium_LRS"     #(Mandatory) 
      enable_ip_forwarding = true              #(Optional)
    }

    vm2 = {
      suffix_name = "ssh" #(Mandatory) suffix of the vm
      id          = "1"   #(Mandatory)Id of the VM
      storage_data_disks = [
        {
          id                = "1" #Disk id
          lun               = "0"
          disk_size_gb      = "32"
          managed_disk_type = "Premium_LRS"
          caching           = "ReadWrite"
          create_option     = "Empty"
        },
      ]                                                        #(Mandatory) For no data disks set []
      internal_lb_iteration         = "0"                      #(Optional) Id of the Internal Load Balancer, set to null or delete the line if there is no Load Balancer
      public_lb_iteration           = null                     #(Optional) Id of the public Load Balancer, set to null or delete the line if there is no public Load Balancer
      public_ip_iteration           = null                     #(Optional) Id of the public Ip, set to null if there is no public Ip
      subnet_iteration              = "0"                      #(Mandatory) Id of the Subnet
      zones                         = ["1"]                    #(Optional) Availability Zone id, could be 1, 2 or 3, if you don't need to set it to "", WARNING you could not have Availabilitysets and AvailabilityZones
      security_group_iteration      = null                     #(Optional) Id of the Network Security Group, set to null if there is no Network Security Groups
      static_ip                     = "10.0.128.4"             #(Optional) Set null to get dynamic IP or delete this line
      enable_accelerated_networking = false                    #(Optional) 
      enable_ip_forwarding          = false                    #(Optional) 
      vm_size                       = "Standard_DS1_v2"        #(Mandatory) 
      managed_disk_type             = "Premium_LRS"            #(Mandatory) 
      backup_policy_name            = "BackupPolicy-Schedule1" #(Optional) Set null to disable backup (WARNING, this will delete previous backup) otherwise set a backup policy like BackupPolicy-Schedule1
    }
  }
}