module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = "${local.name}-nlb"

  load_balancer_type = "network"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  #security_groups = [module.loadbalancer_sg.this_security_group_id] # Security Groups not supported for NLB
  #   access_logs = {
  #     bucket = "my-nlb-logs"
  #   }

  target_groups = [
    {
      name_prefix          = "app1-"
      backend_protocol     = "TCP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = local.common_tags
}