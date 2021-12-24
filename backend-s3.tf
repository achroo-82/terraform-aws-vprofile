# resource "aws_s3_bucket" "bkt" {
#   bucket = var.BUCKET_NAME
#   acl    = "private"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
#   force_destroy = true
# }

# resource "aws_s3_bucket_object" "s3_folder" {
#   bucket = var.BUCKET_NAME
#   acl    = "private"
#   key    = var.FOLDER_NAME1
# }

resource "aws_s3_bucket_object" "s3_key" {
  bucket = var.BUCKET_NAME
  acl    = "private"
  key    = "vprofilekey"
  source = "vprofilekey"
}

resource "aws_s3_bucket_object" "s3_key1" {
  bucket = var.BUCKET_NAME
  acl    = "private"
  key    = "vprofilekey.pub"
  source = "vprofilekey.pub"
}

terraform {
  backend "s3" {
    bucket = "achroo"
    key    = "terraform/backend"
    region = "ap-south-1"
  }
}