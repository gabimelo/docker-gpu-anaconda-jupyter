
current issue with new Dockerfile being tested: not executing notebook inside environment

# tensorflow-gpu-py36-jupyter
Dockerfile for Docker container with TensorFlow installed with GPU compatibility, for Python 3.6. Runs Jupyter notebook.

Based off https://hub.docker.com/r/samuelcolvin/tensorflow-gpu-py36/dockerfile

For the moment, it's using old versions of CUDA (8) and TensorFlow (1.3).

---

To run it, build with:

`docker build -t <image-name> .`

Filling <image-name> with the desired name for the image. To run it:

`nvidia-docker run -it -v $PWD/notebooks:/notebooks -p 8888:8888 <image-name>`

This will make jupyter lab run at localhost:8888. It also mounts a `notebooks` directory, present inside the directory from which the `run` command was executed to the container's `/notebooks` directory, and this is where Jupyter Notebook runs from.


