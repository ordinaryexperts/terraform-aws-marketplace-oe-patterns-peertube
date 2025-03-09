variable "stack_name" {
  type        = string
  description = "Name of the CloudFormation stack"
  default     = "oe_patterns_peertube"
}

variable "vpc_id" {
  type        = string
  description = "Optional: Specify the VPC ID. If not specified, a VPC will be created."
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Optional: VPC IPv4 CIDR block if no VPC provided."
}

variable "vpc_nat_gateway_per_subnet" {
  type        = bool
  default     = false
  description = "Optional: Set to 'true' to provision a NAT Gateway in each public subnet for AZ HA."
}

variable "vpc_private_subnet1_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for private subnet 1."
}

variable "vpc_private_subnet1_cidr" {
  type        = string
  default     = "10.0.128.0/18"
  description = "Optional: VPC IPv4 CIDR block of private subnet 1 if no VPC provided."
}

variable "vpc_private_subnet2_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for private subnet 2."
}

variable "vpc_private_subnet2_cidr" {
  type        = string
  default     = "10.0.192.0/18"
  description = "Optional: VPC IPv4 CIDR block of private subnet 2 if no VPC provided."
}

variable "vpc_public_subnet1_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for public subnet 1."
}

variable "vpc_public_subnet1_cidr" {
  type        = string
  default     = "10.0.0.0/18"
  description = "Optional: VPC IPv4 CIDR block of public subnet 1 if no VPC provided."
}

variable "vpc_public_subnet2_id" {
  type        = string
  default     = ""
  description = "Optional: Specify Subnet ID for public subnet 2."
}

variable "vpc_public_subnet2_cidr" {
  type        = string
  default     = "10.0.64.0/18"
  description = "Optional: VPC IPv4 CIDR block of public subnet 2 if no VPC provided."
}

variable "admin_email" {
  type        = string
  default     = ""
  description = "Optional: The email address to use for the PeerTube administrator account. If not specified, 'admin@{DnsHostname}' wil be used."
}

variable "dns_route53_hosted_zone_name" {
  type        = string
  default     = ""
  description = "Optional: Route 53 Hosted Zone name. Must already exist and match the domain part of the Hostname parameter, without trailing dot."
}

variable "dns_hostname" {
  type        = string
  default     = ""
  description = "Optional: The hostname to access the service."
}

variable "assets_bucket_name" {
  type        = string
  default     = ""
  description = "Optional: Name of the S3 bucket to store uploaded assets. If not specified, a bucket will be created."
}

variable "ses_instance_user_access_key_serial" {
  type        = number
  default     = 1
  description = "Optional: Incrementing this integer value will trigger a rotation of the Instance User Access Key."
}

variable "ses_create_domain_identity" {
  type        = bool
  default     = true
  description = "Optional: If 'true', a SES Domain Identity will be created from the hosted zone."
}

variable "db_secret_arn" {
  type        = string
  default     = ""
  description = "Optional: SecretsManager secret ARN for database credentials. If not specified, a secret will be created."
}
variable "redis_cluster_cache_node_type" {
  type        = string
  default     = "cache.t3.micro"
  description = "Required: Instance type for the cluster nodes."
}

variable "redis_cluster_num_cache_nodes" {
  type        = number
  default     = 1
  description = "Required: The number of cache nodes in the cluster."
  validation {
    condition     = var.redis_cluster_num_cache_nodes >= 1 && var.redis_cluster_num_cache_nodes <= 20
    error_message = "Value must be between 1 and 20."
  }
}

variable "asg_instance_type" {
  description = "Required: The EC2 instance type for the application Auto Scaling Group."
  type        = string
  default     = "c7g.medium"
}

variable "asg_reprovision_string" {
  description = "Optional: Changes to this parameter will force instance reprovision on the next CloudFormation update."
  type        = string
  default     = ""
}

variable "asg_data_volume_size" {
  type        = number
  default     = 100
  description = "Required: Size of EBS data volume in GiBs."
}

variable "asg_data_volume_snapshot" {
  type        = string
  default     = ""
  description = "Optional: An EBS snapshot id to restore as a starting point for the data volume."
}

variable "alb_certificate_arn" {
  description = "Required: Specify the ARN of a ACM Certificate to configure HTTPS."
  type        = string
}

variable "alb_ingress_cidr" {
  description = "Required: VPC IPv4 CIDR block to restrict access to ALB."
  type        = string
}

variable "asg_data_volume_backup_retention_period" {
  type        = number
  default     = 7
  description = "Required: The number of nightly EBS snapshots to retain."
}

variable "asg_data_volume_backup_vault_arn" {
  type        = string
  default     = ""
  description = "Optional: An AWS Backup Vault ARN to use for storing EBS backups. If not specified, a vault will be created."
}

variable "asg_disk_usage_alarm_threshold" {
  type        = number
  default     = 80
  description = "Required: The alarm threshold for disk usage percentage."
}

variable "asg_key_name" {
  type        = string
  default     = ""
  description = "Optional: The EC2 key pair name for the instance."
}

variable "cloudfront_price_class" {
  type = string
  default = "PriceClass_All"
  description = "Required: Price class to use for CloudFront CDN."
  validation {
    condition     = contains(["PriceClass_All", "PriceClass_200", "PriceClass_100"], var.cloudfront_price_class)
    error_message = "Allowed values are 'PriceClass_All', 'PriceClass_200', or 'PriceClass_100'."
  }
}

variable "db_backup_retention_period" {
  description = "Required: The number of days to retain automated db backups."
  type        = number
  default     = 7
}

variable "db_instance_class" {
  description = "Required: The class profile for memory and compute capacity for the database instance."
  type        = string
  default     = "db.t4g.medium"
}

variable "db_snapshot_identifier" {
  description = "Optional: RDS snapshot ARN from which to restore."
  type        = string
  default     = ""
}
