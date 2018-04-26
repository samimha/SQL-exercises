drop database if exists ex5;
create database ex5;
use ex5;

create table enemytype(
    id int not null auto_increment,
    name varchar(40) not null,
    attack int not null,
    defence int not null,
    primary key (id)
);

create table tiletype(
    id int not null auto_increment,
    name varchar(40) not null,
    attackDifficulty int not null,
    moveDifficulty int not null,
    primary key (id)
);

create table objecttype(
    id int not null auto_increment,
    name varchar(40) not null,
    primary key (id)
);

create table tile(
    xcoord int not null,
    ycoord int not null,
    tiletypeId int not null,
    primary key (xcoord, ycoord),
    foreign key (tiletypeId) references tiletype (id)
);

create table enemy(
    id int not null auto_increment,
    enemytypeId int not null,
    health int not null,
    xcoord int,
    ycoord int,
    primary key (id),
    foreign key (enemytypeId) references enemytype (id),
    foreign key (xcoord, ycoord) references tile (xcoord, ycoord)
);

create table player(
    id int not null auto_increment,
    name varchar(40) not null,
    lvl int not null,
    health int not null,
    money int not null,
    xcoord int not null,
    ycoord int not null,
    primary key (id),
    foreign key (xcoord, ycoord) references tile (xcoord, ycoord)
);

create table object(
    id int not null auto_increment,
    objecttypeId int not null,
    xcoord int,
    ycoord int,
    playerId int,
    primary key (id),
    foreign key (xcoord, ycoord) references tile (xcoord, ycoord),
    foreign key (playerId) references player (id)
);

create table otherobject(
    objectId int not null,
    healtheffect int,
    moneyeffect int,
    primary key (objectId),
    foreign key (objectId) references object (id)
);

create table gunobject(
    objectId int not null,
    attackeffect int,
    defenceeffect int,
    primary key (objectId),
    foreign key (objectId) references object (id)
);

select * from tiletype;
insert into tiletype (name, attackDifficulty, moveDifficulty) values('F', 60, 5),('R', 10, 10),('M', 65, 100);
update tiletype set moveDifficulty = 50 where id = 1;
insert into tile values (0, 2, 2),(0, 1, 3),(0, 0, 3),(1, 2, 2),(1, 1, 3),(1, 0, 1),(2, 2, 2),(2, 1, 2),(2, 0, 2),(3, 2, 2),(3, 1, 1),(3, 0, 1);
insert into player(name, lvl, health, money, xcoord, ycoord) values('Jani', 10, 100, 500, 0, 0);
insert into enemytype(name, attack, defence) values('orc', 50, 40),('spider', 20, 50),('snake', 30, 50);
insert into enemy(enemytypeId, health, xcoord, ycoord) values(1, 90, 0, 2),(2, 0, 2, 2), (3, 50, 1, 2), (1, 90, 1, 1);
insert into objecttype(name) values('misc object'),('weapon');
insert into object(objecttypeId, xcoord, ycoord) values(1, 0, 1);
insert into object(objecttypeId, playerId) values(2, 1);
insert into object(objecttypeId, xcoord, ycoord) values(2, 1, 0);
--error in player fix below
--update player set id = 1 where id = 3;
insert into player(name, lvl, health, money, xcoord, ycoord) values('Jukka', 6, 80, 300, 2, 0);
insert into gunobject(objectId, attackeffect, defenceeffect) values(2, 25, 25);
insert into gunobject(objectId, attackeffect, defenceeffect) values(3, 30, 30);
insert into otherobject(objectId, healtheffect, moneyeffect) values(1, 50, 30);

--source C:\Users\Sami\Documents\SQL\ex5.sql