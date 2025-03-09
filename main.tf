terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
  required_version = ">= 1.0"
}

resource "aws_cloudformation_stack" "oe_patterns_peertube" {
  name = var.stack_name

  template_url = "https://awsmp-cft-992382380361-1708727387563.s3.us-east-1.amazonaws.com/d934d100-fed3-4d37-bbfa-b8c2a6729bd4/d934d100-fed3-4d37-bbfa-b8c2a6729bd4/4b0e2889-01ca-46e9-9f02-54b48010ddc4/e2b1e212-a7b9-4284-9e67-27218d668bff/template.yaml"

  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    AdminEmail                         = var.admin_email
    AlbCertificateArn                  = var.alb_certificate_arn
    AlbIngressCidr                     = var.alb_ingress_cidr
    AsgDataVolumeBackupRetentionPeriod = var.asg_data_volume_backup_retention_period
    AsgDataVolumeBackupVaultArn        = var.asg_data_volume_backup_vault_arn
    AsgDataVolumeSize                  = var.asg_data_volume_size
    AsgDataVolumeSnapshot              = var.asg_data_volume_snapshot
    AsgDiskUsageAlarmThreshold         = var.asg_disk_usage_alarm_threshold
    AsgInstanceType                    = var.asg_instance_type
    AsgKeyName                         = var.asg_key_name
    AsgReprovisionString               = var.asg_reprovision_string
    AssetsBucketName                   = var.assets_bucket_name
    CloudFrontPriceClass               = var.cloudfront_price_class
    DbBackupRetentionPeriod            = var.db_backup_retention_period
    DbInstanceClass                    = var.db_instance_class
    DbSecretArn                        = var.db_secret_arn
    DbSnapshotIdentifier               = var.db_snapshot_identifier
    DnsHostname                        = var.dns_hostname
    DnsRoute53HostedZoneName           = var.dns_route53_hosted_zone_name
    RedisClusterCacheNodeType          = var.redis_cluster_cache_node_type
    RedisClusterNumCacheNodes          = var.redis_cluster_num_cache_nodes
    SesCreateDomainIdentity            = var.ses_create_domain_identity
    SesInstanceUserAccessKeySerial     = var.ses_instance_user_access_key_serial
    VpcCidr                            = var.vpc_cidr
    VpcId                              = var.vpc_id
    VpcNatGatewayPerSubnet             = var.vpc_nat_gateway_per_subnet
    VpcPrivateSubnet1Cidr              = var.vpc_private_subnet1_cidr
    VpcPrivateSubnet1Id                = var.vpc_private_subnet1_id
    VpcPrivateSubnet2Cidr              = var.vpc_private_subnet2_cidr
    VpcPrivateSubnet2Id                = var.vpc_private_subnet2_id
    VpcPublicSubnet1Cidr               = var.vpc_public_subnet1_cidr
    VpcPublicSubnet1Id                 = var.vpc_public_subnet1_id
    VpcPublicSubnet2Cidr               = var.vpc_public_subnet2_cidr
    VpcPublicSubnet2Id                 = var.vpc_public_subnet2_id
  }
}
