provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "your-project-id"
  region      = "us-central1"
}

resource "google_project" "my_project" {
  project_id = "your-project-id"
  name       = "My Terraform Project"
}

resource "google_storage_bucket" "my_bucket" {
  name     = "my-terraform-bucket"
  location = "US"
  project  = google_project.my_project.project_id
}

resource "google_compute_network" "my_vpc" {
  name                    = "my-terraform-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-terraform-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.my_vpc.self_link
  region        = "us-central1"
}
