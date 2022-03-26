include ${PWD}/shells/artisan.mk
include ${PWD}/shells/docker.mk
# docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
remake:
# remove docker [ images( services ) & volumes & network ]
	@make destroy
	@make init
permissions:
	sudo chmod -R 777 bootstrap/cache/ && sudo chmod -R 777 storage/ && [ -d "vendor/" ] && sudo chmod -R 777 vendor/ && [ -d "node_modules/" ] && sudo chmod -R 777 node_modules/
git-push:
	git add . && git commit -m '$(m)' && git push
server:
	sudo ssh -i "${PWD}/shells/pentify.pem" ubuntu@api.pentify.tk
front-start:
	cd ${PWD}/../pentify_front && yarn start