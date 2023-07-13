# Launch Template Outputs
output "launch_template_name" {
  description = "Launch Template Name"
  value       = module.autoscaling.launch_template_name
}

# output "launch_template_latest_version" {
#   description = "Launch Template Latest Version"
#   value       = module.autoscaling.launch_template_version
# }

# Autoscaling Outputs
output "autoscaling_group_id" {
  description = "Autoscaling Group ID"
  value       = module.autoscaling.autoscaling_group_id
}

output "autoscaling_group_name" {
  description = "Autoscaling Group Name"
  value       = module.autoscaling.autoscaling_group_name
}

output "autoscaling_group_arn" {
  description = "Autoscaling Group ARN"
  value       = module.autoscaling.autoscaling_group_arn
}