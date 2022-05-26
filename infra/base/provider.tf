# Setup our GCP provider
variable "region" {
  default = "us-central1"
}

variable "project" {
  default = "" ##default parameter
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = "../.gcp.json"
}

terraform {
  backend "gcs" {
    prefix      = "base"
    credentials = "../.gcp.json"
  }
}

##Colocar versiones de TF