all:

push:
	scp -P 2222 -r ../Inception ncrombez@localhost:~/Documents/


nginx:
	docker build -t nginx:current srcs/requirements/nginx
	docker run -it -p 443:443 nginx:current

mariadb:
	docker build -t mariadb:current srcs/requirements/mariadb
	docker run -v /var/data:/var/lib/mysql  mariadb:current

wordpress:
	docker build -t wordpress:current srcs/requirements/wordpress
	docker run wordpress:current\

clean:
	docker container prune -f
	docker image prune -f

