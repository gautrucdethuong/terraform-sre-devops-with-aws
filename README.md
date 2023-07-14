AWS Network Load Balancer TCP and TLS with Terraform
![image](https://github.com/gautrucdethuong/terraform-sre-devops-with-aws/assets/57904796/aed6e8ef-bee6-48bb-aa6d-805c32cc57b7)

![image](https://github.com/gautrucdethuong/terraform-sre-devops-with-aws/assets/57904796/04afbc37-2bec-4ac4-bc66-5814f066311f)

# Observation
1. Consistently monitor the Autoscaling "Activity" and "Instance Refresh" tabs.
2. In close to 5 to 10 minutes, instances will be refreshed
3. Verify EC2 Instances, old will be terminated and new will be created

# Terraform Destroy
terraform destroy -auto-approve

# Clean-Up Files
rm -rf .terraform*
rm -rf terraform.tfstate*


