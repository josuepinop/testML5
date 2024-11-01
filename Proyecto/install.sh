#!/bin/bash

# Actualiza el sistema
sudo apt update -y

# Descargar e instalar AWS CLI
sudo apt install curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Descargar e instalar Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform

# Configura AWS CLI automáticamente
aws configure set aws_access_key_id "ASIA3LSDABXJ24X3YFO6"
aws configure set aws_secret_access_key "fdR9pHlpgEjm8NetVYQFcA5cOMbe4vTEwxU+Uhc3"
aws configure set region "us-east-1"
aws configure set output "json"

# Reemplaza el archivo de credenciales
CREDENTIALS_FILE="$HOME/.aws/credentials"
echo "[default]" > $CREDENTIALS_FILE
echo "aws_access_key_id=ASIA5RUCBM7FPDXPNUOF" >> $CREDENTIALS_FILE
echo "aws_secret_access_key=wYQy64C7xyf9LmMr4jFxFzMLrK+2F1fzb6kBj1C1" >> $CREDENTIALS_FILE
echo "aws_session_token=IQoJb3JpZ2luX2VjEDAaCXVzLXdlc3QtMiJHMEUCIF8QFYvjFxrlsmwQ606DbzaCI9CzNWhHdKX8Edfy3K7GAiEA8CL17ZFuGSKsn4bRGNtpN1bnjngI0Q2LAwbxT1oHku4qvQIIqf//////////ARABGgw5MzEyMDY4ODMyNzQiDGgemAnTZE3e0sN93yqRAp9wzvsJyOj9l/LNid87cSmDezURP3btNswdytjsOQYJJcrqn5/T395orK2mCklDR3Ql8gm87bCCVvBLyg5xE6LisoV2AIoOqXgV170jZ5Xgxw53I3ogip43pfsqcAUhy+EjHyomNtszeJY+rvGeF0wplpuczQjEu2gVYISfWyJX367NTxoaaO38vIBoL5VLorzXwFdC6GX0sHATx7KsLh1aECELQj/9mykVK7+BR1qdvoCenKr+6jOe8NY6i+HkEqfXzJe3MdbZlujtCHhAhtLvyCykJTH1TNAk19qZwTvqxZwwmUDH3SaxX1z9qwqRveTSKnL4b6ahNmfFaDrZR6wKytuh9HJ49S8HbHRHcPwvbjCO5ZO5BjqdAV5IsAYnCqLctA29an0n9D6bghDEIdKxG6+1mBSqMfu7ZoHk++tDzyKowu45NC+7D88XnOpeekoMj1SQHUhagJBKfeFONB5zBKtF6MExoQE0vKDIMECgDta0Y0fAc9yyKLk4jUDBSK7/uSqi534o6fryVqyO9MdL8BdKNe7Ff5x6nr6CwxTJowAn+RAHc5xK6N05zvo3G+REAt14dyc=" >> $CREDENTIALS_FILE

#Iniciar el terraform
cd examen3
cd Proyecto
terraform init
terraform plan
terraform apply -auto-approve



