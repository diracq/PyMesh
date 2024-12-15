FROM ghcr.io/diracq/python-base:latest

# Install PyMesh
WORKDIR /root/
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    git \
    cmake \
    libgmp-dev \
    libmpfr-dev \
    libgmpxx4ldbl \
    libboost-dev \
    libboost-thread-dev \
    tar \
    zstd \
    zip \
    unzip \
    patchelf && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    git clone --single-branch -b main https://github.com/diracq/PyMesh.git

ENV PYMESH_PATH /root/PyMesh
ENV NUM_CORES 2
WORKDIR $PYMESH_PATH

RUN git submodule update --init
RUN bash -c "source ~/.bashrc && conda activate common_env && python setup.py build"

# Create a tarball of the PyMesh directory with build products
RUN tar --use-compress-program=zstd -cf /root/PyMesh.tar.zst -C /root PyMesh
CMD ["cat", "/root/PyMesh.tar.zst"]
