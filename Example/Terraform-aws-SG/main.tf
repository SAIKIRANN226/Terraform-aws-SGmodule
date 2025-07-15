module "web_sg" {
    source = "../Terraform-aws-SGmodule"
    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_name
    vpc_id = var.vpc_id
    sg_description = var.sg_description

    sg_ingress_rules = [
        {
            sg_description = "allow HTTP"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            sg_description = "allow HTTPS"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}