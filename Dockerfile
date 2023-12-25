FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3.8-venv\
    python3-pip \
    cmake \
    git \
    build-essential \
    libopencv-dev \
    python3-opencv \
    xvfb

# Create a venv
RUN python3.8 -m venv venv

# Activate venv
SHELL ["/bin/bash", "-c"]
RUN source venv/bin/activate

# Set the working directory to /app
WORKDIR /app
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt 
RUN  pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip3 install matplotlib

# Clone opencv2.4 source from the provided link
#RUN git clone https://github.com/opencv/opencv.git && \
#    cd opencv && \
#    git checkout 2.4.13.6

# Build and install opencv from source
#WORKDIR /app/opencv/release
#RUN cmake -D MAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/venv/local/ -D PYTHON3_EXECUTABLE=/venv/bin/python3.8 -D PYTHON3_PACKAGES_PATH=/venv/lib/python3.8/site-packages .. && make -j8 &&  make install
# Optionally, handle the Eigen/MatrixFunctions compilation error
# Note: Update the path accordingly if necessary
#
#RUN sed -i 's|/modules/contrib/src/rgbdodometry.cpp|/usr/include/eigen3/&|' /app/opencv/modules/contrib/src/rgbdodometry.cpp

#WORKDIR /app
COPY . /app

# Run a basic command
CMD ["xvfb-run", "python3", "push_net_main.py", "-d"]
