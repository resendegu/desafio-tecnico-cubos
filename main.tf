# Set the required provider (Docker)
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# Configure the docker provider
provider "docker" {
    host = "npipe:////./pipe/docker_engine"
}

# Docker images
resource "docker_image" "frontend" {
  name         = "frontend-desafio:latest"
  keep_locally = true
}

resource "docker_image" "backend" {
  name         = "backend-desafio:latest"
  keep_locally = true
}

resource "docker_image" "db_sql" {
  name         = "db_sql:latest"
  keep_locally = true
}

# Create a docker network for frontend
resource "docker_network" "frontend" {
  name = "frontend-network"
}

# Create a docker network for backend
resource "docker_network" "backend" {
  name = "backend-network"
}

# Container for backend
resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend.image_id
  hostname = "backend"

  networks_advanced {
    name = docker_network.backend.name
  }

}

# Container for frontend
resource "docker_container" "nginx-frontend" {
  name    = "nginx-frontend"
  image   = docker_image.frontend.image_id
  hostname = "frontend"

  networks_advanced {
    name = docker_network.backend.name
  }

  ports {
    external = 80
    internal = 80
  }

}

# Container for database in the same network as backend
resource "docker_container" "database" {
  name  = "database"
  image = docker_image.db_sql.image_id
  hostname = "database"

  networks_advanced {
    name = docker_network.backend.name
  }
}