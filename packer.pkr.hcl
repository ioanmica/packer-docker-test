packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  post-processor "docker-tag" {
    repository = "gcr.io/micamedic/learn-packer"
    tags       = ["packer-rocks"]
    only       = ["docker.ubuntu"]
  }

  post-processor "docker-push" {
    login = true
    login_server = "https://gcr.io/"
    login_username = "${var.username}"
    login_password = "${var.password}"
  }

}
