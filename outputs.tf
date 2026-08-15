output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "IP público da instância"
  value       = aws_instance.this.public_ip
}

output "ssh_command" {
  description = "Comando pronto para conectar via SSH"
  value       = "ssh -i <caminho-para-sua-chave>.pem ubuntu@${aws_instance.this.public_ip}"
}

output "kali_desktop_url" {
  description = "URL do desktop Kali via noVNC (aguarde alguns minutos após o apply para o cloud-init terminar)"
  value       = "https://${aws_instance.this.public_ip}:6901"
}
