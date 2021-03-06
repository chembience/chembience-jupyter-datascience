ARG build_label
FROM chembience/jupyter:$build_label
LABEL maintainer="markussitzmann@gmail.com "

ENV PATH /opt/conda/bin:$PATH

COPY requirements.txt /

RUN CONDA_PY=36 conda config --add channels conda-forge && \
    CONDA_PY=36 conda create --name java_env scijava-jupyter-kernel && \
    bin/bash -c "source activate java_env"

RUN /bin/bash -c "source activate chembience" && \
    CONDA_PY=36 conda install --yes --file /requirements.txt
