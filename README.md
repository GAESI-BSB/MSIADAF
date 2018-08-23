# MSIADAF
Inteligência Artificial - Departamento de Assistência Farmacêutica do Ministério da Saúde

# Preparação do Ambiente
1. Instalar o python3 via gerenciador de pacote do Sistema Operacional
 
    ```bash
      # MacOS X
      $ brew install python3
      
      # Linux
      $ apt-get install python3
    ```
    
1. Remover o elo (link) do python2 para tornar o python3 como default

    ```bash
      # MacOS X
      $ nano ~/.bash_profile
      
      # Ubuntu
      $ nano ~/.bashrc
    ```
    
    ```.bash_profile
      # bash_profile
      
      # aliases
      alias pip=pip3
      alias python=python3

      [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
     ```
     
    ```bash
      $ source ~/.bash_profile
    ```     

1. Configuração do Virtual Env (VENV)
    
    1. Criação do VENV
        ```bash
           # Vem instalado com o PIP, não precisa instalar o VirtualEnv
           $ virtualenv -p python3 venv
        ```
    
    1.  Ativando o VENV (faça isso toda vez que for executar o projeto)
        ```bash
            $ source venv/bin/activate
        ```

1. Instalando as dependências com as versões unificadas

    ```bash
        $ pip install -r requirements.txt
    ```
    
1. __SE NÃO INSTALAR CORRETAMENTE SIGA OS PRÓXIMOS PASSOS__

1. Instalar o jupyter (execute esses comandos com o VENV ativo)

    ```bash
      # Todos Sistemas Operacionais
      $ pip install jupyter notebook
    ```

1. Instalando a dependencia da computação em núvem (floydhub):

    ```bash
      # Todos Sistemas Operacionais
      $ pip install -U floyd-cli
    ```       

1. Com o __ambiente ativo__, instale o tensorflow

    ```bash
      # Todos Sistemas Operacionais
      $ pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.9.0-py3-none-any.whl
    ```

1. Instalar o gerenciador de extensões do jupyter

    ```bash
        $ pip install jupyter_contrib_nbextensions
    ``` 

__OBSERVAÇÃO: Não atualize (upgrade) o pip! O tensorflow 1.9 é compatível com o pip instalado neste processo!__ Caso faça o Upgrade, execute o comando a seguir, com o env ativo:

```bash
 $ sudo pip install --force-reinstall pip==10.0.1
```
    
__Se aparecer stacktrace no import do tensorflow no arg async significa que existem 2 pythons interpreters rodando o tensorflow e você deve executar um uninstall do tensorflow fora do env conda__:

```bash
 $ deactivate
 $ pip uninstall tensorflow
```
