resource "yandex_compute_instance" "vm" {
  count = var.vm_count

  name        = "vm-${count.index + 1}"
  platform_id = "standard-v2"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd801iv1gjj2mbvjolim"  # ID образа Ubuntu 20.04
      size     = 60
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"  # Путь к id.pub указан через переменную
  }
}

# Сеть и подсеть
resource "yandex_vpc_network" "network" {
  name = "my-net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet-1a"
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.192.0/24"]
}
