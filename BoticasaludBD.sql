use BoticaSalud;

insert Departamento(Detalle)  values 
	('AREQUIPA'),('CAJAMARCA'),('CALLAO'),('CUSCO'),('ICA'),('JUNIN'),('LA LIBERTAD'),('LAMBAYEQUE'),('LIMA'),('PIURA'),('UCAYALI');

-- AREQUIPA 
insert Provincia(idDepartamento,Detalle) values (1,'AREQUIPA');
insert Distrito(idProvincia,Detalle) values
	(1,'AREQUIPA'),(1,'CAYMA'),(1,'CERRO COLORADO'),(1,'JOSE LUIS BUSTAMANTE Y RIVERO'),(1,'YANAHUARA');
-- CAJAMARCA
insert Provincia(idDepartamento,Detalle) values (2,'CAJAMARCA');
insert Distrito(idProvincia,Detalle) values (2,'CAJAMARCA');
-- CALLAO
insert Provincia(idDepartamento,Detalle) values (3,'Prov.Callao');
insert Distrito(idProvincia,Detalle) values (3,'BELLAVISTA'),(3,'CALLAO'),(3,'CARMEN DE LA LEGUA-REYNOSO'),(3,'LA PERLA');

-- CUSCO
insert Provincia(idDepartamento,Detalle) values (4,'CUSCO');
insert Distrito(idProvincia,Detalle) values (4,'SAN SEBASTIAN'),(4,'WANCHAQ');

-- ICA
insert Provincia(idDepartamento,Detalle) values (5,'ICA');
insert Distrito(idProvincia,Detalle) values (5,'ICA');
    
-- JUNIN
insert Provincia(idDepartamento,Detalle) values (6,'HUANCAYO');
insert Distrito(idProvincia,Detalle) values (6,'HUANCAYO');
    
-- LA LIBERTAD
insert Provincia(idDepartamento,Detalle) values (7,'TRUJILLO');
insert Distrito(idProvincia,Detalle) values (7,'TRUJILLO');
	
-- LAMBAYEQUE
insert Provincia(idDepartamento,Detalle) values (8,'CHICLAYO'),(8,'LAMBAYEQUE');
insert Distrito(idProvincia,Detalle) values (8,'CHICLAYO'),(9,'LAMBAYEQUE');
-- LIMA
insert Provincia(idDepartamento,Detalle) values (9,'BARRANCA'),(9,'HUARAL'),(9,'HUAURA'),(9,'LIMA');
insert Distrito(idProvincia,Detalle) values 
	(10,'BARRANCA'),
    (11,'HUARAL'),
    (12,'HUAURA'),
    (13,'ATE'),(13,'BARRANCO'),(13,'BREÑA'),(13,'CHORRILLOS'),(13,'COMAS'),(13,'INDEPENDENCIA'),(13,'JESUS MARIA'),(13,'LA MOLINA'),(13,'LA VICTORIA'),(13,'LIMA'),
    (13,'LINCE'),(13,'LOS OLIVOS'),(13,'LURIGANCHO'),(13,'LURIN'),(13,'MAGDALENA DEL MAR'),(13,'MIRAFLORES'),(13,'PUEBLO LIBRE'),(13,'RIMAC'),(13,'SAN BORJA'),
    (13,'SAN ISIDRO'),(13,'SAN JUAN DE LURIGANCHO'),(13,'SAN JUAN DE MIRAFLORES'),(13,'SAN MARTIN DE PORRES'),(13,'SANTA ANITA'),(13,'SANTIAGO DE SURCO'),(13,'SURQUOILLO');

-- PIURA
insert Provincia(idDepartamento,Detalle) values (10,'PIURA');
insert Distrito(idProvincia,Detalle) values (14,'PIURA');

-- UCAYALI
insert Provincia(idDepartamento,Detalle) values (11,'CORONEL PORTILLO');
insert Distrito(idProvincia,Detalle) values  (15,'CALLERIA');


insert Botica ( idDepartamento, idProvincia, idDistrito, RazonSocial, Direccion) values
-- AREQUIPA - AREQUIPA
	(1,1,1,'AREQUIPA 2','CAL. PIEROLA NRO. 303'),(1,1,1,'AREQUIPA 4 PAUCARPATA','Cl. PAUCARPATA N. 140'),
    (1,1,1,'AREQUIPA 10 PLAZA GOYENECHE','AV. GOYENECHE NRO. 207'),(1,1,1,'AREQUIPA 12 NUEVO GOYENECHE 3','AV. GOYENECHE NRO. 109 - A'),
    (1,1,1,'AREQUIPA 16 HOSPITAL HONORIO DELGADO','CAL.CLORINDA MATTO DE TURNER NRO. 94 URB. PABLO VI'),
    (1,1,2,'AREQUIPA 9 REAL PLAZA','AV. EJERCITO NRO. 1009 INT. 127'),
    (1,1,3,'AREQUIPA 13 C.C.PALMERAS','AV. AVIACION 602 INT. 2028'),
    (1,1,4,'AREQUIPA 5 EEUU','AV. ESTADOS UNIDOS NRO. 502'),(1,1,4,'AREQUIPA 8 EEUU','AV. ESTADOS UNIDOS MZ. Z LOTE. 15'),
    (1,1,5,'AREQUIPA 14 YANAHUARA','MZA. E LOTE. 10 URB. MAGISTERIAL II'),
-- CAJAMARCA -- CAJAMARCA
	(2,2,6,'JR. AMAZONAS NRO. 504','JR. AMAZONAS NRO. 504'),
-- CALLAO - CALLAO
	(3,3,7,'BELLAVISTA-CALLAO','AV. GUARDIA CHALACA NRO 2165'),(3,3,7,'HOSPITAL NAVAL','AV. VENEZUELA NRO. SN (HOSPITAL NAVAL)'),
    (3,3,8,'CALLAO 1','AV. SAENZ PENA NRO. 746'),(3,3,8,'MINKA 2 CALLAO 14','AV. ARGENTINA NRO. 3093 LOC. 101 CAL. 03 PAB. 09'),(3,3,8,'MINKA 1 CALLAO 3','AV. ARGENTINA NRO. 3093 L 270 '),
    (3,3,9,'CALLAO 11 C DE LA LEGUA','AV. JOSE SANTOS CHOCANO NRO. 124'),(3,3,9,'CALLAO 12 C DE LA LEGUA 5 ','AV. JOSE SANTOS CHOCANO NRO. 110'),(3,3,9,'CALLAO 13 FARUNI 6 YOGO','AV. ELMER FAUCETT NRO. 526 - 530'),
    (3,3,10,'INSURGENTES','AV. INSURGENTES NRO. 701 - 703'),
-- CUSCO -CUSCO
	(4,4,11,'CUSCO 1 LA CULTURA','PROLONGACIÓN AV. DE LA CULTURA '),
    (4,4,12,'CUSCO 2 GARCILASO','AV. GARCILASO NRO. 418'),
 -- ICA  - ICA 
    (5,5,13,'ICA 1 PLAZA DE ARMAS','CAL. LIMA NRO. 185 CON ESQ. CAL'),
-- JUNIN - JUNIN
	(6,6,14,'HUANCAYO 1','CAL. REAL NRO. 604'),(6,6,14,'HUANCAYO 7 GIRALDEZ','AV. GIRALDEZ NRO. 604');
