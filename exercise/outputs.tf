output "bucketnames" {
    value = "${join(", ",aws_s3_bucket.bucket.*.id)}"
}

output "random_id" {
    value = "${join(", ",random_id.id.*.id)}"
}