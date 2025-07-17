all:

push:
	scp -P 2222 -r ../Inception ncrombez@localhost:~/Documents/

nginx:
	docker build -t nginx:current srcs/requirements/nginx
	run nginx:current

clean:
	docker image prune