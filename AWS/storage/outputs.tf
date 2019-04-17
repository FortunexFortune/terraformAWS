#Outputs Storage
output "bucketname" {
  value = "${aws_s3_bucket.s3.id}"
}
