terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "file1" {
  content  = "This is file 1"
  filename = "${path.module}/output/file1.txt"
}

resource "local_file" "file2" {
  content  = "This is file 2"
  filename = "${path.module}/output/file2.txt"
}

resource "null_resource" "dir1" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/output/dir1"
  }
}

resource "null_resource" "dir2" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/output/dir2"
  }
}

