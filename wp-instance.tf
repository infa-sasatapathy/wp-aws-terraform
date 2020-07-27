resource "aws_instance" "my_public_instance" {
  ami                         = "ami-0732b62d310b80e97"
  instance_type               = "t2.micro"
  key_name                    = "mykey"
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2_public_security_group.id]
  private_ip                  = "192.168.1.5"
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("mykey")
    host        = aws_instance.my_public_instance.public_ip
  }
  provisioner "file" {
    source      = "mykey"
    destination = "/home/ec2-user/mykey"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 0400 /home/ec2-user/mykey",
    ]
  }
  provisioner "file" {
    source      = "wordpress.sh"
    destination = "/home/ec2-user/wordpress.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x wordpress.sh",
      "./wordpress.sh",
    ]
  }
  tags = {
    Name = "WordPress"
  }
}