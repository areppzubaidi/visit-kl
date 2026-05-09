output "alb_dns_name" {
  description = "ALB DNS name — access your site here"
  value       = aws_lb.web.dns_name
}

output "s3_bucket_name" {
  description = "S3 bucket for artifacts"
  value       = aws_s3_bucket.artifacts.bucket
}
