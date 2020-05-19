docker run -p 8888:8888 -v $PWD:/home/jovyan/work:Z -e NB_UID=1001 -e NB_GID=1001 --user root mdabioinfo/sos-notebook jupyter lab --allow-root
