output "rancher_server_public_ip" {
  description = "Public IP address of the Rancher server"
  value       = aws_instance.rancher_server.public_ip
}