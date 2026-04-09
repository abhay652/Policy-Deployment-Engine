package terraform.gcp.security.cloud_workstations.google_workstations_workstation.vars

variables := {
    "friendly_resource_name": "cloud workstation", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type": "google_workstations_workstation",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "workstation_id" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
