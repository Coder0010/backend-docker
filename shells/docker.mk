up:
	docker-compose up -d
up-build:
	docker-compose up -d --build
build:
	docker-compose build
	@make up
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
conf:
	docker-compose config
ps:
	docker-compose ps
php-bash:
	docker-compose exec php bash
nginx-bash:
	docker-compose exec nginx bash
mysql-bash:
	docker-compose exec mysql bash -c 'mysql -u$$MYSQL_USER -p$$MYSQL_PASSWORD'
phpmyadmin-bash:
	docker-compose exec phpmyadmin bash
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-php:
	docker-compose logs php
log-php-watch:
	docker-compose logs --follow php
log-nginx:
	docker-compose logs nginx
log-nginx-watch:
	docker-compose logs --follow nginx
log-mysql:
	docker-compose logs mysql
log-mysql-watch:
	docker-compose logs --follow mysql
log-phpmyadmin:
	docker-compose logs phpmyadmin
log-phpmyadmin-watch:
	docker-compose logs --follow phpmyadmin