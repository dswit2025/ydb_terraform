output "vm_external_ips" {
  description = "Внешние IP-адреса виртуальных машин"
  value       = yandex_compute_instance.vm[*].network_interface[0].nat_ip_address
}

output "vm_internal_ips" {
  description = "Внутренние IP-адреса виртуальных машин"
  value       = yandex_compute_instance.vm[*].network_interface[0].ip_address
}
