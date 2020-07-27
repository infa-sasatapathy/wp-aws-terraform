resource "aws_instance" "my_private_instance" {
  ami                    = "ami-0732b62d310b80e97"
  instance_type          = "t2.micro"
  key_name               = "mykey"
  subnet_id              = var.private_subnet_1_id
  vpc_security_group_ids = [aws_security_group.ec2_private_security_group.id]
  private_ip             = "192.168.4.5"
  user_data              = <<EOF
    #!/bin/bash
    sudo yum update -y
    wget https://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
    sudo yum install mysql-community-release-el7-5.noarch.rpm -y
    sudo yum install mysql-server -y
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    mysql -uroot <<MYSQL_SCRIPT
    CREATE DATABASE wordpress;
    CREATE USER 'wordpress'@'%' IDENTIFIED BY '12345';
    GRANT ALL ON wordpress.* TO wordpress@'%' IDENTIFIED BY '12345';
    MYSQL_SCRIPT
    EOF
  tags = {
    Name = "MySQL"
  }
}