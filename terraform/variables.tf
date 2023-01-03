
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "company_prefix" {
  description = "(Required) environment prefix"
  type        = string
}

variable "environment_prefix" {
  description = "(Required) environment prefix"
  type        = string
}

variable "location_prefix" {
  description = "(Required) location prefix"
  type        = string
}

variable "workload_postfix" {
  description = "(Required) workload postfix"
  type        = string
}

variable "location" {
  description = "(Required) Location to deploy the resources"
  type        = string
}

variable "tags" {
  description = "(Optional) Tags for categorization"
  type        = map(any)
  default     = {}
}

variable "vm_username" {
  description = "virtual machine local admin password"
  type        = string
  default  = "azureadmin"
}

variable "vm_password" {
  description = "virtual machine local admin password"
  type        = string
}

variable "customLocationId" {
  description = "Customer Location ID"
  type        = string
}

variable "localVnetID" {
  description = "local vnet ID"
  type        = string
}

variable "vm_name" {
  description = "HCI Virtual Machine Name"
  type        = string
}

variable "vm_cpu_cores" {
  description = "HCI Virtual Machine CPU Cores"
  type        = number
}

variable "vm_ram" {
  description = "HCI Virtual Machine RAM in GB"
  type        = number
}

variable "vm_os_type" {
  description = "HCI Virtual Machine OS type (Windows or Linux)"
  type        = string
}

variable "vm_os_image_reference" {
  description = "HCI Virtual Machine OS Image Reference"
  type        = string
}
