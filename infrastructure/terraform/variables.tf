variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-1"  # Singapore — closest to KL
}

variable "project_name" {
  description = "Project name"
  default     = "visit-kl"
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier eligible)"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI for ap-southeast-1"
  default     = "ami-0df7a207adb9748c7"  # Ubuntu 22.04 Singapore
}

variable "key_name" {
  description = "SSH Key Pair name (create in AWS Console)"
  default     = "visit-kl-key"
}
