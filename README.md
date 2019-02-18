# tensorflow-gpu-py36-jupyter
Dockerfile for Docker container with GPU compatibility. Creates an Anaconda Env, from which Jupyter Noteboook runs.

Current issue: notebook executes in correct environment, but installed packages seem not to be present.

---

To run it, build with:

`docker build -t <image-name> .`

filling <image-name> with the desired name for the image. To run it:

`nvidia-docker run -it -v $PWD/notebooks:/notebooks -p 8888:8888 <image-name>`

This will make jupyter lab run at localhost:8888. It also mounts a `notebooks` directory, present inside the host's directory from which the `run` command was executed to the container's `/notebooks` directory, and this is where Jupyter Notebook runs from.
