terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2"
    }
  }
}

variable "file_content" {
  description = "Content for the PoC file."
  type        = string
  default     = "Hello World!"
}

resource "local_file" "poc_file" {
  content  = var.file_content
  filename = "${path.module}/terrakube-proof.txt"
}

output "file_path" {
  value = abspath(local_file.poc_file.filename)
}
