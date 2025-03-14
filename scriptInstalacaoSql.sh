echo "Atualizando pacotes Linux"
sudo apt-get update -y

echo "Instalando o MySQL server"
sudo apt-get install mysql-server -y

echo "Iniciando o serviço mysql"
sudo systemctl start mysql

echo "Habilitando iniio do mysql no boot"
sudo systemctl enable mysql

echo "Configurando senha do usuário"
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'urubu100';"

echo "salvando a senha do usuário"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Reiniciando mysql"
sudo systemctl restart mysql

echo "Criando banco de dados da API"
sudo mysql -e "CREATE DATABASE Techpix"

echo "Criando usuário de insert da API"
sudo mysql -e "CREATE USER 'techpixInsert'@'localhost' IDENTIFIED BY 'Urubu100';"

echo "Dando permissões para o usuário de insert da API"
sudo mysql -e "GRANT INSERT ON Techpix.* TO 'techpixInsert'@'localhost';"

echo "Salvando permissões"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Criando usuário de select da API"
sudo mysql -e "CREATE USER 'techpixSelect'@'localhost' IDENTIFIED BY 'Urubu100';"

echo "Dando permissões para o usuário de select da API"
sudo mysql -e "GRANT SELECT ON Techpix.* TO 'techpixSelect'@'localhost';"

echo "Salvando permissões"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Executando script sql para criação de tabelas"
sudo mysql < script-bd.sql

echo "Processo concluído com sucesso"
