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

// Definición de redes (app_net, peristence_net, mentor_net)
resource "docker_network" "app_net" {
  name    = "app_net"
  driver  = "bridge"
}

resource "docker_network" "peristence_net" {
  name    = "peristence_net"
  driver  = "bridge"
}

resource "docker_network" "mentor_net" {
  name    = "mentor_net"
  driver  = "bridge"
}