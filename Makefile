DATA = /Users/borito/inception/data

YAML = ./srcs/docker-compose.yaml

DOCKER = docker-compose -f

all: start

build:
	$(DOCKER) $(YAML) build
start: build
	if [ ! -d "$(DATA)" ]; then mkdir -p $(DATA)/web; mkdir $(DATA)/mariadb; fi;
	$(DOCKER) $(YAML) up -d
logs:
	$(DOCKER) $(YAML) logs
down:
	$(DOCKER) $(YAML) down
clean: 
	$(DOCKER) $(YAML) down -v --rmi local
fclean: clean
	rm -rf $(DATA)

re : fclean all

.PHONY: build all logs down clean fclean re
