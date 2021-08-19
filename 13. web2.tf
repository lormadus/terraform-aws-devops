# 부하 분산을 위해 두번째 EC2 인스턴스는 첫번째와 다른 가용영역 및 서브넷에 생성
resource "aws_instance" "user30-web2" {
  ami               	= var.amazon_linux
  availability_zone 	= "eu-west-3b"
  instance_type     	= "t2.nano"
  key_name          	= var.dev_keyname
  vpc_security_group_ids = [
    aws_security_group.user30-sg.id,
    aws_default_security_group.user30-default-sg.id
  ]

  subnet_id                   = aws_subnet.user30-subnet2.id
  associate_public_ip_address = true

user_data = <<USER_DATA
#!/bin/bash
yum -y update
yum install -y ruby
yum install -y aws-cli
cd /home/ec2-user
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
./install auto
USER_DATA

  tags = {
    Name = "user30-web2"
  }
}
