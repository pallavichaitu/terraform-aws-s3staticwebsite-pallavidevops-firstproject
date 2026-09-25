resource "aws_s3_bucket" "website" {
  bucket = "pallavi-terraform-website1307"

  tags = {
    Name        = "Terraform Website Bucket"
    Environment = "Dev"
    Project     = "AWS S3 website"
  }
}

resource "aws_s3_bucket_versioning" "website" {
  bucket = aws_s3_bucket.website.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}
