
output "public_ipv4" {
  value = aws_instance.web.public_ip
}