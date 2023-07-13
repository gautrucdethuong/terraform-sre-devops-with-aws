output "nlb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.nlb.lb_id
}

output "nlb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.nlb.lb_arn
}

output "nlb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.nlb.lb_dns_name
}

output "nlb_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch."
  value       = module.nlb.lb_arn_suffix
}

output "nlb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = module.nlb.lb_zone_id
}

output "nlb_http_tcp_listener_arns" {
  description = "The ARN of the TCP and HTTP load balancer listeners created."
  value       = module.nlb.http_tcp_listener_arns
}

output "nlb_http_tcp_listener_ids" {
  description = "The IDs of the TCP and HTTP load balancer listeners created."
  value       = module.nlb.http_tcp_listener_ids
}

output "nlb_https_listener_arns" {
  description = "The ARNs of the HTTPS load balancer listeners created."
  value       = module.nlb.https_listener_arns
}

output "nlb_https_listener_ids" {
  description = "The IDs of the load balancer listeners created."
  value       = module.nlb.https_listener_ids
}

output "nlb_target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.nlb.target_group_arns
}

output "nlb_target_group_arn_suffixes" {
  description = "ARN suffixes of our target groups - can be used with CloudWatch."
  value       = module.nlb.target_group_arn_suffixes
}

output "nlb_target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.nlb.target_group_names
}

output "nlb_target_group_attachments" {
  description = "ARNs of the target group attachment IDs."
  value       = module.nlb.target_group_attachments
}
