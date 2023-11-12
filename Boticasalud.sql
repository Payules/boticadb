drop database if exists BoticaSalud;
create database BoticaSalud;
use BoticaSalud;

create table Usuario(
	id int auto_increment primary key,
    Nombre char(20),
    Apellido char(20),
    Dni char(8) unique,
    Correo char (35) unique,
    Passwordd char(15),
    Celular char(9),
    idDireccionUsuario int references DireccionUsuario
);

create table DireccionUsuario(
	id int auto_increment primary key,
    Direccion char(70)not null,
    Interior char(15),
    Referencia char(50)not null,
    Tipo char(8)not null
);


create table Botica(
	id int auto_increment primary key,
    idDepartamento int references Departamento,
    idProvincia int references Provincia,
    idDistrito int references Distrito,
    RazonSocial char(80)not null,
    Direccion char(50)not null
);

create table Departamento (
  idDepartamento int primary key auto_increment,
  Detalle char(30) unique 
);

create table Provincia (
  idProvincia int primary key auto_increment,
  idDepartamento int references Departamento,
  Detalle char(30) unique 
);
  
create table Distrito (
  idDistrito int primary key auto_increment,
  idProvincia int references Provincia,
  Detalle char(30) not null 
);
  
create table Categoria(
	idCategoria int auto_increment primary key,
    Detalle char(30)not null
);

create table SubCategoria(
	idSubCategoria int auto_increment primary key,
	IdCategoria int references Categoria,
    Detalle char(30)not null
);

create table Producto(
    id int auto_increment primary key,
    idCategoria int references Categoria,
	idSubCategoria int references SubCategoria,
    Nombre char (20)unique not null, 
    Detalle char(30)not null,
    Precio decimal (8,2)not null
);

create table Ofertas(	
	id int auto_increment primary key,
	idProducto int references Producto,
	Descripcion char(30)not null,
    Descuento decimal(5,2)not null,
    FeInicio date,
    FeFin date
);

create table Carrito(
	id int auto_increment primary key,
	idProducto int references Producto,
	Cantidad int not null,
    idDireccion int references Direccion
);

create table Pago(
	id int auto_increment primary key,
    Tipo char (15) not null
);
insert  Usuario (Nombre, Apellido, Dni, Correo, Celular, idDireccionUsuario) values
						('Juan', 'Pérez','12345678', 'juan.perez@email.com','123456789',1),
						('María', 'Gómez','23456789', 'maria.gomez@email.com','234567890',2),
						('Luis', 'Rodríguez','34567890', 'luis.rodriguez@email.com', '345678901',3),
						('Ana', 'Martínez','45678901', 'ana.martinez@email.com', '456789012',4),
						('Pedro', 'Sánchez','56789012', 'pedro.sanchez@email.com', '567890123',5);

insert DireccionUsuario (Direccion, Interior, Referencia, Tipo) values ('Calle Principal 123', NULL, 'Frente a la plaza', 'Mi Casa'),
																		('Avenida Secundaria 456', 'Piso 7B', 'Cerca del supermercado', 'Oficina'),
																		('Calle Secundaria 789', NULL, 'Al lado del parque', 'Otros'),                                                              
																		('Avenida Comercial 555', 'Local 12', 'En el centro comercial', 'Oficina'),
																		('Calle Residencial 321', NULL, 'Cerca de la iglesia', 'Mi Casa');

insert Categoria (Detalle) values ('Cuidadido Personal y Velleza'),('Maná y Bebé'),('Medicini y tratamientos'),('Primeros Auxilios');-- ('Vitaminas y Suplementos'),('Fitness y Nutricion');

insert SubCategoria (idCategoria, Detalle) Values 
							(1,'Accesorios'),
							(1,'Afeitado'),
                            (1,'Cosmeticos'),


                            (2,'Mama'),
                            (2,'Bebes'),
                            (2,'lacancia'),
                            
                            (3,'Alergias'),
                            (3,'Femenino'),
                            (3,'Infantil'),
                            
                            (4,'Alcohol'),
                            (4,'Algodon'),
                            (4,'Desinfectantes');
			
insert Producto (idCategoria, idSubCategoria, Nombre, Detalle, Precio) values 
							(1,1, 'Accesorio1', 'Marca Venus', 50.00),(1,1, 'Accesorio2', 'Marca tiabguis', 50.00),
							(1,2, 'Accesorio3', 'Afeitadoras', 60.50),(1,2, 'Accesorio4', 'mazimas', 60.50),
							(1,3, 'Accesorio5', 'Cosmeticos', 72.00),
							(2,4, 'Accesorio6', 'Pañales', 56.00),(2,4, 'Accesorio7', 'pañalines', 56.00),
							(2,5, 'Accesorio8', 'Papilla', 90.00),(2,5, 'Accesorio9', 'papillon', 90.00),
							(2,6, 'Accesorio12', 'Lactantes', 74.50),
							(3,7,'Accesorio15', 'Bismotol', 80.50),
							(3,8, 'Accesorio16', 'Cremas Derma', 45.00),(3,8, 'Accesorio17', 'Cremas Dermatoica', 45.00);

