all:

push:
	scp -P 2222 -r ../Inception ncrombez@localhost:~/Documents/


nginx:
	docker build -t nginx:current srcs/requirements/nginx
	docker run -p 443:443 nginx:current

mariadb:
	docker build -t mariadb:current srcs/requirements/mariadb
	docker run mariadb:current

clean:
	docker image prune

