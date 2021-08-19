# AMI 이미지는 Region 마다 다르기 때문에, 해당 Region에서 제공하는 AMI 이미지 확인 필요
variable "amazon_linux" {
  	default = "ami-0d49cec198762b78c"
}

variable "dev_keyname" {
  	default = "user30-key1"
}
# Region 마다 ALB Account ID가 다르기 때문에 아래 링크에서 해당 Region ALB Account ID확인 필요
# https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html
variable "alb_account_id" {  
	default = "009996457667"
}
