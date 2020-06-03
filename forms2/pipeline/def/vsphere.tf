#. aws_access_key (required): ((aws.access_key))
#+ Amazon AWS access key for Terraform. Usually admin account to be able to create Amazon services. See value format [here](https://docs.cycloid.io/advanced-guide/integrate-and-use-cycloid-credentials-manager.html#vault-in-the-pipeline)

vsphere_password: ((basic_auth_vshpere.password))
vsphere_user: ((basic_auth_vshpere.username))
vsphere_server: 195.154.163.200

external_backend_aws_cred_name: aws
aws_access_key: ((aws.access_key))
approval_aws_access_key: ((aws_admin.access_key))

#. aws_secret_key (required): ((aws.secret_key))
#+ Amazon AWS secret key for Terraform. Usually admin account to be able to create Amazon services. See value format [here](https://docs.cycloid.io/advanced-guide/integrate-and-use-cycloid-credentials-manager.html#vault-in-the-pipeline)
aws_secret_key: ((aws.secret_key))
approval_aws_secret_key: ((aws_admin.secret_key))

#. aws_default_region (required): eu-west-1
#+ Amazon AWS region to use for Terraform.
aws_default_region: eu-west-1

#. terraform_storage_bucket_name (required): seraf-terraform-remote-state
#+ AWS S3 bucket name to store Terraform remote state file.
terraform_storage_bucket_name: seraf-terraform-remote-state

#. sc_repository (required): ""
#+ Git repository URL of your service catalog containing the stack.
sc_repository: "git@github.com:cycloidio/cycloid-stacks-test.git"

#. config_git_repository (required): ""
#+ Path of the stack located in the git of your service catalog.
sc_path: "stack-vsphere"

#. sc_git_key (required): ((git_readonly.ssh_key))
#+ SSH key pair to fetch the stack Git repository.
sc_git_key: ((git_readonly.ssh_key))

#. config_git_repository (required): ""
#+ Git repository URL containing the config of the stack.
config_git_repository: "git@github.com:cycloidio/cycloid-stacks-test.git"

#. config_git_private_key (required): ((git_readonly.ssh_key))
#+ SSH key pair to fetch the config Git repository.
config_git_key: ((git_readonly.ssh_key))

#. config_git_branch (required): config
#+ Git branch containing the config of the stack.
config_git_branch: config


#
# Default variables that shouldn't be changed except if needed
#

#. sc_branch (required): stacks
#+ Branch to use on the stack Git repository
sc_branch: stacks

#. env (required): def
#+ Name of the project's environment.
env: def

#. project (required): forms2
#+ Name of the project.
project: forms2

#. customer (required): seraf
#+ Name of the Cycloid Organization, used as customer variable name.
customer: seraf

#. terraform_storage_bucket_path (required): forms2/def
#+ S3 bucket path in which will be put the Terraform remote state file.
terraform_storage_bucket_path: demo-forms2/def

#. config_terraform_path (required): forms2/terraform/def
#
# Path of Terraform files in the config git repository
config_terraform_path: forms2/terraform/def

api_password: ((raw_cyclobot-account.password))
api_login: ((raw_cyclobot-account.login))
slack_hook: ((raw_slack-hooks.demo_channel))
