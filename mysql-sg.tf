resource "aws_security_group" "ec2_private_security_group" {
  name        = "mysql-sg"
  description = "Security Group allowing only public subnet instances"
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = ["${aws_security_group.ec2_public_security_group.id}"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}