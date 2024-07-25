# FROM isaac_ros_dev-aarch64
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
# uodate and install dependencies 
RUN apt-get update && apt-get install -y \
    libyaml-cpp-dev \
    libboost-all-dev\
    build-essential \
    cmake \
    git \
    cmake-qt-gui \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY . /home/flexiv_rdk
RUN cd /home/flexiv_rdk/thirdparty && bash build_and_install_dependencies.sh /home/rdk_install
# RUN cd /home/flexiv_rdk && mkdir build && cd build \
# && cmake .. -DCMAKE_INSTALL_PREFIX=/home/rdk_install -DINSTALL_PYTHON_RDK=ON
# set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]
