CREATE ROLE DSC_STORE WITH LOGIN PASSWORD '18cpzitc42';

USE database DSC_STORE; 

CREATE DATABASE DSC_STORE WITH OWNER = DSC_STORE ENCODING = 'UTF8'
TABLESPACE = pg_default
CONNECTION LIMIT = -1;


create table PERMISOS(
    id_permiso integer primary key,
    nombre varchar(30) not null,
    estado bit(1) not null
);

select * from PERMISOS;

create table CATEGORIA(
    id_categoria serial primary key,
	nombre varchar(50) not null,
	estado bit(1) not null
);

select * from CATEGORIA;





create table USUARIOS(
	identificacion integer primary key not null,
	nombres varchar(50) not null,
	primer_apellido varchar(50) not null,
	segundo_apellido varchar(50) not null,
	correo varchar(50) not null,
	direccion varchar(60) not null,
	permiso integer not null,
	numero_telefonico varchar(12) null,
	contraseña varchar(15) not null,
	FOREIGN KEY (permiso) REFERENCES PERMISOS(id_permiso)
);

select * from USUARIOS;


create table PRODUCTOS(
	codigo_producto integer primary key not null,
	nombre varchar(50) not null,
	descripcion varchar(250) null,
	precio decimal(11,2) not null,
	categoria integer not null,
	foto varchar(250) not null,
	FOREIGN KEY (categoria) REFERENCES CATEGORIA(id_categoria)
);

select * from PRODUCTOS;

create table FACTURA(
	id_factura serial primary key,
	id_usuario integer not null,
	created_at timestamp without time zone DEFAULT now (),
	total decimal (11,2)null,
	FOREIGN KEY (id_usuario) REFERENCES USUARIOS(identificacion)
);

select * from FACTURA;


create table DETALLE_FACTURA(
	id serial primary key,
	id_detallefactura integer not null,
	id_factura integer not null,
	id_articulo integer not null,
	cantidad integer not null,
	precio decimal(11,2)null,
	descuento decimal(11,2) null,
	FOREIGN KEY (id_factura) REFERENCES FACTURA(id_factura),
	FOREIGN KEY (id_articulo) REFERENCES PRODUCTOS(codigo_producto)
);

select * from DETALLE_FACTURA;

