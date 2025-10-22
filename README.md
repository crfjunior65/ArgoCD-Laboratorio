
# Laboratório de Estudos com ArgoCD

Este repositório contém um laboratório de estudos sobre GitOps utilizando o ArgoCD. O objetivo é demonstrar os conceitos de GitOps e o funcionamento do ArgoCD na prática, utilizando um ambiente Kubernetes no Azure (AKS) e uma aplicação de exemplo.

## Visão Geral

O laboratório utiliza os seguintes componentes:

*   **ArgoCD**: Ferramenta de entrega contínua GitOps para Kubernetes.
*   **Azure Kubernetes Service (AKS)**: Cluster Kubernetes gerenciado no Azure. O script `aks-3nodes.sh` pode ser utilizado para criar o ambiente.
*   **Aplicação de Exemplo**: Um deployment do Nginx com um exporter para o Prometheus, disponível no diretório `k8s-deploy-nginx-example`.
*   **Descomplicando o ArgoCD**: Um guia de estudos em português para o ArgoCD, disponível no diretório `DescomplicandoArgoCD`.

## O que é o Argo CD?

Argo CD é uma ferramenta de entrega contínua GitOps declarativa para o Kubernetes. Ele segue o padrão GitOps de usar repositórios Git como fonte da verdade para definir o estado desejado da aplicação.

## Arquitetura do Laboratório

O laboratório consiste em:

1.  **Cluster Kubernetes (AKS)**: Um cluster Kubernetes de 3 nós no Azure.
2.  **ArgoCD**: Instalado no cluster Kubernetes, monitorando este repositório Git.
3.  **Repositório Git**: Este repositório, contendo os manifestos da aplicação Nginx e a configuração do ArgoCD.
4.  **Aplicação Nginx**: A aplicação de exemplo que será implantada e gerenciada pelo ArgoCD.

## Conteúdo do Repositório

*   `aks-3nodes.sh`: Script para criar um cluster AKS de 3 nós.
*   `k8s-deploy-nginx-example/`: Contém os manifestos Kubernetes para a aplicação Nginx de exemplo.
    *   `nginx-configmap.yaml`: ConfigMap para a configuração do Nginx.
    *   `nginx-deployment.yaml`: Deployment da aplicação Nginx com um sidecar de exporter do Prometheus.
    *   `nginx-service.yaml`: Service para expor a porta de métricas do Prometheus.
*   `DescomplicandoArgoCD/`: Guia de estudos em português sobre o ArgoCD.
*   `Imagens/`: Imagens utilizadas na documentação.

## Começando

1.  **Crie o cluster Kubernetes**: Utilize o script `aks-3nodes.sh` ou crie um cluster Kubernetes de sua preferência.
2.  **Instale o ArgoCD**: Siga as instruções de [início rápido](https://argo-cd.readthedocs.io/en/stable/getting_started/) do ArgoCD para instalar o ArgoCD no seu cluster.
3.  **Configure o ArgoCD**: Configure o ArgoCD para monitorar este repositório Git e implantar a aplicação Nginx. Você pode seguir o guia `DescomplicandoArgoCD` para um passo a passo detalhado.

## Guia de Estudos

O diretório `DescomplicandoArgoCD` contém um guia completo em português para aprender a utilizar o ArgoCD. Ele aborda desde a instalação e configuração até a criação de aplicações e o uso de recursos avançados.

