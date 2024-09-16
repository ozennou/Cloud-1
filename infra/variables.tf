// should remove the default values 

variable "credentials_file" {
    description = "Path to the Google Cloud credentials file"
    type        = string
    default     = "./credentials.json"
}

variable "project_id" {
    description = "The Google Cloud project ID"
    type        = string
    default     = "inspiring-lore-430020-e2"
}

variable "region" {
    description = "The Google Cloud region"
    type        = string
    default     = "us-central1"
}

variable "zone" {
    description = "The Google Cloud zone"
    type        = string
    default     = "us-central1-a"
}

variable "instance_image" {
    description = "The image to use for the instance"
    type        = string
    default     = "debian-11-bullseye-v20240815"
}

variable "machine_type" {
    description = "The machine type to use for the instance"
    type        = string
    default     = "e2-standard-2"
}

variable "instances_count" {
    description = "The number of instances to create"
    type        = number
    default     = 1
}