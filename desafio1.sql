-- 1.- Crear una base de datos con nombre “Posts”. (1 Punto)
-- 2.- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contenido y descripción. (1 Punto)
create table post (
	id_post serial,
	nombre_usuario varchar (50),
	fecha_creacion varchar (50),
	contenido varchar (50),
	descripcion varchar (50),
	primary key (id_post)
);
-- 3.-Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
-- post pamela 3
insert into post (
nombre_usuario,fecha_creacion,contenido,descripcion)
values ('pamela','20/03/2021','matematica','logaritmo')
-- post pamela 2
insert into post (
nombre_usuario,fecha_creacion,contenido,descripcion)
values ('pamela','20/03/2021','lenguaje','gramatica')
-- post carlos
insert into post (
nombre_usuario,fecha_creacion,contenido,descripcion)
values ('carlos','11/12/2021','historia','guerra mundial')
-- Modificar la tabla post, agregando la columna título. (1 Punto)
alter table post
add column titulo varchar (50)
--Agregar título a las publicaciones ya ingresadas. (1 Punto)
--modificacion2
update post
set titulo = 'log'
where id_post =1;
-- modificacion2
update post
set titulo = 'gramatica'
where id_post =2;
-- modificacion3
update post
set titulo = 'guerra mundial'
where id_post =3;
-- Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
-- pedro1
insert into post (
nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
values ('carlos','20/04/2021','musica','llaves musicales','llaves')
-- pedro2
insert into post (
nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
values ('carlos','29/04/2021','musica','composicion','composicion')
-- me equivoque y puse carlos que pedro
--cambie el nombre de usuario
update post
set nombre_usuario = 'pedro'
where id_post =4;
update post
set nombre_usuario = 'pedro'
where id_post =5;
--Eliminar el post de Carlos. (1 Punto)
delete from post
where id_post = 3 
--Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
insert into post (
nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
values ('carlos','11/12/2021','historia','guerra mundial','guerra mundial')

select * from post;
-- parte dos
-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts. (1 Punto)
create table comentario (
	id_comentario serial,
	id_post_fk serial,
	fecha_creacion varchar(50),
	hora_creacion varchar(50),
	contenido varchar (225),
	primary key (id_comentario),
	foreign key (id_post_fk) references post (id_post)
);
-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos
--pamela1
insert into comentario (fecha_creacion,hora_creacion,contenido)
values ('20/03/2021','matematica','Los logaritmos no pueden tener como base 0, ya que 0 elevado a cualquier potencia distinta de 0 es igual a 0, entonces el proceso de obtener el logaritmo no llegaría a ninguna parte.')
-- para diferencial voy a modificar la tabla para colocar el nombre
alter table comentario
add column comentario_usuario varchar (50)
-- voy agregar el nombre del usuario anterio
update comentario
set comentario_usuario = 'pamela'
where id_comentario =1;
-- pamela2
insert into comentario (fecha_creacion,hora_creacion,contenido,comentario_usuario)
values ('20/03/2021','lenguaje','Si bien solo el 33.5% de las personas encuestadas reconoció este tipo de errores en los perfiles, estos les harían perder el interés en conocer a esas personas.','pamela')
--carlos
insert into comentario (fecha_creacion,hora_creacion,contenido,comentario_usuario)
values ('21/03/2021','lenguaje','auctor massa sed, rhoncus enim. Proin lobortis mauris enim, ac condimentum arcu dapibus in. Donec porta justo nec varius tincidunt. Aenean dictum sapien quis neque rutrum tempus. Nullam nec velit nisi','carlos')
insert into comentario (fecha_creacion,hora_creacion,contenido,comentario_usuario)
values ('20/03/2021','mate','auctor massa sed, rhoncus enim. Proin lobortis mauris enim, ac condimentum arcu dapibus in. Donec porta justo nec varius tincidunt. Aenean dictum sapien quis neque rutrum tempus. Nullam nec velit nisi','carlos')
insert into comentario (fecha_creacion,hora_creacion,contenido,comentario_usuario)
values ('30/03/2021','mate','auctor massa sed, rhoncus enim. Proin lobortis mauris enim, ac condimentum arcu dapibus in. Donec porta justo nec varius tincidunt. Aenean dictum sapien quis neque rutrum tempus. Nullam nec velit nisi','carlos')
-- no me deja agregar otra tabla me sale este error
--ERROR:  insert or update on table "comentario" violates foreign key constraint "comentario_id_post_fk_fkey"
--DETAIL:  Key (id_post_fk)=(10) is not present in table "post".
--Estado SQL: 23503

-- me falto hacer
--3. Crear un nuevo post para "Margarita". (1 Punto)
--4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)

select * from comentario; 