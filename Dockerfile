ARG BASE_CONTAINER=jupyter/datascience-notebook
FROM $BASE_CONTAINER

# The `rsession` binary that is called by nbrsessionproxy to start R doesn't seem to start
# without this being explicitly set
ENV LD_LIBRARY_PATH /usr/local/lib/R/lib

USER ${NB_USER}
RUN pip3 install --no-cache-dir jupyter-rsession-proxy

ENV RSESSION_PROXY_RSTUDIO_1_4 yes

CMD jupyter notebook --ip 0.0.0.0
