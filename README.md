# docker-gpu-anaconda-jupyter
Dockerfile for Docker container with GPU compatibility. Creates an Anaconda Env, from which Jupyter Noteboook runs.

---

To run it, build with:

`docker build -t <image-name> .`

filling <image-name> with the desired name for the image. To run it:

`nvidia-docker run -it -v $PWD/notebooks:/notebooks -p 8888:8888 <image-name>`

This will make Jupyter Lab run at localhost:8888. It also mounts a `notebooks` directory, present inside the host's directory from which the `run` command was executed to the container's `/notebooks` directory, and this is where Jupyter Notebook runs from.

When prompted for password, current value configured is `root`.

If Jupyter Notebook is desired (instead of Jupyter Lab), it suffices to change "lab" to "notebook" in the last line of the Dockerfile.
