- name: Generate terraform.tfvars
  run: |
    echo 'vpc-cidr = ${{ vars.VPC_CIDR }}' > terraform.tfvars
    echo 'private-subnet-cidr = ${{ vars.PRIVATE_SUBNET_CIDR }}' >> terraform.tfvars
    echo 'public-subnet-cidr = ${{ vars.PUBLIC_SUBNET_CIDR }}' >> terraform.tfvars
    echo 'subnet-count = ${{ vars.SUBNET_COUNT }}' >> terraform.tfvars
    echo 'private-subnet-az = ${{ vars.PRIVATE_SUBNET_AZ }}' >> terraform.tfvars
    echo 'pulic-subnet-az = ${{ vars.PUBLIC_SUBNET_AZ }}' >> terraform.tfvars
    echo 'node_role_name = "${{ secrets.NODE_ROLE_NAME }}"' >> terraform.tfvars
    echo 'eks_role_name = "${{ secrets.EKS_ROLE_NAME }}"' >> terraform.tfvars
    echo 'sg_name = "${{ secrets.SG_NAME }}"' >> terraform.tfvars
    echo 'ingress_rules = ${{ vars.INGRESS_RULES }}' >> terraform.tfvars
    echo 'egress_rules = ${{ vars.EGRESS_RULES }}' >> terraform.tfvars
    echo 'cluster_name = ${{ vars.CLUSTER_NAME }}' >> terraform.tfvars
    echo 'disk_sizes = ${{ vars.DISK_SIZE }}' >> terraform.tfvars
    echo 'instance_type = ${{ vars.INSTANCE_TYPE }}' >> terraform.tfvars
  working-directory: .
