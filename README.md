
# SSHorizon Manager

**SSHorizon Manager** é uma ferramenta de linha de comando (CLI) projetada para simplificar o gerenciamento de usuários e conexões SSH em servidores VPS. Ele oferece um conjunto abrangente de comandos para criar, remover, monitorar e gerenciar usuários, além de integrar-se com serviços como V2Ray e XRay.

## Visão Geral

Este projeto automatiza tarefas administrativas comuns em servidores, tornando o gerenciamento de múltiplos usuários e serviços mais eficiente. Com um único executável, administradores podem controlar o ciclo de vida dos usuários, limites de conexão, datas de expiração e muito mais, diretamente do terminal.

## Instalação

A instalação é realizada através de um script que baixa e configura o executável `sshorizon` no sistema. Para instalar, execute o seguinte comando como superusuário:

```bash
curl -s -L https://raw.githubusercontent.com/GuardianOFC/manager/main/install.sh | bash
```

O script de instalação irá:
1. Baixar o binário apropriado para a arquitetura do seu sistema (`aarch64` ou `x86_64`).
2. Mover o executável para `/usr/local/bin/sshorizon`.
3. Conceder permissões de execução.
4. Criar os diretórios e certificados SSL necessários.
5. Configurar e reiniciar o serviço SSH.

## Documentação da CLI (Interface de Linha de Comando)

O `sshorizon` (referido como `executavel` nos exemplos) oferece uma variedade de flags para gerenciar seu servidor.

### Gerenciamento de Usuários SSH

| Ação | Comando | Exemplo de Uso |
| :--- | :--- | :--- |
| **Criar Usuário** | `--create_ssh --user <nome> --pass <senha> [--limit <n>] [--days <n>]` | `./executavel --create_ssh --user Guardian --pass teste123 --limit 1 --days 31` |
| **Deletar Usuário** | `--delete_ssh --user <nome>` | `./executavel --delete_ssh --user Guardian` |
| **Criar Usuário de Teste** | `--create_test --user <nome> [--limit <n>] [--minutes <n>]` | `./executavel --create_test --user testuser --limit 1 --minutes 30` |
| **Listar Usuários** | `--list_ssh` | `./executavel --list_ssh` |
| **Listar Usuários Online** | `--listonline [--count]` | `./executavel --listonline --count` |
| **Remover Expirados** | `--remove_expired_ssh` | `./executavel --remove_expired_ssh` |
| **Renovar Usuário** | `--renew_ssh --user <nome>` | `./executavel --renew_ssh --user Guardian` |
| **Alterar Expiração** | `--change_expiry --user <nome> --days <n>` | `./executavel --change_expiry --user Guardian --days 60` |
| **Alterar Limite** | `--change_limit --user <nome> --limit <n>` | `./executavel --change_limit --user Guardian --limit 2` |
| **Alterar Senha** | `--change_pass --user <nome> --pass <nova_senha>` | `./executavel --change_pass --user Guardian --pass novasenha456` |
| **Obter Informações** | `--get_user_info --user <nome>` | `./executavel --get_user_info --user Guardian` |

### Recursos Adicionais (V2Ray/XRay)

Estes comandos permitem a integração com os serviços V2Ray e XRay.

| Flag | Descrição | Exemplo de Uso |
| :--- | :--- | :--- |
| `--add_uuid` | Adiciona um cliente ao V2Ray. | `./executavel --create_ssh --user v2user --pass 123 --add_uuid` |
| `--add_xray` | Adiciona um cliente ao XRay. | `./executavel --create_ssh --user xruser --pass 123 --add_xray` |
| `--rem_uuid` | Remove um cliente do V2Ray. | `./executavel --rem_uuid --user v2user` |
| `--rem_xray` | Remove um cliente do XRay. | `./executavel --rem_xray --user xruser` |
| `--uuid <uuid>` | Define um UUID personalizado para o cliente. | `./executavel --create_ssh --user customid --pass 123 --add_uuid --uuid "seu-uuid-aqui"` |
| `--email <email>` | Define um e-mail para identificação do cliente. | `./executavel --create_ssh --user usermail --pass 123 --add_uuid --email "user@example.com"` |
| `--list_v2ray` | Lista todos os clientes V2Ray. | `./executavel --list_v2ray` |
| `--list_xray` | Lista todos os clientes XRay. | `./executavel --list_xray` |
| `--sshv2` | Cria um usuário SSH e um cliente V2Ray simultaneamente. | `./executavel --create_ssh --user sshv2user --pass 123 --sshv2` |
| `--checkAndRemoveExpiredV2RayUsers` | Verifica e remove usuários V2Ray expirados. | `./executavel --checkAndRemoveExpiredV2RayUsers` |


## Interface TUI (Terminal User Interface)

Além da CLI, o **SSHorizon Manager** oferece uma interface de usuário baseada em texto (TUI) para uma experiência de gerenciamento mais interativa. Para acessá-la, basta executar o comando `sshorizon` sem nenhum argumento.

![Painel de Controle TUI](https://i.postimg.cc/8CxQ3X3D/IMG-20260204-150152-793.jpg)

O painel de controle exibe informações vitais da VPS e um menu com as seguintes opções:

| Opção | Descrição |
| :--- | :--- |
| **[01]** | **Gerenciador de Usuários**: Funções gerais de gerenciamento de usuários. |
| **[02]** | **Gerenciador SSH**: Gerenciamento específico para usuários SSH. |
| **[03]** | **Gerenciador V2Ray**: Gerenciamento de clientes V2Ray. |
| **[04]** | **Gerenciador XRay**: Gerenciamento de clientes XRay. |
| **[05]** | **Gerenciador Slow**: Gerenciamento de conexões "Slow DNS". |
| **[06]** | **Gerenciador Open**: Gerenciamento de conexões OpenVPN. |
| **[07]** | **Limiter Usuários**: Limitar o número de conexões por usuário. |
| **[08]** | **Em Desenvolvimento**: Funcionalidades futuras. |
| **[09]** | **Funções Extras**: Outras ferramentas e utilitários. |
| **[10]** | **Teste de Velocidade**: Medir a velocidade da conexão do servidor. |
| **[11]** | **Otimizar VPS**: Scripts para otimização de performance. |
| **[12]** | **Informações do Sistema**: Exibir detalhes do hardware e software. |
| **[13]** | **Atualizar Script**: Baixar a versão mais recente do gerenciador. |
| **[14]** | **Sair**: Encerrar a interface TUI. |
