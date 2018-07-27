# MSIADAF
Inteligência Artificial - Departamento de Assistência Farmacêutica do Ministério da Saúde

# Preparação do Ambiente
1. Instalar o python3 via gerenciador de pacote do Sistema Operacional
 
    ```bash
      # MacOS X
      $ brew install python3
    ```

1. Instalar o jupyter notebook via gerenciador de pacote do Python3 (pip3)

    ```bash
      # Todos Sistemas Operacionais
      $ pip3 install jupyter notebook
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
