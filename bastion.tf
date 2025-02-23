resource "aws_security_group" "bastion_sg" {
  name        = "bastion"
  description = "Allow to communicate with Bastion using SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow all SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "bastion_key_pair" {
  key_name   = "bastion_key_pair"
  public_key = file(var.key_pair_settings.bastion.public_key_path)
}

resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_settings.bastion.instance_type
  subnet_id              = aws_subnet.public_subnets[0].id
  key_name               = aws_key_pair.bastion_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
}

resource "aws_eip" "bastion_eip" {
  domain     = "vpc"
  instance   = aws_instance.bastion.id
  depends_on = [aws_internet_gateway.main]
}