insert Ofertas (idProducto, Descripcion, Descuento, FeInicio, FeFin) values
							(1, 'Super Promo', 5.00, '2023-10-23', '2023-11-01'),
							(2, 'Promo Inicial', 10.00, '2023-10-25', '2023-11-05'),
							(3, 'Promocion Final', 15.00, '2023-10-27', '2023-11-10'),
							(4, 'Promocion Felicidades', 18.00, '2023-10-27', '2023-11-10');
                            
insert Carrito (idProducto, Cantidad, idDireccion) values (2, 3, 1);

insert Pago (Tipo) values	('Tarjeta de Crédito'),('PayPal'),('Efectivo');

-- ----------------Vistas--------
create view vDepartamentos as select * from Departamento;
create view vProvincia as select * from Provincia;
create view vDistrito as select * from Distrito;
create view vProductos as select p.id, c.Detalle as Categoria, s.Detalle as SubCategoria, p.Nombre, p.Detalle, p.Precio 
													from Producto p,Categoria c, SubCategoria s 
													where p.idCategoria = c.idCategoria and p.idSubCategoria = s.idSubCategoria;
-- -------------- Procedimientos-----------
create procedure sp_Departamentos()
	select d.Detalle as Departamento, b.Razonsocial as Boticas, b.Direccion from botica b 
																			inner join departamento as d on b.idDepartamento = d.idDepartamento;
-- call sp_Departamentos();
create procedure sp_ByDepartamento(IN _nombreDepartamento char(30))
    select d.Detalle as Departamento, b.RazonSocial as Boticas, b.Direccion from Botica b
																			inner join Departamento d ON b.idDepartamento = d.idDepartamento
																			where d.Detalle = _nombreDepartamento;
-- call sp_ByDepartamento('Arequipa');

create procedure sp_ByProvincia(IN _nombreProvincia char(30))
	select p.Detalle AS Provincia, b.RazonSocial AS Boticas, b.Direccion from Botica b
																		inner join Provincia p on B.idProvincia = P.idProvincia
																		where p.Detalle = _nombreProvincia;
-- call sp_ByProvincia('Arequipa');

create procedure sp_ByDistrito(IN _nombreDistrito char(30))
	select d.Detalle as Distrito, b.RazonSocial as Boticas, b.Direccion from Botica b
																		inner join Distrito d on B.idDistrito = D.idDistrito
																		where D.Detalle = _nombreDistrito;

-- call sp_ByDistrito('Arequipa');

create procedure sp_Categoria() select c.Detalle as Categoria, p.Nombre as Producto from Categoria c, SubCategoria s, Producto p
																				where c.idCategoria = s.IdCategoria and s.idSubCategoria = p.idSubCategoria;
        
-- call sp_Categoria();

create procedure sp_BySubCategoria(in _nombreSubcategoria char(30))
	select s.Detalle as Subcategoria, p.Nombre as Producto from SubCategoria s, Producto p where s.idSubCategoria = p.idSubCategoria and s.Detalle = _nombreSubcategoria;
-- call sp_BySubCategoria('Accesorios');

create procedure sp_ProdBYIdONombre(in _idONombre char(30))
    select p.id, p.Nombre, p.Detalle, p.Precio
    from Producto p
    where p.id = _idONombre or p.Nombre = _idONombre;
    
-- call sp_ProdBYIdONombre('Accesorio2');
-- call sp_ProdBYIdONombre(2);
/*

create procedure CalcularPrecioConDescuento(in productoId int)
    declare productoPrecio decimal(8,2);
    declare descuento decimal(5,2);
    
    -- Obtener el precio del producto
    select Precio into productoPrecio from Productos where Id = productoId;
    
    -- Calcular el descuento si existe una oferta para el producto
    select Descuento into descuento from Ofertas where IdProductos = productoId and CURDATE() between FeInicio and FeFin;
    
    -- Si hay un descuento, calcular el precio con descuento
    if descuento is not null then
        set productoPrecio = productoPrecio - (productoPrecio * (descuento / 100));
    end if;
    
    -- Devolver el precio calculado
    select productoPrecio as PrecioConDescuento;

-- CALL CalcularPrecioConDescuento(2);
*/


							
