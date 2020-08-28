Drop database multibodegas;
create database multibodegas;
use multibodegas;

create table Productos(
	ID_Producto varchar (10) primary key,
    Nombre_Producto varchar(35),
    Descripcion varchar(70),
    Precio_Producto int 
 
)engine = InnoDB default charset=latin1;


create table Clientes(
	ID_Cliente varchar (10) primary key,
    Nombre_Cliente varchar(35),
    Nit varchar(70),
    Estatus Varchar(2)
 
)engine = InnoDB default charset=latin1;

create table Inventarios(
	ID_Inventario varchar (10) primary key,
    Nombre varchar(35),
    Estatus Varchar(2)
 
)engine = InnoDB default charset=latin1;



create table Cuentas_Corrientes(
	ID_Cuenta varchar (10) primary key,
    Tipo varchar (20),
    Descripcion Varchar(70),
    Saldo int
 
)engine = InnoDB default charset=latin1;

create table Informes(
	ID_Informe varchar (10) primary key,
    Impuesto int,
    Descripcion Varchar(70),
	Id_Cuenta varchar (10),
    foreign key (Id_Cuenta) references Cuentas_Corrientes(ID_Cuenta)
 
)engine = InnoDB default charset=latin1;


create table Venta_Encabezado(
	ID_Venta Varchar (10) primary key,
    Fecha_Venta Varchar (20),
   
	Total_Venta int ,
    Id_Informe varchar (10),
    Id_Cliente varchar (10),
    foreign key (Id_Informe) references Informes(ID_Informe),
     foreign key (Id_Cliente) references Clientes(ID_Cliente)
    
 
)engine = InnoDB default charset=latin1;

create table Venta_Detalle(
	Orden_Venta varchar (10) primary key,

	Precio_Venta int ,
    Cantidad int ,
    Costo_Venta int,
    Id_Inventario varchar (10),
    Id_Productos varchar (10),
    Id_Venta_Encabezado varchar(10),
    foreign key (Id_Inventario) references Inventarios(ID_Inventario),
     foreign key (Id_Productos) references Productos(ID_Producto),
       foreign key (Id_Venta_Encabezado) references Venta_Encabezado(ID_Venta)
    
 
)engine = InnoDB default charset=latin1;

