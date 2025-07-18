resource "aws_security_group" "allow_tls" {
    name        = "${var.project_name}-${var.environment}-${var.sg_name}"
    description = var.sg_description
    vpc_id = var.vpc_id

    dynamic ingress {
        for_each = var.sg_ingress_rules
        content {
          description      = ingress.value["description"]
          from_port        = ingress.value["from_port"]
          to_port          = ingress.value["to_port"]
          protocol         = ingress.value["protocol"]
          cidr_blocks      = ingress.value["cidr_blocks"]
        }     
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = merge(
        var.common_tags,
        var.sg_tags,
        {
            Name = "${var.project_name}-${var.environment}-${var.sg_name}"
        }
    )
}

# Egress is always same for every SG, so keep egress as static because, outgoing traffic is from our server. So we want only dynamic for ingress.