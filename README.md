Required Terraform Resources
The following resources are required and are sourced from the official AWS Terraform provider (not third-party modules):

aws_instance – Launches the EC2 instance.

aws_vpc – (If not using an existing VPC) Defines the virtual network environment.

aws_subnet – (If not using an existing one) Specifies the subnet for the EC2 instance.

aws_security_group – Sets up firewall rules to control inbound and outbound traffic for the instance.

aws_key_pair – Enables SSH access to the EC2 instance.

aws_internet_gateway – (If needed) Provides internet access to resources in the VPC.

aws_route_table & aws_route – Configure network routes, typically for internet access.

aws_eip – (Optional) Allocates a static public IP address (Elastic IP).

aws_iam_role & aws_iam_instance_profile – (Optional) Attach AWS IAM permissions to the EC2 instance.

aws_volume_attachment – (Optional) Attaches additional EBS volumes to the instance.
