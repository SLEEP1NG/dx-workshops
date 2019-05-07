module "test_web_server" {
  source = "./modules/web_server"
  project = "${var.project}"
  key_name = "${var.key_name}"
  how_many = "${var.how_many}"
  subnet_id = "${module.aws_subnet.id}"
  security_group_id = ["${module.aws_security_group.id}"]
  default_tags = "${local.default_tags}"
  ami_name = "delphix-centos7-daf-app-*"
  last_octet = "73"
  env_name = "nonprod"
  }

output "testweb_public_ip" {
  value = "${module.test_web_server.public_ip}"
}

output "testweb_private_ip" {
  value = "${module.test_web_server.public_ip}"
}

output "Test Web Server" {
  value = "${
    formatlist(
      "\nTest Web Server - Public IP: %s Private IP: %s\n",
      module.test_web_server.public_ip,
      module.test_web_server.private_ip,
      )}"
}