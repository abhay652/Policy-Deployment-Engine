resource "google_workstations_workstation_cluster" "c" {
  project                 ="925810350503"
  workstation_cluster_id = "workstation-cluster"
  network                = google_compute_network.c.id
  subnetwork             = google_compute_subnetwork.c.id
  location               = "us-central1"

  labels = {
    "label" = "key"
  }

  annotations = {
    label-one = "value-one"
  }
}



resource "google_compute_network" "c" {
  project                 ="925810350503"
  name                    = "workstation-cluster"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "c" {
  project                 ="925810350503"
  name          = "workstation-cluster"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.c.name
}