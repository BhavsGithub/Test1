provider "aws" {
        access_key = "AKIA3RM4GOFJK6KHMHO7"
        secret_key = "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"
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
