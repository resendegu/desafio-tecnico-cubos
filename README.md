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

3. Após isso, o frontend estará disponível na porta 80 no endereço da máquina que está rodando a aplicação.

**Detalhes:**

* O script `setup.sh` fará o build de todas as imagens com o Docker e definirá algumas variáveis de ambiente necessárias.
* Foi criado o script `sql/db_script.sh` que traz embutido o script SQL do arquivo `sql/script.sql`. O script `sql/db_script.sh` irá executar dentro do container que contém o banco de dados, junto com as variáveis de ambiente.
* Foram criadas 3 Dockerfiles, uma para fazer o build de cada ambiente (backend, frontend, e database).
* No frontend foi utilizado uma imagem do servidor web Nginx que fará o proxy reverso para as chamadas na rota /api, redirecionando-as para o container backend na porta 8081. O arquivo `frontend/default.conf` contém a configuração básica para o funcionamento do Ngnix e o proxy reverso.
* Para o backend foi utilizado a versão do node 20.11.1-alpine do Docker Hub. O arquivo `backend/package.json` foi alterado para carregar algumas variáveis de ambiente. No arquivo `backend/index.js` foram colocadas algumas variáveis com valores para conexão com o banco e de variável de ambiente.
* No arquivo `main.tf` foi utilizado o provedor do docker na versão 3.0.2 conforme documentação [https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs). São usadas as imagens criadas com script `setup.sh`, e três containers são configurados (backend, nginx-frontend, database).

**Recursos adicionais:**

* Documentação do Docker: [https://docs.docker.com/get-started/](https://docs.docker.com/get-started/)
* Instalação do Terraform: [https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

