-- redshift
-----------------------------------------
create table mytable(
  id int primary key,
  test_json super
);

insert into mytable (id, test_json)
values (1, json_parse('{"house": {"bedroom": ["bed", "nightstand"]}}'));

insert into mytable (id)
values (2);

update mytable
set test_json = json_parse('{"house": {"living_room": ["couch", "television"]}}');

create table cars(
  id int primary key,
  test_json super
);

insert into cars (id, test_json)
values (1, json_parse('{"motor_vehicle": {"Company": "Toyota"}}'));

select
  id,
  json_extract_path_text(json_serialize(event_data_text.motor_vehicle), 'company') as car
from 
  cars
where
  company = 'Toyota';
-------------------------------------------------------------------
/* for postgres:

please also read this for information on when to use json vs jsobb data type (SUPER is only used in Redshift):
https://stackoverflow.com/questions/22654170/explanation-of-jsonb-introduced-by-postgresql
*/
--------------------------------------------------------------------

create table cars(
  id int primary key,
  test_json json
);

insert into cars (id, test_json)
values (1, '{"motor_vehicle": {"Company": "Toyota"}}');

insert into cars (id, test_json)
values (2, '{"motor_vehicle": {"Company": "Honda"}}');

insert into cars (id, test_json)
values (3, '{"motor_vehicle": {"Company": "Ford"}}');

select * from cars;

with my_parser as(
	select
		id,
		test_json->'motor_vehicle'->>'Company' as company
	from 
	  cars)
select * from my_parser where company = 'Honda';
