# ssh-keygen을 통해 RSA Key쌍을 생성
# RSA키를 생성한 리눅스 계정의 ~/.ssh 폴더 밑에 id_rsa(개인키,private key) id_rsa.pub(공개키,public key) 생성 됨
# id_rsa.pub 키가 EC2인스턴스의 ~/.ssh/authorized_keys 파일에 복사가 됨
# 접속 방벙은 
# ssh -i ~/.ssh/id_rsa 계정@서버IP 

resource "aws_key_pair" "user30_keyname" {
  key_name   = "user30-key1"
  # id_rsa.pub 파일 내용을 줄바꿈 없이 아래에 복사해서 붙여넣으면 됨
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0og4yAPxsln4v7jlQFGegb1VaYdBJKZokIOQSgl9xZEdWTSCcQNVbBFt2EQrfBGstq0LLrg4NySoz04DqCKJ1eullrQyhYwa8cygcVYCY+2sWLPk9Jn7lEZnvZ1rbtnwWnfS8QOpF9SPQZtyslyyTk47Znf7Mkhdx5uc26cgeU72vpCU6gfVxoLeubclxOI23k02kJshopuMrG3mA0nNOcDAdruCidhEv0/e1Il2fF8mCxEFPMbpQnv6UBQFPXZ4huIVzi9Kt4xoR5lfyWucEmmIRd3UUa4BfxlWLogQsv07Gl4rPTx7Njj2IZXml1pU3HEKCpoLlP4uJ2sRN+ZKF ec2-user@ip-172-31-26-147.eu-west-3.compute.internal"
}
