# CountryApp




## Visão Geral

Este aplicativo iOS, construído com **SwiftUI**, busca e exibe informações sobre países da API REST Countries. Os usuários podem navegar por uma lista de países, pesquisar por países específicos e visualizar informações detalhadas sobre cada país, incluindo sua bandeira, brasão, capital, região, população e muito mais.


https://github.com/user-attachments/assets/75812005-dfff-4a4f-aef7-79d168b0c00a


## Funcionalidades

*   **Lista de Países:** Exibe uma lista de países obtidos da API REST Countries.
*   **Funcionalidade de Pesquisa:** Permite aos usuários pesquisar países por nome, com debounce de 300ms para otimizar as chamadas de rede.
*   **Visualização Detalhada do País:** Fornece informações detalhadas sobre um país selecionado, incluindo seu nome oficial, capital, região, sub-região, população, área, bandeira e brasão.
*   **Navegação:** Usa `NavigationView` e `NavigationLink` do SwiftUI para navegação entre as telas.
*   **Interface de Usuário Moderna:** Construído com SwiftUI para uma interface de usuário moderna, declarativa e responsiva.
*   **Carregamento de Imagem:** Usa **Kingfisher** para carregamento assíncrono de imagens, com opção de usar `AsyncImage` nativo do SwiftUI.

## Tecnologias Utilizadas

*   **Swift:** Linguagem de programação.
*   **SwiftUI:** Framework de interface do usuário.
*   **REST Countries API:** Fonte de dados.
*   **URLSession:** Para comunicação com a API (requisições de rede).
*   **Combine:** Para programação reativa e tratamento de eventos assíncronos.
*   **Kingfisher:** Biblioteca de carregamento e cache de imagens (opcionalmente, pode-se usar `AsyncImage`).
*   **Codable:** Protocolo para serialização/desserialização de JSON.

## Arquitetura

O projeto segue a arquitetura Model-View-ViewModel (MVVM).

*   **Model:** Classes de dados representando informações do país (`Country`, `CountryName`, `CountryFlags`, `CountryCoatOfArms`).
*   **View:** Views SwiftUI representando a interface do usuário (`CountryListView`, `CountryDetailsView`, `CountryRow`).
*   **ViewModel:** `CountryListViewModel` e `CountryDetailsViewModel` lidam com a busca de dados, pesquisa, formatação de dados e gerenciamento de estado.
*   **Networking:** `APIService` encapsula as chamadas à API usando `URLSession`.

## Estrutura do Projeto

```
CountryApp/
├── Model/              # Modelos de dados
│   └── Country.swift
├── ViewModel/          # ViewModels
│   ├── CountryListViewModel.swift
│   └── CountryDetailsViewModel.swift
├── Networking/         # Camada de rede
│   └── APIService.swift
├── View/               # Views (SwiftUI)
│   ├── CountryListView.swift
│   ├── CountryDetailsView.swift
│   └── Components/      # Componentes reutilizáveis
│       └── CountryRow.swift
├── Extensions/
│   └── URLImage.swift   # (Opcional) Se não usarmos o Kingfisher
├── App/
│   ├── CountryAppSwiftUIApp.swift  # Ponto de entrada do app
│   └── ContentView.swift           # View inicial (não utilizada diretamente)
└── Resources/          # Imagens, fontes, etc. (Assets.xcassets)

``` 

## Instalação

Para instalar o projeto, siga os seguintes passos:

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/MizaelDouglasDeMello/CountryApp-SwiftUI
    ```
2.  **Abra o projeto no Xcode:**
    *   Abra o arquivo `CountryApp.xcodeproj` ou `CountryApp.xcworkspace` (se usar CocoaPods) no Xcode.
3.  **Instale as dependências (se necessário):**
    *   **Swift Package Manager:** Se o projeto usa o Swift Package Manager, o Xcode deve baixar as dependências automaticamente. Caso contrário, vá em `File > Packages > Resolve Package Versions`.
    *   **CocoaPods:** Se o projeto usa CocoaPods, abra o Terminal, navegue até a pasta do projeto e execute:
        ```bash
        pod install
        ```
    *   **Carthage:** Se o projeto usa Carthage, abra o Terminal, navegue até a pasta do projeto e execute:
        ```bash
        carthage update --use-xcframeworks
        ```
4.  **Compile e execute o aplicativo no simulador ou em um dispositivo físico.**

## Xcode

*   Versão 16 ou superior.
*   Swift 6 ou superior.

## Contribuições

Contribuições são bem-vindas! Se você encontrar algum problema ou tiver sugestões de melhorias, por favor, abra uma *issue* ou envie um *pull request*.

