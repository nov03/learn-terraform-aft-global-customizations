data "aws_s3_bucket" "buckets" {
  bucket = "aftasdfasdf-sandbox-381793927414"
}

resource "aws_s3_bucket" "bucket" {
  for_each = { for b in data.aws_s3_bucket.buckets : b.bucket => b }

  bucket = each.value.bucket
  acl    = each.value.acl

  tags = {
    Name = "asdf"
  }
}