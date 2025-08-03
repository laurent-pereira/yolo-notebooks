FROM python:3.10-slim

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    curl \
	ffmpeg \
    wget \
    libglib2.0-0 \    
    libgl1 \
    build-essential \
    python3-skimage \
    && rm -rf /var/lib/apt/lists/*

# Installer les packages Python nécessaires
RUN pip install --upgrade pip \
    && pip install \
    jupyter \
    notebook \
    opencv-python \
    open_clip_torch \
    torchvision \
    ultralytics \
    supervision \
    albumentations \
    deep_sort_realtime \
    roboflow \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-image \
    transformers \
	flask \
	deep_sort_realtime

# Créer un utilisateur
RUN useradd -ms /bin/bash jovyan
USER jovyan
WORKDIR /home/jovyan

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]

