#
# This file has been generated by Cycloid, please DO NOT modify.
# Any manual modifications done to this file, WILL be lost on the
# next project edition via the forms.
#
# Please note that comments in sample files will have been dropped
# due to some limitations upon files' generation.
#
# Any extra variables not found in the original file have been ignored.
#

module "config" {
  source = "./module-config"

  cluster_name = "stackforms-v2-k8s-hi"
  customer     = var.customer
  env          = var.env
  project      = var.project
}

module "vpc" {
  source = "./module-vpc"

  cluster_name = module.config.cluster_name
  customer     = var.customer
  env          = var.env
  private_subnets = [
    "10.8.0.0/24",
    "10.8.2.0/24",
    "10.8.4.0/24"
  ]
  project = var.project
  public_subnets = [
    "10.8.1.0/24",
    "10.8.3.0/24",
    "10.8.5.0/24"
  ]
  vpc_cidr = "10.8.0.0/16"
}

module "eks" {
  source = "./module-eks"

  cluster_name       = module.config.cluster_name
  cluster_version    = "1.16"
  customer           = var.customer
  env                = var.env
  project            = var.project
  public_subnets_ids = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id
}

module "eks-node" {
  source = "./module-eks-node"

  cluster_name                        = module.eks.cluster_name
  cluster_version                     = module.eks.cluster_version
  control_plane_ca                    = module.eks.control_plane_ca
  control_plane_endpoint              = module.eks.control_plane_endpoint
  customer                            = var.customer
  env                                 = var.env
  keypair_name                        = "cycloid"
  node_asg_max_size                   = 10
  node_asg_min_size                   = 1
  node_count                          = "1"
  node_disk_size                      = 60
  node_disk_type                      = "gp2"
  node_ebs_optimized                  = true
  node_enable_cluster_autoscaler_tags = false
  node_group_name                     = "($ scs_url $):($ scs_branch $)__($ cr_url $)-($ cr_branch $)"
  node_iam_instance_profile_name      = module.eks.node_iam_instance_profile_name
  node_launch_template_profile        = "ondemand"
  node_sg_id                          = module.eks.node_sg_id
  node_spot_price                     = "0.3"
  node_type                           = "c5.xlarge"
  private_subnets_ids                 = module.vpc.private_subnets
  project                             = var.project
  vpc_id                              = module.vpc.vpc_id
}

