output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "private_key_path" {
  description = "Path of the private key (.pem) file"
  value       = local_file.private_key.filename
}
