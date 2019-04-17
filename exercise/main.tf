provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "random_id" "id" {
    count = 2
    byte_length = 8
}


resource "aws_s3_bucket" "bucket" {
    count = 2
    bucket = "${var.bucketname}-${random_id.id.*.dec[count.index]}"
    acl    = "private"
    force_destroy = true


  tags = {
    Name  = "My bucket"
  }


}