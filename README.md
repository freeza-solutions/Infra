# Infra

## Setup

1. **Credenciais AWS** — no Learner Lab, clique em *AWS Details* → *Show* em "AWS CLI" e copie o bloco para `~/.aws/credentials`:
   ```ini
   [default]
   aws_access_key_id = ...
   aws_secret_access_key = ...
   aws_session_token = ...
   ```

2. **Variáveis do projeto**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   Edite `terraform.tfvars`:
   - `key_pair_name` — o **nome** do Key Pair na AWS (sem `.pem`)
   - `vnc_password` — senha que você quer para o usuário `kasm_user` do Kali
   - `localstack_auth_token` — token da sua conta LocalStack (necessário para recursos Pro)

   Esse arquivo é seu, local, e nunca vai pro git (está no `.gitignore`).

3. **Rodar**
   ```bash
   terraform init
   terraform apply
   ```

4. **Acessar** — o `apply` mostra `public_ip` e `kali_desktop_url`. Espere de 3 a 5 minutos após o apply (o cloud-init baixa as imagens Docker no primeiro boot) antes de abrir a URL. Pra acompanhar o progresso:
   ```bash
   ssh -i caminho/para/sua-chave.pem ubuntu@<public_ip>
   sudo tail -f /var/log/cloud-init-output.log
   ```

   **Login no Kali (desktop via navegador):**
   1. Abra a URL do output (`kali_desktop_url`), sempre com **`https://`** — nunca `http://`.
   2. O navegador vai acusar certificado inválido (é autoassinado) — clique em *Avançado* → *Prosseguir mesmo assim*.
   3. Se aparecer erro **401**, abra em uma **janela anônima/privada** e tente de novo.
   4. Usuário: `kasm_user` — senha: `urubu100`.

5. **Destruir quando terminar** (evita gastar crédito do Lab à toa):
   ```bash
   terraform destroy
   ```

## Estrutura

| Arquivo | O que faz |
|---|---|
| `versions.tf` | Trava a versão do provider AWS |
| `providers.tf` | Configura a região (`us-east-1` por padrão) |
| `variables.tf` | Parâmetros configuráveis (instância, disco, chave, senha...) |
| `main.tf` | AMI Ubuntu, security group (22 e 6901) e a instância EC2 |
| `outputs.tf` | IP público, comando SSH pronto e URL do Kali |
| `scripts/setup-kali-lab.sh.tftpl` | Script (user_data) que sobe os containers Kali + LocalStack no primeiro boot |
