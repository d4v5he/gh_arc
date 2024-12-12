variable "ami" {
  default = "ami-0453ec754f44f9a4a"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ssh_key_name" {
  type    = string
  default = "vockey"
}

variable "sg_map" {
  default = {
        "GitHub_Runner" = {
            extra_ports = [ 443 ]
        },
        "K8S_Cluster" = {
          extra_ports = [ 443 ]
        }
    }
}

variable "ec2_map" {
  default = {
        "GitHub_Runner" = {
          user_data = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install -y libicu
            mkdir actions-runner && cd actions-runner
            curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz
            tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz
            ./config.sh --url https://github.com/d4v5he/gh_arc --token BH74YWJSS3MLW5CZ47S5X6LHLN5R4 --unattended --replace
            sudo ./svc.sh install
            sudo ./svc.sh start
          EOF
        },
        "K8S_Cluster" = {}
    }
}
