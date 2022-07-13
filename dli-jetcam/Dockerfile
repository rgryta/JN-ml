FROM nvcr.io/nvidia/l4t-ml:r32.7.1-py3
RUN python3 -m pip install -e git+https://github.com/NVIDIA-AI-IOT/jetcam#egg=jetcam
RUN apt-get update
RUN apt-get install -y git cmake libpython3-dev python3-numpy
WORKDIR /usr/src
RUN git clone --recursive https://github.com/dusty-nv/jetson-inference
WORKDIR /usr/src/jetson-inference
RUN mkdir build
RUN sed -i 's/nvcaffe_parser/nvparsers/g' CMakeLists.txt 
WORKDIR /usr/src/jetson-inference/build
RUN cmake  -DENABLE_NVMM=OFF ../
RUN make -j$(nproc)
RUN make install
RUN ldconfig
WORKDIR /home/nvidia
CMD ["/bin/sh", "-c", "/bin/bash -c \"jupyter lab --ip 0.0.0.0 --port 8888 --allow-root &> /var/log/jupyter.log\" & \techo \"allow 10 sec for JupyterLab to start @ http://$(hostname -I | cut -d' ' -f1):8888 (password nvidia)\" && \techo \"JupterLab logging location:  /var/log/jupyter.log  (inside the container)\" && \t/bin/bash"]

