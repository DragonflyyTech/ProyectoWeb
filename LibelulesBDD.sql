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
                        alias_doc varchar(20),
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
						tipo_test varchar(30),
						resp_test varchar(170),
                        id_pac int,
                        foreign key(id_pac) references pacientes(id_pac) on update cascade on delete cascade);

create table tabla_diario(id_diario int primary key not null auto_increment,
							cont_diar varchar(2000),
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
                            
create table tabla_prentrevista(id_ent int primary key not null auto_increment, 
							razon varchar(1000),
                            conducta varchar(1000),
                            relevancia varchar(1000), 
                            frecuencia varchar(1000), 
                            origen varchar(1000), 
                            id_pac int,
							foreign key(id_pac) references pacientes(id_pac) on update cascade on delete cascade); 