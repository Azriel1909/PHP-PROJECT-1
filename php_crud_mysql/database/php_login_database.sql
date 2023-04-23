CREATE DATABASE php_login_database;
USE php_login_database;

CREATE TABLE usuario (
	  id  INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(200),
    password VARCHAR(200),
    PRIMARY KEY (id)
);