provider "google" {
  credentials = file("../credentials/terraform-key.json")
  project     = "playground-190420"
  region      = "us-west1"
}

resource "google_compute_network" "vpc_network" {
  name = "virtualflow-network"
  project = "playground-190420"
}