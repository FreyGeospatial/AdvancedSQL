-- for postgres / redshift
-----------------------------------------
create table mytable(
  id int primary key,
  test_json super
);

insert into mytable (id, test_json)
values (1, '{"house": {"bedroom": ["bed", "nightstand"]}}'::super);

insert into mytable (id)
values (2);

update mytable
set test_json = json_parse('{"house": {"living_room": ["couch", "television"]}}');
