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
      # Todos Sistemas Operacionais
      $ nano ~/.bash_profile
    ```
    
    ```.bash_profile
      # bash_profile
      
      # alias
      pip=pip3
      python=python3

      [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
     ```

1. Instalar o jupyter notebook via gerenciador de pacote do Python3 (pip3)

    ```bash
      # Todos Sistemas Operacionais
      $ pip install jupyter notebook
    ```

1. Instalando a dependencia da computação em núvem (floydhub):

    ```bash
      # Todos Sistemas Operacionais
      $ sudo pip install -U floyd-cli
    ```   

1. Instalar o MiniConda:

    1. [(Todos)Python 3.6](https://conda.io/miniconda.html)
    1. [(MacOS X)Python 3.6](https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh)
    1. [(Ubuntu - 64Bits)Python 3.6](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)
    1. [(Ubuntu - 32Bits)Python 3.6](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86.sh)
    
1. Criar o ambiente no MiniConda

    ```bash
      # Todos Sistemas Operacionais
      $ conda create -n ms_daf_ia pip python=3.6
    ```

1. Ativando o ambiente no MiniConda

    ```bash
      # Todos Sistemas Operacionais
      $ source activate ms_daf_ia
    ```

1. Desativando o ambiente no MiniConda

    ```bash
      # Todos Sistemas Operacionais
      $ source deactivate
    ```
    

1. Com o __ambiente ativo__, instale o tensorflow

    ```bash
      # Todos Sistemas Operacionais
      $ pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.9.0-py3-none-any.whl
    ```

__OBSERVAÇÃO: Não atualize (upgrade) o pip! O tensorflow 1.9 é compatível com o pip instalado neste processo!__ Caso faça o Upgrade, execute o comando a seguir, com o env ativo:

    ```bash
     $ sudo pip install --force-reinstall pip==10.0.1
    ```
