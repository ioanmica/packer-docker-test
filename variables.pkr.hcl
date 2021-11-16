variable "username" {
  type =  string
  default = "myusername"  
}

variable "password" {
  type =  string
  default = "mypassword"
  // Sensitive vars are hidden from output as of Packer v1.6.5
  //sensitive = true
}