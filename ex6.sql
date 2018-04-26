--1
select *
from player;
--2
select name, attack, defence 
from enemytype;
--3
select name 
from tiletype 
order by name;
--4
select name 
from tiletype 
where attackDifficulty > 5;
--5
select enemy.id, enemytype.name 
from enemy 
inner join enemytype 
on enemy.enemytypeId = enemytype.id 
where health <= 0;
--6
select tile.xcoord, tile.ycoord, tiletype.attackDifficulty, tiletype.moveDifficulty
from tile
inner join tiletype
on tile.tiletypeId = tiletype.id;
--7
--a
select name
from objecttype, object
where objecttype.id = object.objecttypeId
and object.playerId is not null;
--b
select objecttype.name 
from objecttype 
inner join object 
on object.objecttypeId = objecttype.id 
and object.playerId is not null;
--c
select name
from objecttype
where objecttype.Id in
(select objecttypeId from object
where object.playerId is not null);
--8
select name
from objecttype
inner join object
on objecttype.id = object.objecttypeId
inner join gunobject
on object.id = gunobject.objectId
where defenceeffect > 0;
--9
select enemy.id, enemy.health, tiletype.name
from enemy
inner join tile
on enemy.xcoord = tile.xcoord 
and enemy.ycoord = tile.ycoord
inner join tiletype
on tile.tiletypeId = tiletype.id;
--10
select count(*) 
from enemy;
--11
select count(*) 
from tile
inner join tiletype
on tile.tiletypeId = tiletype.id
where tiletype.name = 'r';
--12
select healtheffect, moneyeffect
from otherobject
inner join object
on otherobject.objectId = object.id
inner join tile
on object.xcoord = tile.xcoord and object.ycoord = tile.ycoord
inner join tiletype
on tile.tiletypeId = tiletype.id
where tiletype.name = 'r';
--13
select max(enemytype.name), count(enemy.id) as numberOfEnemies
from enemytype
left join enemy
on enemytype.id = enemy.enemytypeId
group by enemytype.id;
--14
select name
from tiletype
inner join tile
on tiletype.id = tile.tiletypeId
inner join object
on tile.xcoord = object.xcoord and tile.ycoord = object.ycoord
inner join gunobject
on object.id = gunobject.objectId
where (select max(gunobject.attackeffect));
--15
select name
from enemytype
inner join enemy
on enemytype.id = enemy.enemytypeId
group by enemy.enemytypeId
order by count(enemy.enemytypeId) desc
limit 1;
