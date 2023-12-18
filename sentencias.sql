CREATE DATABASE Gimnasio_San_Antonio;
USE Gimnasio_San_Antonio;

CREATE TABLE Persona(
dni varchar (9),
nombre varchar (50) NOT NULL,
primer_apellido varchar (50) NOT NULL,
CONSTRAINT pk_Persona PRIMARY KEY (dni)
);
CREATE TABLE Gimnasio(
nombre varchar (50),
CONSTRAINT pk_Gimnasio PRIMARY KEY (nombre),
);
CREATE TABLE Entrenador(
id int AUTO_INCREMENT,
dniPersona varchar (9) NOT NULL,
salario float (8) NOT NULL,
nombreGimnasio varchar (50),
CONSTRAINT pk_Entrenador PRIMARY KEY (id),
CONSTRAINT fk_Entrenador FOREIGN KEY (dniPersona) REFERENCES Persona (dni),
CONSTRAINT fk_Entrenador_Gimnasio FOREIGN KEY (nombreGimnasio) REFERENCES Gimnasio (nombre)
);
CREATE TABLE Cliente(
id int AUTO_INCREMENT,
dniPersona varchar (9) NOT NULL,
salario float (8) NOT NULL,
CONSTRAINT pk_Cliente PRIMARY KEY (id),
CONSTRAINT fk_Cliente_Persona FOREIGN KEY (dniPersona) REFERENCES Persona (dni)
);
CREATE TABLE Planificacion(
codigo int (8),
fechaCodigo varchar (10) NOT NULL,
CONSTRAINT pk_Planificacion PRIMARY KEY (codigo)
);
CREATE TABLE Cliente_Entrenador_Planificacion(
id int AUTO_INCREMENT,
idCliente int NOT NULL,
idEntrenador int NOT NULL,
codigoPlanficacion int (8) NOT NULL,
CONSTRAINT pk_Cliente_Entrenador_Planificacion PRIMARY KEY (id),
CONSTRAINT fk_Cliente_Entrenador_Planificacion_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (id),
CONSTRAINT fk_Cliente_Entrenador_Planificacion_Entrenador FOREIGN KEY (idEntrenador) REFERENCES Entrenador (id),
CONSTRAINT fk_Cliente_Entrenador_Planificacion_Planificacion FOREIGN KEY (codigoPlanficacion) REFERENCES Planificacion (codigo)
);
CREATE TABLE Entrenamiento(
codigo int (8),
fechaCodigo varchar (10) NOT NULL,
codigoPlanficacion int (8) NOT NULL,
CONSTRAINT pk_Entrenamiento PRIMARY KEY (codigo),
CONSTRAINT fk_Entrenamiento_Planificacion FOREIGN KEY (codigoPlanficacion) REFERENCES Planificacion (codigo)
);
CREATE TABLE Ejercicio(
nombre varchar (50),
numSeries int (2) NOT NULL,
numRepeticiones int (2) NOT NULL,
CONSTRAINT pk_ejercicio PRIMARY KEY (nombre) 
);
CREATE TABLE Entrenamiento_Ejercicio(
id int AUTO_INCREMENT,
codigoEntrenamiento int (8) NOT NULL,
nombreEjercicio varchar (50) NOT NULL,
CONSTRAINT pk_Entrenamiento_Ejercicio PRIMARY KEY (id),
CONSTRAINT fk_Entrenamiento_Ejercicio_Entrenamiento FOREIGN KEY (codigoEntrenamiento) REFERENCES Entrenamiento (codigo),
CONSTRAINT fk_Entrenamiento_Ejercicio_Ejercicio FOREIGN KEY (nombreEjercicio) REFERENCES Ejercicio (nombre)
);
CREATE TABLE Material(
nombre varchar (50),
nombreEjercicio varchar (50) NOT NULL,
CONSTRAINT pk_Material PRIMARY KEY (nombre),
CONSTRAINT fk_Material_Ejercicio FOREIGN KEY (nombreEjercicio) REFERENCES Ejercicio (nombre)
);
CREATE TABLE Material_Ejercicio(
id int AUTO_INCREMENT,
nombreMaterial varchar (50) NOT NULL,
nombreEjercicio varchar (50) NOT NULL,
CONSTRAINT pk_Material_Ejercicio PRIMARY KEY (id),
CONSTRAINT fk_Material_Ejercicio_Material FOREIGN KEY (nombreMaterial) REFERENCES Material (nombre),
CONSTRAINT fk_Material_Ejercicio_Ejercicio FOREIGN KEY (nombreEjercicio) REFERENCES Ejercicio (nombre)
);