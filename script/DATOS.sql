CREATE DATABASE CRUD_PERSONA_DB;
USE CRUD_PERSONA_DB;

/*CREACION DE LA TABLA*/

CREATE TABLE persona_tb
(
idpersona int not null auto_increment,
nombre varchar(100),
apellido varchar(100),
dni char(8),
correo varchar(50),
primary key (idpersona)
);

/*INSERTANDO DATOS*/

INSERT INTO persona_tb (nombre, apellido, dni, correo) VALUES ('Marco','Beltran','70574250','marcobeltran@gmail.com');
INSERT INTO persona_tb (nombre, apellido, dni, correo) VALUES('Laura','Quiroz','10545154','laura@gmail.com');
INSERT INTO persona_tb (nombre, apellido, dni, correo) VALUES ('Gladys','Trillo','98989854','gladys@gmail.com');

/*CREANDO PROCEDIMIENTO ALMACENADO*/
/*LISTAR*/
DELIMITER $$
CREATE PROCEDURE personalistar_sp ()
SELECT * FROM persona_tb;

CALL personalistar_sp ();

/*LISTAR POR ID*/
DELIMITER $$
CREATE PROCEDURE personalistar_id_sp (IN id int)
SELECT * FROM persona_tb WHERE idpersona = id;

CALL personalistar_id_sp (2);

/*AGREGAR*/
DELIMITER $$
CREATE PROCEDURE personaagregar_sp
(
IN nom varchar(100),
IN ape varchar(100),
IN dni char(8),
IN email varchar(50)
)
INSERT INTO persona_tb (nombre, apellido, dni, correo) VALUES (nom, ape, dni, email);

CALL personaagregar_sp ('Coco','Bayle','25454521','coco@gmail.com');
/*Registro para el Json de Post en Postman*/
/*{"nombre": "Marquito", "apellido": "Beltran", "dni": "10102040", "correo": "marcob@gmail.com"}*/

/*ACTUALIZAR*/
DELIMITER $$
CREATE PROCEDURE personaactualizar_sp
(
IN id int,
IN nom varchar(100),
IN ape varchar(100),
IN dni char(8),
IN email varchar(50)
)
UPDATE persona_tb SET nombre = nom, apellido = ape, dni = dni, correo = email WHERE idpersona = id;

CALL personaactualizar_sp (1,'Antonio','Trillo','75541220','marco@gmail.com');
/*Actualizar para el Json de Post en Postman*/
/*{"idpersona": 3, "nombre": "Marcoquito", "apellido": "Beltran1", "dni": "10102040", "correo": "marcob@gmail.com"}*/

/*ELIMINAR*/
CREATE PROCEDURE personaeliminar_sp (IN id int)
DELETE FROM persona_tb WHERE idpersona = id;

CALL personaeliminar_sp (1);