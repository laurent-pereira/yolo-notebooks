FROM python:3.10-slim

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    libglib2.0-0 \    
    libgl1 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installer les packages Python nécessaires
RUN pip install --upgrade pip \
    && pip install \
        jupyter \
        notebook \
        opencv-python \
        ultralytics \
        supervision \
        roboflow \
        numpy pandas matplotlib seaborn

# Créer un utilisateur
RUN useradd -ms /bin/bash jovyan
USER jovyan
WORKDIR /home/jovyan

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]

