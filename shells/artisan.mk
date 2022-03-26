init:
	docker-compose up -d --build
	docker-compose exec app rm -rfv vendor/ public/storage bootstrap/cache/*.tmp bootstrap/cache/*.php compsoer.lock
	docker-compose exec app composer install && composer update
	docker-compose exec app php artisan storage:link
	docker-compose exec app chmod -R 777 storage bootstrap/cache
	@make permisisons
	@make optimize
	@make fresh

test:
	docker-compose exec app php artisan test
migrate:
	docker-compose exec app php artisan migrate
seed:
	docker-compose exec app php artisan db:seed
migrate-seed:
	docker-compose exec app php artisan migrate:fresh --seed
rollback:
	docker-compose exec app php artisan migrate:fresh
	docker-compose exec app php artisan migrate:refresh
tinker:
	docker-compose exec app php artisan tinker

optimize:
	docker-compose exec app php artisan view:cache
	docker-compose exec app php artisan event:cache
	docker-compose exec app php artisan event:clear
	docker-compose exec app php artisan optimize:clear
	docker-compose exec app php artisan clear-compiled
	docker-compose exec app composer clear-cache
	docker-compose exec app composer dump-autoload -o
	docker-compose exec app php artisan optimize