HOST_NAME=`hostname`
hugo server --bind=0.0.0.0 --port=8083 --baseURL=http://$HOST_NAME:8083/