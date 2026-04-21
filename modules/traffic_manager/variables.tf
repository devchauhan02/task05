variable "name" {
  type = string  
}
variable "rg_name" {
  type = string
}
variable "endpoints" {
  type = map(string)
}
variable "tags" {
  type = string
}