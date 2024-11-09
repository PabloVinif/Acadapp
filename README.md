## 1. Ligar o Banco de Dados (json-server)

Inicie o `json-server` para rodar a API localmente, utilizando o comando abaixo. O banco de dados será monitorado a partir do arquivo `db.json` na porta `3000`:


json-server --watch db.json --port 3000


Isso iniciará a API e você poderá acessar os dados em `http://localhost:3000`.

## 2. Atualizar Dependências

Execute o seguinte comando para instalar ou atualizar as dependências do projeto Flutter:


flutter pub get


Isso garantirá que todas as dependências definidas no arquivo `pubspec.yaml` sejam baixadas e instaladas.

## 3. Rodar o App

Para rodar o aplicativo Flutter no dispositivo ou emulador, use o comando:


flutter run


Este comando irá compilar e executar o app na plataforma de sua escolha (Android, iOS, Web, etc.).

## 4. Rodar os Testes

Para rodar os testes unitários do projeto, use o comando:


flutter test


Isso executará os testes definidos no diretório `test/`.



