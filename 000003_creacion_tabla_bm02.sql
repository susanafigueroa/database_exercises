drop database if exists bdm02;
create database bdm02;
use bdm02;


/*create Poblacions
 * relació 1 - m amb la taula Escoles
 * relació 1 - m amb la taula Alumnes
 */
drop table if exists Poblacions;
create table Poblacions (
	codi int unsigned auto_increment primary key,
	nom varchar(20) unique not null
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;


/*create Escoles
 * relació m - 1 amb la taula Poblacions (KF de Poblacions)
 * relació m - n amb la taula Activitats -> taula pibot
 * relació 1 - m amb la taula Alumnes (KF dAlumnes)
 */
drop table if exists Escoles;
create table Escoles (
	id_escoles int unsigned auto_increment primary key,
	codi_escola char(5) unique not null,
	nom varchar(20) not null,
	codi_poblacions int unsigned not null,
	constraint foreign key (codi_poblacions) references Poblacions(codi) on delete no action on update cascade
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;


/*create Alumnes
 * relació m - 1 amb la taula Escoles (KF dEscoles) -> id_escoles
 * relació m - 1 amb la taula Poblacions (KF de Poblacions) -> codi
 */
drop table if exists Alumnes;
create table Alumnes (
	id_alumnes int unsigned auto_increment primary key,
	codi_alumne char(5) unique not null,
	nom varchar(20) not null,
	cognom varchar(20) not null,
	telefon varchar(20) not null default '',
	id_escoles int unsigned not null,
	codi_poblacions int unsigned not null,
	constraint foreign key (id_escoles) references Escoles(id_escoles) on delete no action on update cascade,
	constraint foreign key (codi_poblacions) references Poblacions(codi) on delete no action on update cascade
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;


/*create Activitats
* relació m - n amb la taula Escoles -> taula pibot
*/
drop table if exists Activitats;
create table Activitats (
	id int unsigned auto_increment primary key,
	nom varchar(20) not null
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;


/*create Activitats_Escoles
 * taula pibot
 * PK = PK d'Activitats + PK Escoles
 * FK d'Activitats (id)
 * FK d'Escoles (id_escoles)
 */
drop table if exists Activitats_Escoles;
create table Activitats_Escoles (
	id_escoles int unsigned not null,
	id_activitats int unsigned not null,
	places tinyint(2) unsigned not null,
	puntuacio decimal(3,1) unsigned not null,
	constraint primary key (id_escoles, id_activitats),
	constraint foreign key (id_escoles) references Escoles(id_escoles),
	constraint foreign key (id_activitats) references Activitats(id)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;
