FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# set working directory 
RUN mkdir -p /workspace/
WORKDIR /workspace

# set userinfo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy files
COPY ./CalibDepth /workspace/CalibDepth

# # install denpendies
RUN apt-get update
RUN apt install -y gcc g++ ffmpeg libsm6 libxext6 git
RUN pip install -r /workspace/CalibDepth/requirements.txt


# # install opencv
# RUN apt-get install libjpeg-dev libtiff5-dev libpng-dev ffmpeg libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev  libx264-dev libxine2-dev
# RUN apt-get install libatlas-base-dev gfortran libeigen3-dev
# RUN mkdir

# # install pytorch
# RUN cd /workspace/sapeon && \
#     bash -y Miniconda3-py310_23.5.2-0-Linux-x86_64.sh && \
#     conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.6 -c pytorch -c nvidia

# # install onnx2sapeon
# RUN cd /workspace/sapeon/onnx2sapeon && \
#     mkdir build && \
#     cd build && \
#     cmake .. && \
#     make -j`nproc`

# # install sapeon_compiler
# RUN cd /workspace/sapeon/sapeon_compiler && \
#     bash ./scripts/generate.sh -a

# # install SapeonRT
# RUN cd /workspace/sapeon/SapeonRT && \
#     mkdir build && \
#     cd build && \
#     cmake .. -DCMAKE_BUILD_TYPE=Release -DINCLUDE_FS=ON && \
#     make -j`nproc`

# # Configuration
# ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/sapeon/sapeon_compiler/build
# ENV SAPEONRT_ENABLE_FS=9999