# tfsec-example

This blueprint provides an example of a [tfsec](https://tfsec.dev) workflow with a custom check using the Cloudify [Terraform plugin](https://docs.cloudify.co/latest/working_with/official_plugins/orchestration/terraform/).

This example requires version `0.19.8` of the Cloudify Terraform plugin.

# Usage

A custom check is provided for the Terraform module at [tf_module/ec2-instance/.tfsec/cidr_tfchecks.yaml](./tf_module/ec2-instance/.tfsec/cidr_tfchecks.yaml). The custom check is commented out by default. Uncomment the check to enable it.

The Terraform module can then be zipped up:

```
$ cd tf_module/
$ zip -r terraform.zip ec2-instance/
  adding: ec2-instance/ (stored 0%)
  adding: ec2-instance/main.tf (deflated 54%)
  adding: ec2-instance/terraform.tfvars (deflated 4%)
  adding: ec2-instance/.tfsec/ (stored 0%)
  adding: ec2-instance/.tfsec/cidr_tfchecks.yaml (deflated 48%)
  adding: ec2-instance/outputs.tf (deflated 46%)
  adding: ec2-instance/variables.tf (deflated 58%)
```

Finally, the blueprint can be uploaded to the Cloudify manager:

```
$ cfy blueprint upload -b Tfsec-Example blueprint.yaml
Uploading blueprint blueprint.yaml...
 blueprint.yaml |######################################################| 100.0%
Blueprint `Tfsec-Example` upload started.
2022-09-23 14:48:33.384  CFY <None> Starting 'upload_blueprint' workflow execution
2022-09-23 14:48:33.456  LOG <None> INFO: Blueprint archive uploaded. Extracting...
2022-09-23 14:48:33.548  LOG <None> INFO: Blueprint archive extracted. Parsing...
2022-09-23 14:48:34.917  LOG <None> INFO: Blueprint parsed. Updating DB with blueprint plan.
2022-09-23 14:48:35.100  CFY <None> 'upload_blueprint' workflow execution succeeded
Blueprint uploaded. The blueprint's id is Tfsec-Example
```
