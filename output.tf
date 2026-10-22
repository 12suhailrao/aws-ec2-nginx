output "instance_public_ip" {
  description = "the public ip of the EC2 instance"
  value       = aws_instance.nginxserver.public_ip
}


output "instance_url" {
  description = "the URL to the access the NGINX"
  value       = "http://${aws_instance.nginxserver.public_ip}"
}