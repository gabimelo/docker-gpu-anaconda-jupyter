FROM nvidia/cuda:9.1-cudnn7-runtime

LABEL maintainer 's@muelcolvin.com'

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        software-properties-common \
        python3-pip \
 && add-apt-repository -y ppa:jonathonf/python-3.6 \
 && apt-get update \
 && apt-get install -y python3.6 python3.6-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# pip has to be installed before setuptools, setuptools has to be installed before tensorflow
RUN python3.6 -m pip install --no-cache-dir -U pip
RUN python3.6 -m pip install --no-cache-dir -U setuptools
# also useful
RUN python3.6 -m pip install --no-cache-dir ipython requests numpy pandas quandl jupyter
RUN python3.6 -m pip install --no-cache-dir tensorflow-gpu==1.3.0rc0
RUN ln -s /usr/bin/python3.6 /usr/bin/python

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/notebooks"

RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
