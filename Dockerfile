FROM lindockerryan/mujoco-py:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
# Set Python3 as the default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Set the working directory inside the container
WORKDIR /app

COPY . /app/r3m
RUN git clone https://github.com/suraj-nair-1/metaworld.git metaworld

WORKDIR /app/metaworld
RUN pip install --no-cache-dir -e .

WORKDIR /app/r3m
RUN pip install --no-cache-dir -e .