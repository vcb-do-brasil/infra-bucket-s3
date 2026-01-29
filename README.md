# infra-bucket-s3

Infraestrutura para criação de bucket S3 na AWS usando Terraform e GitHub Actions.

## 📋 Descrição

Este repositório contém a infraestrutura como código (IaC) para provisionar um bucket S3 na AWS chamado `bolsa-de-valores`. A implantação é automatizada através de GitHub Actions.

## 🏗️ Recursos Criados

- **Bucket S3**: `bolsa-de-valores`
- **Versionamento**: Habilitado por padrão
- **Criptografia**: AES256 (server-side encryption)
- **Bloqueio de acesso público**: Habilitado para segurança

## 📁 Estrutura do Projeto

```
.
├── .github/
│   └── workflows/
│       └── terraform-deploy.yml  # Workflow do GitHub Actions
├── main.tf                       # Configuração principal do Terraform
├── provider.tf                   # Configuração do provider AWS
├── variables.tf                  # Variáveis de entrada
├── outputs.tf                    # Valores de saída
├── .gitignore                   # Arquivos ignorados pelo Git
└── README.md                     # Esta documentação
```

## 🚀 Como Usar

### Pré-requisitos

1. Conta AWS ativa
2. Credenciais AWS configuradas no GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

### Configuração das Credenciais AWS no GitHub

1. Acesse: `Settings` → `Secrets and variables` → `Actions` no seu repositório
2. Adicione os seguintes secrets:
   - `AWS_ACCESS_KEY_ID`: Sua AWS Access Key ID
   - `AWS_SECRET_ACCESS_KEY`: Sua AWS Secret Access Key

### Deploy Automático

O deploy é executado automaticamente via GitHub Actions:

- **Pull Request**: Executa `terraform plan` e comenta o resultado no PR
- **Push para main**: Executa `terraform plan` e `terraform apply`
- **Manual**: Pode ser executado manualmente via workflow dispatch

### Deploy Manual Local

Se preferir executar localmente:

```bash
# Inicializar o Terraform
terraform init

# Verificar formatação
terraform fmt

# Validar configuração
terraform validate

# Ver o plano de execução
terraform plan

# Aplicar as mudanças
terraform apply
```

## ⚙️ Variáveis

| Variável | Descrição | Valor Padrão |
|----------|-----------|--------------|
| `bucket_name` | Nome do bucket S3 | `bolsa-de-valores` |
| `aws_region` | Região AWS | `us-east-1` |
| `environment` | Ambiente (dev, staging, prod) | `prod` |
| `enable_versioning` | Habilitar versionamento | `true` |

## 📤 Outputs

Após a aplicação, os seguintes valores são retornados:

- `bucket_name`: Nome do bucket criado
- `bucket_arn`: ARN do bucket
- `bucket_region`: Região onde o bucket foi criado
- `bucket_domain_name`: Domain name do bucket

## 🔒 Segurança

O bucket é configurado com as seguintes medidas de segurança:

- ✅ Block public ACLs
- ✅ Block public policy
- ✅ Ignore public ACLs
- ✅ Restrict public buckets
- ✅ Server-side encryption (AES256)
- ✅ Versionamento habilitado

## 📝 Licença

Este projeto está sob licença MIT.
