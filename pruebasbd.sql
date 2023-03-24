insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('Bruno','fm_bruno_1@hotmail.com','viernes',17,'12345');
insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('Juan','jpcaudillo12321@gmail.com','jotape',18,'6666');
insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('DANIEL','dannnii@gmail.com','dani',17,'000');
insert into pacientes(nom_pac,correo_pac,alias_pac,edad_pac,password_pac) values ('Ladis','fuenlealladis@gmail.com','ladis',17,'12345678');
insert into doctores(nom_doc, edad_doc,alias_doc,correo_doc,cedula_doc,esp_doc,password_doc) value ('Juan','47','juanin',"pepe@gmail.com","489964","conductual","12345");
insert into doctores(nom_doc, edad_doc,alias_doc,password_doc) value ('Pepe','47','pepepop','12345');
insert into doctores(nom_doc, edad_doc,alias_doc,password_doc) value ('aleks','47','ñop','12345');
select * from doctores where nom_doc='Juan' and password_doc='12345';
insert into doc_pac(id_pac,id_doc) value('1','1');
insert into doc_pac(id_pac,id_doc) value('2','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('hola bruno, como estas?','Juan','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('bien doc, y usted?','viernes','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('como ha esatado?','viernes','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('bien bien gracias','Juan','2/05/22','1');
insert into tabla_mensaje(cont_mensaje,nombre,fecha_msj,id_relacionDP) values ('cacahuates','Bruno','2/05/22','2');

select * from pacientes;
select * from doctores;
select * from doc_pac;
select * from tabla_mensaje;/*
insert into tabla_diario(cont_diar,emocion_diar,titulo_diar,fecha,id_pac) values ('hola mundo','feliz','sip','12/21/2212','1');
select * from tabla_diario;
select * from tabla_mensaje, doc_pac where tabla_mensaje.id_relacionDP = doc_pac.id_relacionDP and doc_pac.id_pac='1';
select * from doc_pac where id_relacionDp = '2';
select * from doc_pac, doctores where id_pac='1' ;*/
select * from tabla_citas, doc_pac where doc_pac.id_relacionDP=tabla_citas.id_relacionDP;
select * from tabla_prentrevista;
select * from doc_pac, doctores where id_pac='4' ;
select * from tabla_mensaje, doc_pac where tabla_mensaje.id_relacionDP = doc_pac.id_relacionDP and doc_pac.id_pac='1';
select * from doc_pac where id_pac = '1';