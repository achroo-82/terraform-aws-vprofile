resource "aws_s3_bucket" "bkt" {
  bucket = var.BUCKET_NAME
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  force_destroy = true
}

resource "aws_s3_bucket_object" "s3_folder" {
  bucket = aws_s3_bucket.bkt.id
  acl    = "private"
  key    = var.FOLDER_NAME1
}

terraform {
  backend "s3" {
    bucket = "achroo"
    key    = "terraform/backend"
    region = "ap-south-1"
  }
}

resource "aws_s3_bucket_object" "s3_key" {
  for_each = fileset("vprofilekey", "vprofilekey.pub")
  bucket   = aws_s3_bucket.bkt.id
  acl      = "private"
  key      = var.FOLDER_NAME2
  source   = "${aws_s3_bucket.bkt.bucket}/${var.FOLDER_NAME2}/${each.value}"
}
