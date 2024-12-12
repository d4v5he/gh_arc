resource "aws_instance" "main" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_group_ids
  user_data       = var.user_data
  key_name          = var.ssh_key_name

  tags = {
    Name = var.name
  }
}

output "instance_id" {
  value = aws_instance.main.id
}
