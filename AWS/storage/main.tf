#Main Storage
resource "random_id" "id" {
  byte_length = 8
}

resource "aws_s3_bucket" "s3" {
  bucket        = "${var.bucketname}-${random_id.id.dec}"
  acl           = "private"
  force_destroy = true

  tags = {
    Name = "main"
  }
}
