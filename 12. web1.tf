# EC2 인스턴스 생성 
resource "aws_instance" "user30-web1" {
  ami               	= var.amazon_linux
  availability_zone 	= "eu-west-3a"
  # 리전마다 지원되는 인스턴스 타입이 다르기 때문에 미리 확인 필요
  instance_type     	= "t2.nano"
  key_name          	= var.dev_keyname
  vpc_security_group_ids = [
    aws_security_group.user30-sg.id,
    aws_default_security_group.user30-default-sg.id
  ]

  subnet_id                   = aws_subnet.user30-subnet1.id
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
    Name = "user30-web1"
  }
}
