output "wp_instance_public_ip" {
  value = aws_instance.my_public_instance.public_ip
}
output "ms_instance_private_ip" {
  value = aws_instance.my_private_instance.private_ip
}