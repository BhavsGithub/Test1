provider "aws" {
        access_key = "****"
        secret_key = "****"
        region = "us-east-2"
}

resource "aws_route53_zone" "main" {
  name = "tbistro.com"
  

  tags = {
    Environment = "dev"
 }
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "www.tbistro.com"
  type    = "A"
  ttl     = "300"
  records = ["18.223.195.187"]
}
