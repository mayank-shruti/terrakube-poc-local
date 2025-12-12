terraform {
  required_version = ">= 1.5.0"
}

# No provider needed for this PoC – pure local resources

resource "test_resource" "demo" {
  triggers = {
    message = "Hello from Terrakube PoC!"
  }
}

output "poc_message" {
  value = test_resource.demo.triggers.message
}

