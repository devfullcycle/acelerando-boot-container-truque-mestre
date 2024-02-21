# Repositório sobre como acelerar o boot de container

Aula no Youtube: [Acelerando o boot de containers](https://www.youtube.com/watch?v=3vD6CJ3rj2g)

# Motivação

É muito importante que desenvolvedores conheçam no mínimo, os fundamentos básicos do Docker e saibam usa-lo para desenvolver suas aplicações.

Desenvolver aplicações usando Docker tem uma série de benefícios:

- Desacoplar o ambiente de dev da aplicação da máquina
- Evitar o famoso na "minha máquina funciona"
- Unificar o ambiente de execução entre os devs
- Criar um ambiente mais personalizado para o projeto
- Etc, etc

Neste vídeo/repositório eu vou mostrar alguns truques de mestre de como lidar com containers em desenvolvimento para que eles possam iniciar o mais rápido possível, tornando mais eficiente o ambiente de desenvolvimento.

As dicas estão usado Node.js como exemplo, mas elas podem ser aplicadas para qualquer linguagem.

# Problema demonstrado neste repositório

O problema que vamos resolver é o seguinte: Quando você está desenvolvendo uma aplicação que roda em um container, você precisa que o container inicie o mais rápido possível para que você possa testar as mudanças que você fez no código e um problema que gera muita frustração é como 
instalar as libs do projeto, como Node.js, PHP, Python e etc para que estejam disponíveis no container e também no host. Dependendo de como você faz isso, o container pode demorar muito para iniciar ou as libs não estão disponíveis no host, o que fazerá sua IDE não indexar corretamente o projeto.

A pasta `problem-npm-install-libs-in-image` contém um exemplo de como isso pode ser feito de forma ineficiente. Sempre ao iniciar o container, a `node_modules` é descartada quando o docker copia o código para o container.

# Soluções

## 1. Usar volumes anônimos	

A pasta `solution-fake-npm-install-volume-anonimo` contém um exemplo de como usar volumes anônimos para acelerar o boot do container. O `node_modules` é instalado no container e depois é copiado para um volume anônimo. Sempre que o container é iniciado, o volume anônimo é montado no container, o que faz com que o `node_modules` esteja disponível no container.

Mas, a `node_modules` não está disponível no host. Isso pode ser um problema se você usa uma IDE que depende da indexação do projeto para fornecer recursos como autocompletar, refatoração, etc.

É uma solução, mas funciona somente se você for desenvolver totalmente dentro do container usado soluções como o [Dev container](https://code.visualstudio.com/docs/devcontainers/containers).

## 2. Instalar libs no start do container

A pasta `solution-npm-install-in-container` contém um exemplo de como instalar as libs do projeto no start do container. Isso é feito usando um script que é executado no start do container. O `node_modules` é instalado no container, assim com a configuração convencional do volume, a `node_modules` está disponível no container e no host.

## 3. Instalar libs na image e rsync

A pasta `solution-npm-install-image-with-rsync` contém um exemplo de como instalar as libs do projeto na imagem e usar o `rsync` para copiar as libs para o container. Dentro da imagem é gerado uma pasta com a versão das libs e o `rsync` é usado para copiar a pasta para o container. Isso faz com que o `node_modules` esteja disponível no container e no host e acelera o boot do container, já que o rsync é mais rápido que o comando `cp`.

