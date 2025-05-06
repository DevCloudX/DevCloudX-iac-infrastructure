# Create a Key Pair
resource "aws_key_pair" "example" {
  key_name   = "my-ec2-key"                # Name of the key pair
  public_key = file(var.public_key_path)    # Your public key to associate with EC2
}

# EC2 Instance creation
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.example.key_name
  tags = {
    Name = var.instance_name
  }

  associate_public_ip_address = true
}

# Output the Public IP of the EC2 instance
output "public_ip" {
  value = aws_instance.example.public_ip
}

# Save the private key as a file and output its path
resource "local_file" "private_key" {
  content  = aws_key_pair.example.private_key
  filename = "${path.module}/my-ec2-key.pem"  # Save the private key to a file
}

# Output the path of the private key file
output "private_key_path" {
  value = local_file.private_key.filename
}
