# Makefile for Docker MySQL PHP NGINX  
SHELL := /bin/bash

include .env

docker-start:
	@docker-compose up -d

docker-stop:
	@docker-compose down -v
	@rm -Rf data/db/mysql/*

db-fixtures:
	@docker exec -i $(shell docker-compose ps -q mysqldb) mysql -u"$(MYSQL_ROOT_USER)" -p"$(MYSQL_ROOT_PASSWORD)" < $(MYSQL_DUMPS_DIR)/db.sql 
