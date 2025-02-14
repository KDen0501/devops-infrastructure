provider "yandex" {
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  oauth_token = var.oauth_token
}

resource "yandex_compute_instance" "master" {
  name = "master"
  zone = "ru-central1-a"
  resources {
    memory = 4
    cores = 2
    core_fraction = 100
  }
  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
    }
  }
}

resource "yandex_compute_instance" "app" {
  name = "app"
  zone = "ru-central1-a"
  resources {
    memory = 4
    cores = 2
    core_fraction = 100
  }
  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
    }
  }
}

resource "yandex_compute_instance" "srv" {
  name = "srv"
  zone = "ru-central1-a"
  resources {
    memory = 2
    cores = 2
    core_fraction = 100
  }
  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
    }
  }
}