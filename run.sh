HOST_NAME=`hostname`
hugo server --bind=0.0.0.0 --port=3100 --baseURL=http://$HOST_NAME:3100/