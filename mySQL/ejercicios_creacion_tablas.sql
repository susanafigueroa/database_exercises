create database proves;
use proves;





/*ejercicio1:
 * crea una tabla llamada Treball con los campos nombre, edat, carrec,
 * siento los campos nombre y carrec con una longitud máxima de 20 y 50
 * respectivamente. La KP será el nombre.
 */

create table Treball (
	nom varchar(20) primary key, 
	edat tinyint,
	carrec varchar(50) not null
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio2:
 * crea una tabla llamada Ciutat con los campos nombre, comarca, provincia, habitantes.
 * los campos textuales tendrán una longitud máxima de 25 carácteres.
 * Ninguno podrá ser nulo, excepto el nombre de habitantes y la KP será el nombre de la ciutat.
 */

drop table if exists Ciutat;
create table Ciutat (
	nom varchar(25) primary key,
	comarca varchar(25) not null,
	provincia varchar(25) not null,
	habitants mediumint
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio3:
 * crea una tabla llamada Client con los campos idclient, nom, cognoms, data 
 * de nacimiento y tipo. el campo idclient será autonúmerico, los nombres-
 * apellidos serán únicos, y el tipo pillará el valor por defecto 'Habitual'.
 */

drop table if exists Client;
create table Client (
	idclient int unsigned auto_increment primary key,
	nom varchar(25) not null,
	cognoms varchar(25) not null,
	naixement date,
	tipus varchar(25) default 'Habitual',
	unique (nom, cognoms)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio4:
 * crea una tabla Departament con los campos número (numérico de longitud2),
 * nombre(char de longitud 9) y localización (char de longitud 10)
 * como valor único el nombre y como KP el número de departamento.
 */

drop table if exists Departament;
create table Departament(
	numero tinyint(2) unsigned primary key,
	nom varchar(9) unique not null,
	localitzacio varchar(10) not null
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio 5:
 *queremos crear una tabla con el nombre PRODUCTO donde guardaremos un código
 *numérico único, el nombre, la descripción, la categoría y el precio
 *
 *también crearemos una tabla donde guardaremos las características del 
 *fabricante (tabla FABRICANT) y de cada uno pondremos un código
 *de fabricante único, el nombre, la dirección web y un teléfono de contacto
 *
 *ambas tablas están conectadas
 *
 *los campos en forma de texto tendrán una longitud máxima de 20 carácteres
 *(excepto que veamos que se puede reducir la medidaç
 **/

	/*observo que es relación m productos - 1 fabricante*/
	/*por tanto la productos tendrá la KF de fabricante*/
	/*empiezo creando la tabla Fabricante que no tiene forana*/

drop table if exists Fabricant;
create table Fabricant(
	codi int unsigned auto_increment primary key,
	nom varchar(20) not null,
	web varchar(20) not null,
	telefon char(15) default ''
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;


drop table if exists Producte;
create table Producte (
	id int unsigned auto_increment primary key,
	nom varchar(20) not null,
	descripcio varchar(20) not null,
	categoria varchar(20) not null,
	preu decimal(5,2) unsigned not null,
	codi_fabricant int unsigned,
	constraint foreign key (codi_fabricant) references Fabricant(codi)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;



	

/*ejercicio6:
 * un instituto quiere almacenar en una base de datos las asignaturas que
 * se cursan, los profesores que las imparten y los alumnos que realizan
 * cada asignatura.
 * 
 * de las asignaturas queremos guardar el código de la asignatura (3letras), el nombre de la
 * asignatura, el ciclo al que pertenece y el curso al que pertenece.
 * 
 * de cada profesor queremos almacenar un código numérico de progesor, su 
 * nombre, los apellidos, la fecha de nacimiento, la dirección y el teléfono.
 * 
 * de cada alumno guardaremos un código numérico único, el nombre, los
 * apellidos, la fecha de nacimiento, la dirección y su teléfono. También
 * queremos guardar cuando se hizo la primera matrícula.
 * 
 * los campos en forma de texto tendrán una longitud máxima de 20 carácteres.
 */

drop table if exists Alumnes;
create table Alumnes(
	codi int unsigned auto_increment primary key,
	nom varchar(20) not null,
	cognoms varchar(20) not null,
	naixement date,
	adreca varchar(20) not null,
	telèfon char(15) default ''
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;

drop table if exists Assignatures;
create table Assignatures(
	codi char(3) primary key,
	nom varchar(20) not null,
	cicle varchar(20) not null,
	curs smallint,
	codi_alumne int unsigned,
	constraint foreign key (codi_alumne) references Alumnes(codi)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;

drop table if exists Professors;
create table Professors(
	codi int unsigned auto_increment primary key,
	nom varchar(20) not null,
	cognoms varchar(20) not null,
	naixement date,
	adreca varchar(20) not null,
	telèfon char(15)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;

drop table if exists Assignatures_Professors;
create table Assignatures_Professors(
	codi_assignatures char(3) not null,
	codi_professors int unsigned,
	constraint primary key (codi_assignatures, codi_professors),
	constraint foreign key (codi_assignatures) references Assignatures(codi)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;