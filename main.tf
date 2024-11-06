provider "aws" {
  region = "eu-central-1"  
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.48.0/20"  
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"  
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.64.0/20" 
  availability_zone = "eu-central-1b" 
  tags = {
    Name = "PrivateSubnet"
  }
}
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]  

  tags = {
    Name = "WebServerInstance"
  }
}



output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
