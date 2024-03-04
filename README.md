# Desafio técnico - Cubos DevOps

Na linha 13 do arquivo ./main.tf é possível que você tenha que alterar o path do ambiente de acordo com o sistema operacional em que você tem o docker instalado. Neste caso está configurado para rodar no Windows.

docker build -t "db_sql:latest" --build-arg postgres_password=VeryStrongP@ss --build-arg admin_db_password=StrongP@ss admin_password=GoodP@ss  ./sql/.

docker build -t "backend-desafio:latest" ./backend/.

docker build -t "frontend-desafio:latest" ./frontend/.