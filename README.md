
# Project 4: IAM User Automation with Terraform

## Task 1: Create IAM User with S3 Read Policy

### Objective
I used Terraform to manage an AWS IAM user and attach a custom S3 read-only policy. The policy is stored as a Terraform variable.

### AWS Services and Tools Used
- AWS IAM
- Amazon S3
- Terraform

### Implementation
1. Configured the AWS provider in the `ap-south-1` region.
2. Defined the S3 read-only policy using a Terraform variable.
3. Created or imported the IAM user `project4-s3-read-user`.
4. Created the custom IAM policy `project4-s3-read-policy`.
5. Attached the custom policy to the IAM user.

### S3 Read Policy
The custom policy includes permissions for:
- `s3:ListAllMyBuckets`
- `s3:GetBucketLocation`
- `s3:ListBucket`
- `s3:GetObject`

### Terraform Resources
- `aws_iam_user`
- `aws_iam_policy`
- `aws_iam_user_policy_attachment`

### Deployment Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply
```

### Verification
I verified the attached policies using the AWS CLI:

```bash
aws iam list-attached-user-policies --user-name project4-s3-read-user
```

The custom policy `project4-s3-read-policy` was successfully attached.

I also tested the permissions using the IAM policy simulator. The simulation returned `explicitDeny` for both `s3:GetObject` and `s3:PutObject`, with `AllowedByOrganizations: false`. This indicates that an AWS Organizations restriction prevented the permission test from confirming effective access.

### Evidence
Include screenshots showing:
- IAM user and attached policies.
- IAM policy simulator output.

### Notes
The IAM user and custom policy were configured successfully using Terraform. Effective S3 access remains subject to AWS Organizations policies.

