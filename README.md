# News App

Este é um aplicativo de notícias desenvolvido em Flutter, com foco no uso de **TDD (Test-Driven Development)** e **Bloc** para gerenciamento de estado. O app consome notícias de uma API pública e as exibe por categorias, utilizando blocos de construção sólidos, modularização e boas práticas de programação.

## Funcionalidades

- Listagem de notícias por categorias.
- Busca de notícias.
- Consumo de API para obter notícias em tempo real.
- Armazenamento local das categorias selecionadas (opcional).
- UI moderna e responsiva.

## Tecnologias Utilizadas

- **Flutter**: Framework para construção da interface e interação.
- **HTTP**: Para consumo de APIs RESTful.
- **Bloc**: Padrão para gerenciamento de estado.
- **TDD**: Desenvolvimento orientado a testes.
- **Mockito e bloc_test**: Para mocks e testes unitários/integração.
- **Dotenv**: Para armazenar a chave da API.

## Estrutura do Projeto

O projeto segue uma estrutura baseada em **Clean Architecture**, com a separação clara das camadas:

```
lib/ 
    ├── core/ # Arquivos comuns como modelos e utilitários 
    ├── data/ # Repositórios e fontes de dados (API) 
    ├── presentation/ # Camada de UI e gerenciamento de estado (Bloc) 
    └── main.dart # Arquivo principal
```

## Como Executar o Projeto

1. Clone este repositório:
```
   git clone https://github.com/alluke96/news_app.git
   cd news_app
```
2. Instale as dependências:
```
    flutter pub get
```
Crie uma conta em um provedor de API de notícias, como NewsAPI, e obtenha uma chave de API.

Crie um arquivo .env para armazenar sua chave de API.

Execute o projeto no emulador ou dispositivo físico:
```
    flutter run
```

## Testes
O projeto foi desenvolvido utilizando TDD. Para rodar os testes:
```
    flutter test
```

## Contribuição
Fique à vontade para abrir issues ou enviar PRs com melhorias!

## Licença
Este projeto está sob a licença MIT.