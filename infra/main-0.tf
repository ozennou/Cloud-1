// VPC
resource "google_compute_network" "default" {
    name = "cloud-1-vpc"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
    name = "cloud-1-subnet"
    ip_cidr_range = "10.0.0.0/24"

    network = google_compute_network.default.self_link
}
// Disk for presistence
resource "google_compute_disk" "default" {
    name = "cloud-1-disk"
    type = "pd-standard"
    zone = var.zone
    size = 10
}

resource "google_compute_address" "default" {
    count = var.instances_count
    name = "cloud-1-ip-${count.index}"
}

// Instance
resource "google_compute_instance" "default" {
    count = var.instances_count
    name = "cloud-1-instance-${count.index}"
    machine_type = var.machine_type

    boot_disk {
        initialize_params {
            image = var.instance_image
            size = 10
        }
    }

    attached_disk {
        source = google_compute_disk.default.self_link
        device_name = "cloud-1-disk"
    }

    network_interface {
        network = google_compute_network.default.self_link
        subnetwork = google_compute_subnetwork.default.self_link
        access_config {
            nat_ip = google_compute_address.default[count.index].address
        }
    }

    metadata_startup_script = file("./scripts/startup.sh")

    provisioner "file" {
        source = "../srcs"
        destination = "/home/amine/srcs"
        connection {
            type = "ssh"
            user = "amine"
            private_key = file("./ssh_key")
            host = self.network_interface[0].access_config[0].nat_ip
        }
    }
    tags = ["ssh-access", "https-access"]

    lifecycle {
        create_before_destroy = true
    }
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.default.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] 
  target_tags    = ["ssh-access"]
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = google_compute_network.default.self_link

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"] 
    target_tags    = ["https-access"]
}