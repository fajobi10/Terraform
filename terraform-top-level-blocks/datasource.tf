#date source to pull down availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami_ids" "ubuntu" {
  owners = ["amazon"]
}
# data "aws_key_pair" "tst-key" {
#   key_name           = "tst-key.pem"
#   include_public_key = true
# }