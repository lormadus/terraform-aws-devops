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
yum install httpd -y
/bin/systemctl restart httpd.service
rm -f /var/www/html/index.html  ## index.html 존재 시 배포 중 에러 발생 가능.


cd /home/ec2-user
wget https://aws-codedeploy-eu-west-3.s3.amazonaws.com/latest/codedeploy-agent.noarch.rpm
yum -y install codedeploy-agent.noarch.rpm
service codedeploy-agent stop
service codedeploy-agent start
USER_DATA

  tags = {
    Name = "user30-web2"
  }
}
