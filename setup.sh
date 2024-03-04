#!/bin/bash
echo "Verificando se o arquivo .env.local já existe..."
if [ -f ".env.local" ] && [ -f "./sql/.env.local" ] && [ -f "./backend/.env.local" ]; then
    source "./.env.local"

    if [ -z "$postgres_password" ] || [ -z "$admin_db_password" ] || [ -z "$admin_password" ]; then
        echo "O arquivo .env.local está criado porém não possui as variáveis, por favor, apague o arquivo .env.local e rode o script novamente."
        exit 1
    else
        echo "Arquivo .env.local já existe, utilizando variáveis do arquivo .env.local"
    fi
else
    read -p "Crie uma senha para usuário postgres (postgres_password): " postgres_password
    read -p "Crie uma senha para usuário admin do banco (admin_db_password): " admin_db_password
    read -p "Crie uma senha para usuário admin da aplicação (admin_password): " admin_password

    # Write environment variables to .env.local files
    for file in ".env.local" "./sql/.env.local" "./backend/.env.local"; do
        echo "postgres_password=$postgres_password
admin_db_password=$admin_db_password
admin_password=$admin_password" > "$file"
    done
fi

echo "Criando as imagens docker..."

docker build -t "db_sql:latest" --build-arg postgres_password=$postgres_password --build-arg admin_db_password=$admin_db_password --build-arg admin_password=$admin_password  ./sql/.

docker build -t "backend-desafio:latest" ./backend/.

docker build -t "frontend-desafio:latest" ./frontend/.

echo " "
echo -e "\e[32mImagens criadas. Agora execute os comandos do terraform para subir a infraestrutura.\e[0m"
