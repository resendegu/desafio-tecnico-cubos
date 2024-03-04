## Desafio Técnico - Cubos DevOps

**Pré-requisitos:**

* Docker instalado
* Terraform instalado

**Observações:**

* Na linha 13 do arquivo `./main.tf`, pode ser necessário alterar o path do ambiente de acordo com o seu sistema operacional. A configuração atual é para Linux (testada no Ubuntu Server 22).
* O uso do Linux é recomendado também por outro motivo, pois no Windows é necessário converter o arquivo `sql/db_script.sh` de CRLF para LF. Para mais informações, consulte este fórum: [https://stackoverflow.com/questions/76291703/how-can-i-troubleshoot-required-file-not-found-error-when-running-postgres-doc](https://stackoverflow.com/questions/76291703/how-can-i-troubleshoot-required-file-not-found-error-when-running-postgres-doc)

**Instruções:**

1. Abra um terminal Bash e execute o seguinte comando para montar as imagens:

```
sh setup.sh
```

2. Execute os comandos Terraform para inicializar e subir a infraestrutura:

```
terraform init
terraform plan
terraform apply
```

**Detalhes:**

* O comando `setup.sh` fará o build de todas as imagens com o Docker e definirá algumas variáveis de ambiente necessárias.

**Recursos adicionais:**

* Documentação do Docker: [https://docs.docker.com/get-started/](https://docs.docker.com/get-started/)
* Instalação do Terraform: [https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

