/** Suggested SQL to assist in QA  

  https://bioiqjira.atlassian.net/browse/REPORTS-436?filter=-1

  
*/

The following SQL were used to unit test in dev.
1. Staging tables were truncated (see below) 
2. Pentaho pushed data to the stage-tables - check counts
3. The Ruby Rake Encrption command is then run on the Server
4. Results are verified with this SQL






#mysdu  join tables, data should match 
select sdu.user_key, du.user_key,
 sdu.updated_on, du.updated_on,
 sdu.encrypted_first_name, du.encrypted_first_name,
 sdu.encrypted_last_name, du.encrypted_last_name,
 sdu.encrypted_ssn, du.encrypted_ssn,
 sdu.encrypted_external_pin, du.encrypted_external_pin,
 sdu.ship_addr1, du.ship_addr1,
 sdu.ship_addr2, du.ship_addr2,
 sdu.is_current, du.is_current
 from stage_dim_user sdu, dim_user du
where sdu.user_id = du.user_id
and du.is_current = 1;
;



#stage_dim_user
  select user_key,
  user_id,
  encrypted_first_name,
  core_encrypted_first_name,
  encrypted_last_name
  , core_encrypted_last_name
  , encrypted_ssn
  , core_encrypted_ssn
  , encrypted_external_pin
  , core_encrypted_external_pin
  , bill_addr1
  , core_bill_addr1
  ,  bill_addr2
  , core_bill_addr2
  , ship_addr1
  , core_ship_addr1
  , ship_addr2
  , core_ship_addr2
  , current_encrypted_first_name
  , core_current_encrypted_first_name
  , current_encrypted_last_name
  , core_current_encrypted_last_name
  , is_current
  , is_deleted
   from stage_dim_user
  where core_ship_addr1 is not null
    #where core_ship_addr1 != 'NULL'


    #myevent
select 
 event_key
,encrypted_street
,core_encrypted_street
,encrypted_suite
,core_encrypted_suite
,street
,core_street
,suite
,core_suite
from stage_dim_event
where street is not null
limit 20
;



select 
encrypted_street
,encrypted_suite
,street
,suite
from dim_event
where suite is not null
limit 5
;





#stage_dim_program
select
program_id,
 shipping_address_encrypted_street,
 core_shipping_address_encrypted_street,
 shipping_address_encrypted_suite,
 core_shipping_address_encrypted_suite
 from stage_dim_program
 where core_shipping_address_encrypted_street is not null
;

desc stage_physician_addresses;

#stagetwo_physician_addresses 
select id,
encrypted_street,
core_encrypted_street,stage_dim_insurance_policy
encrypted_suite,
core_encrypted_suite
from stagetwo_physician_addresses
;



 

select * from stage_dim_insurance_policy
;

#stage_dim_insurance_policy
select 
insurance_policy_key,
shipping_address_encrypted_street,
core_shipping_address_encrypted_street, 
shipping_address_encrypted_suite,
core_shipping_address_encrypted_suite
 from stage_dim_insurance_policy
 where core_shipping_address_encrypted_street is not null
;


select * from stage_dim_entity;


#stage_dim_entity
 select 
 entity_key,
shipping_address_encrypted_street,
core_shipping_address_encrypted_street, 
shipping_address_encrypted_suite,
core_shipping_address_encrypted_suite
 from stage_dim_entity
;


 

select * from stage_dim_insurance_policy
;

#stage_dim_insurance_policy
select 
insurance_policy_key,
shipping_address_encrypted_street,
core_shipping_address_encrypted_street, 
shipping_address_encrypted_suite,
core_shipping_address_encrypted_suite
 from stage_dim_insurance_policy
 where core_shipping_address_encrypted_street is not null
;


select * from stage_dim_entity;


#stage_dim_entity
 select 
 entity_key,
shipping_address_encrypted_street,
core_shipping_address_encrypted_street, 
shipping_address_encrypted_suite,
core_shipping_address_encrypted_suite
 from stage_dim_entity
;


#used after the Ruby Job is run to verify data was populated



 #mycount
 select count(1)mycount, 'stage_dim_user' from stage_dim_user
  union
 select count(1)mycount, 'stage_dim_event'  from stage_dim_event
 union
 select count(1)mycount, 'stage_dim_program'  from stage_dim_program
  union
 select count(1)mycount, 'stagetwo_physician_addresses'  from stagetwo_physician_addresses
  union
 select count(1)mycount, 'stage_dim_insurance_policy'  from stage_dim_insurance_policy
  union
 select count(1)mycount, 'stage_dim_entity'  from stage_dim_entity
  union
 select count(1)mycount, 'stage_dim_lab'  from stage_dim_lab



#clear all tables prior to running Ruby Rake commands

#mytrunc
truncate table stage_dim_user;
truncate table stage_dim_event;
truncate table stage_dim_program;
truncate table stagetwo_physician_addresses;
truncate table stage_dim_insurance_policy;
truncate table stage_dim_entity;
truncate table stage_dim_lab;


