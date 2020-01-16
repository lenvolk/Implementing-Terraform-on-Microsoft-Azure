variable "Lbs" {
  default = {
    lb1 = {
      id               = "1"      #Id of the load balancer use as a suffix of the load balancer name
      suffix_name      = "demovm" #It must equals the Vm suffix_name
      subnet_iteration = "0"      #Id of the Subnet
      static_ip        = "10.0.128.5"
    }
  }
}

variable "LbRules" {
  default = {
    lbrules1 = {
      Id                = "1"      #Id of a the rule within the Load Balancer 
      lb_key            = "lb1"    #Id of the Load Balancer
      suffix_name       = "demovm" #It must equals the Lbs suffix_name
      lb_port           = "22"
      probe_port        = "22"
      backend_port      = "22"
      probe_protocol    = "Tcp"
      request_path      = "/"
      load_distribution = "SourceIPProtocol"
    }
  }
}