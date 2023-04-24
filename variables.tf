variable "my_prefix" {
  description = "Prefix to add to the resources name"
  type = string
  default = "afe-tf-"
}

variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key"
  type = string
  default = "<your Confluent Cloud API Key>"
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type = string
  default = "<your Confluent Cloud API Secret>"
}
