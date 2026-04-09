resource "google_compute_network" "c" {
  project                 ="925810350503"
  name                    = "workstation-cluster"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "c" {
   project      = "925810350503"
  name          = "workstation-cluster"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.c.name
}

resource "google_workstations_workstation_cluster" "c" {
  project                = "925810350503"
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

resource "google_workstations_workstation_config" "c" {
   project               = "925810350503"
  workstation_config_id  = "workstation-config"
  workstation_cluster_id = google_workstations_workstation_cluster.c.workstation_cluster_id
  location                    = "us-central1"

  host {
    gce_instance {
      machine_type                = "e2-standard-4"
      boot_disk_size_gb           = 35
      disable_public_ip_addresses = true
    }
  }
}

resource "google_workstations_workstation" "c" {
   project               = "925810350503"
  workstation_id         = "work-station"
  workstation_config_id  = google_workstations_workstation_config.c.workstation_config_id
  workstation_cluster_id = google_workstations_workstation_cluster.c.workstation_cluster_id
  location                    = "us-central1"

  labels = {
    "label" = "key"
  }

  env = {
    name = "foo"
  }

  annotations = {
    label-one = "value-one"
  }
}