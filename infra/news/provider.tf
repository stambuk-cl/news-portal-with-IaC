# Setup our GCP provider
variable "region" {
  default = "us-central1"
}

variable "project" {
  default = "gcp-news-portal"
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = "/Users/stambuk-cl/Downloads/joi-news-gcp-candidate-latest/infra/news/gcps.json"
}

terraform {
  backend "gcs" {
    bucket      = "gcp-news-portal"
    prefix      = "news"
    credentials = "/Users/stambuk-cl/Downloads/joi-news-gcp-candidate-latest/infra/news/gcp.json"
  }
}
