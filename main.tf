terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  
}

// Definición de redes
resource "docker_network" "app_net" {
  name    = "app_net"
  driver  = "bridge"
}