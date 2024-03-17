# Arquitetura VIPER

VIPER é a arquitetura que eu escolhi pare esse projeto, é bem comum nos aplicativos iOS usando UIKit é o mais próximo da arquitetura limpa escrita por  [Robert C. Martin (Uncle Bob)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

# View

A view representada pela ViewController no UIKit tem responsabilidade de apenas receber as ações do usuário e repassar para a presenter que vai notificar a view caso seja necessário.

# Interactor

O interactor também conhecido como Use Case é a parte principal do projeto responsável pela lógica de negócios e se comunica com a presenter e os Data Sources.

# Presenter

Sua responsabilidade é pedir os dados para o Interactor conforme é solicitado pelo usuário, enviar para view apresentar essas informações e também cuidar da navegação.

# Entity

A entity contém os modelos básicos usados pelo Interactor

# Router

O Router é o que cuida da navegação, qual tela deve ser apresentado, ele é escrito como Wireframe também mas nesse projeto eu optei por utilizar como Coordinator.

# Data Source

Os Data Sources são responsáveis por gerar os dados para o Interactor, podendo ser dados locais ou de APIs, no projeto eu estou nomeando como Provider o Data Source da API REST.
