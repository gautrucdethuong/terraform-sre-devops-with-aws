# Define placement group
# resource "aws_placement_group" "cluster_group" {
#   name     = "test"
#   strategy = "cluster"
# }

# # Autoscaling Group Resource
module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"
  # Autoscaling group
  name = "example-asg"

  desired_capacity = 1
  max_size         = 2
  min_size         = 1

  # wait_for_capacity_timeout = 0
  health_check_type   = "EC2"
  vpc_zone_identifier = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  # placement_group     = aws_placement_group.cluster_group.id

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"] # You can add any argument from ASG here, if those has changes, ASG Instance Refresh will trigger   
  }

  # Define Launch template
  launch_template_name        = "my-launch-template"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = data.aws_ami.amzlinux2.id
  instance_type     = "t3.micro"
  key_name          = var.instance_keypair
  ebs_optimized     = true
  enable_monitoring = true
  user_data         = filebase64("${path.module}/app1-install.sh")
  # vpc_security_group_ids = [module.private_sg.this_security_group_id]
  security_groups = [module.private_sg.this_security_group_id]

  # Define IAM role & instance profile
  create_iam_instance_profile = true
  iam_role_name               = "example-asg"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role example"
  iam_role_tags = {
    CustomIamRole = "Yes"
  }
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]

  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }

  cpu_options = {
    core_count       = 1
    threads_per_core = 1
  }

  credit_specification = {
    cpu_credits = "standard"
  }

  target_group_arns = module.alb.target_group_arns // Add ALB into Auto scale group
  # instance_market_options = {
  #   market_type = "spot"
  #   spot_options = {
  #     block_duration_minutes = 60
  #   }
  # }

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 32
  }

  tags = local.common_tags
}