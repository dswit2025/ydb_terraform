variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
#  default     = env("YC_CLOUD_ID")  # Читаем из переменной окружения
}

variable "folder_id" {
  description = "ID каталога (folder) в облаке"
  type        = string
#  default     = env("YC_FOLDER_ID")  # Читаем из переменной окружения
}

variable "zone" {
  description = "Зона доступности (например, ru-central1-a)"
  type        = string
  default     = "ru-central1-a"
}

variable "iam_token" {
  description = "IAM-токен для аутентификации в Yandex Cloud"
  type        = string
  sensitive   = true  # Чтобы не логировать в выводе
#  default     = env("YC_TOKEN")  # Читаем из переменной окружения
}

# Дополнительные переменные для VM
variable "vm_count" {
  description = "Количество виртуальных машин"
  type        = number
  default     = 3
}

variable "ssh_key_path" {
  description = "Путь к файлу публичного SSH-ключа (id.pub)"
  type        = string
}
