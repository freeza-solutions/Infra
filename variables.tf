variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome usado como prefixo/tag em todos os recursos"
  type        = string
  default     = "freeza"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.medium"
}

variable "root_volume_size" {
  description = "Tamanho (GB) do disco raiz (SSD gp3)"
  type        = number
  default     = 30
}

variable "key_pair_name" {
  description = "Nome do Key Pair já existente na AWS, usado para acesso SSH"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Nome do Instance Profile IAM já existente (AWS Academy Learner Lab)"
  type        = string
  default     = "LabInstanceProfile"
}

variable "vnc_password" {
  description = "Senha do usuário kasm_user (login VNC/desktop do Kali). Defina em terraform.tfvars — nunca hardcode no script."
  type        = string
  sensitive   = true
}

variable "localstack_auth_token" {
  description = "Token do LocalStack Pro. Defina em terraform.tfvars."
  type        = string
  sensitive   = true
}
