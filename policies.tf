locals {
  policies = {
    vpc-infrastructure = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:DescribeAvailabilityZones",
            "ec2:CreateTags"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateVpc",
            "ec2:DescribeVpcs",
            "ec2:DescribeVpcAttribute",
            "ec2:ModifyVpcAttribute",
            "ec2:DeleteVpc",
            "ec2:DescribeVpcClassicLink",
            "ec2:DisableVpcClassicLink",
            "ec2:EnableVpcClassicLink",
            "ec2:DescribeVpcClassicLinkDnsSupport",
            "ec2:DisableVpcClassicLinkDnsSupport",
            "ec2:EnableVpcClassicLinkDnsSupport"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateSubnet",
            "ec2:DescribeSubnets",
            "ec2:ModifySubnetAttribute",
            "ec2:DeleteSubnet"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateInternetGateway",
            "ec2:DescribeInternetGateways",
            "ec2:AttachInternetGateway",
            "ec2:DetachInternetGateway",
            "ec2:DeleteInternetGateway"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateRouteTable",
            "ec2:DescribeRouteTables",
            "ec2:CreateRoute",
            "ec2:ReplaceRoute",
            "ec2:DeleteRoute",
            "ec2:DeleteRouteTable"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:AssociateRouteTable",
            "ec2:DisassociateRouteTable",
            "ec2:ReplaceRouteTableAssociation"
          ],
          "Resource" : "*"
        }
      ]
    })
  }
}
