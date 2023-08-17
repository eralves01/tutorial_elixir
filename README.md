# Como executar esses projetos

Este é um guia simples para ajudar você a baixar e rodar os projetos que estão na linguagem elixir. 
Certifique-se de ter o Elixir instalado em seu sistema antes de começar. 
Se ainda não tiver instalado, você pode seguir as instruções de instalação no site oficial do [Elixir](https://elixir-lang.org/install.html).

O projeto é composto por duas aplicações:

- rabbitmq_producer: Neste projeto, está demonstrada a forma de conexão com o RabbitMQ e o envio de mensagens.
- rabbitmq_consumer: Neste projeto, está demonstrada a forma de conexão com o RabbitMQ e o consumo das mensagens que se encontram em uma fila específica.
  
Ambos os projetos utilizam a biblioteca AMQP.

## Passos Básicos

Siga os passos abaixo para baixar as dependências, compilar e executar os projetos:

### 1. Clonar o Repositório

Comece clonando o repositório do projeto usando o seguinte comando:

```bash
git clone https://github.com/eralves01/tutorial_elixir.git
```

### 2. Navegar para o Diretório do Projeto

Navegue para cada um dos diretórios do projeto que você acabou de clonar:

```bash
cd rabbitmq_producer
```

### 3. Instalar Dependências

O próximo passo é instalar as dependências necessárias para o projeto. No mundo Elixir, usamos o gerenciador de pacotes mix para fazer isso:

```bash
mix deps.get
```

Isso baixará e instalará todas as dependências definidas no arquivo mix.exs.

### 4. Compilar o Projeto
Após ter todas as dependências instaladas, você pode compilar o projeto usando o comando:

```bash
mix deps.compile
```

Isso compilará o código-fonte do projeto e o deixará pronto para ser executado.

### 4. Executando o rabbitmq_producer

Para executar o projeto e começar a enviar as mensagens para o RabbitMQ, devemos seguir os passos:

```bash
cd rabbitmq_producer
iex -S mix
RabbitmqProducer.Workers.SendMessag.start
```

Utilizando o terminal será possivél escrever as mensagens que serão enviadas.

### 4. Executando o rabbitmq_consumer

Para executar o projeto e começar a receber as mensagens do RabbitMQ, devemos seguir os passos:

```bash
cd rabbitmq_consumer
iex -S mix
```

Utilizando o terminal será possivél ver as mensagens que foram recebidas.
