-- base de datoa de psyche
# 5IM10
drop database if exists psyche;
create database psyche;
use psyche;




create table pacientes(id_pac int primary key not null auto_increment, 
						nom_pac varchar(20),
                        correo_pac varchar(25),
                        alias_pac varchar(20),
                        edad_pac int,
                        password_pac varchar(10));

create table doctores(id_doc int primary key not null auto_increment,
						nom_doc varchar(20),
                        edad_doc int, 
                        password_doc varchar(10));

create table doc_pac(id_relacionDP int primary key not null auto_increment,
					id_pac int,
					foreign key(id_pac) references pacientes(id_pac) on update cascade on delete cascade,
					id_doc int,
					foreign key(id_doc) references doctores(id_doc) on update cascade on delete cascade);
                    
create table tabla_citas(id_cita int primary key not null auto_increment,
						fecha_cita varchar(15),
                        id_relacionDP int,
                        foreign key(id_relacionDP) references doc_pac(id_relacionDP) on update cascade on delete cascade);
                    
create table tabla_test(id_test int primary key not null auto_increment,
						resp_test varchar(50),
                        id_pac int,
                        foreign key(id_pac) references pacientes(id_pac) on update cascade on delete cascade);

create table tabla_diario(id_diario int primary key not null auto_increment,
							cont_diar varchar(800),
                            emocion_diar varchar(15),
                            titulo_diar varchar(50),
                            fecha varchar(15),
                            id_pac int,
							foreign key(id_pac) references pacientes(id_pac) on update cascade on delete cascade
                            );

create table tabla_mensaje(id_mensaje int primary key not null auto_increment, 
							cont_mensaje varchar(255),
                            nombre varchar(25),
                            fecha_msj varchar(15), 
                            id_relacionDP int,
                            foreign key(id_relacionDP) references doc_pac(id_relacionDP) on update cascade on delete cascade); 


insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('Bruno','fm_bruno_1@hotmail.com','viernes',17,'12345');
insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('Juan','jpcaudillo12321@gmail.com','jotape',18,'6666');
insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('DANIEL','dannnii@gmail.com','dani',17,'000');
insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('Ladis','fuenlealladis@gmail.com','ladis',17,'12345678');
insert into doctores(nom_doc, edad_doc,password_doc) value ('Juan','47','12345');
insert into doc_pac(id_pac,id_doc) value('1','1');
insert into doc_pac(id_pac,id_doc) value('2','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('hola bruno, como estas?','Juan','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('bien doc, y usted?','viernes','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('como ha esatado?','viernes','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('bien bien gracias','Juan','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('cacahuates','Bruno','2/05/22','2');
/*
select * from pacientes;
select * from doctores;
select * from doc_pac;
select * from tabla_mensaje;
insert into tabla_diario(cont_diar,emocion_diar,titulo_diar,fecha,id_pac) values ('hola mundo','feliz','sip','12/21/2212','1');
select * from tabla_diario;
select * from tabla_mensaje, doc_pac where tabla_mensaje.id_relacionDP = doc_pac.id_relacionDP and doc_pac.id_pac='1';
select * from doc_pac where id_relacionDp = '2';
select * from doc_pac, doctores where id_pac='1' ;*/
select * from tabla_citas, doc_pac where doc_pac.id_relacionDP=tabla_citas.id_relacionDP;
select * from tabla_citas;
