use DDS
go

if exists 
  (select * from sys.tables
   where name = 'fact_communication_subscription')
drop table fact_communication_subscription
go

create table fact_communication_subscription
( customer_key                 int      not null
, communication_key            int      not null
, channel_key                  int      not null
, subscription_start_date_key  int      not null
, subscription_end_date_key    int      not null
, subscription_status_key      int      not null
, source_system_code           tinyint  not null
, create_timestamp             datetime not null
, update_timestamp             datetime not null
, constraint pk_fact_communication_subscription
  primary key clustered
  ( communication_key, customer_key, subscription_start_date_key ) 
  on dds_fg4
, constraint fk_fact_communication_subscription_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
, constraint fk_fact_communication_subscription_dim_communication
  foreign key (communication_key)
  references dim_communication(communication_key)
, constraint fk_fact_communication_subscription_dim_channel
  foreign key (channel_key)
  references dim_channel(channel_key)
, constraint fk_fact_communication_subscription_dim_date1
  foreign key (subscription_start_date_key)
  references dim_date(date_key)
, constraint fk_fact_communication_subscription_dim_date2
  foreign key (subscription_end_date_key)
  references dim_date(date_key)
, constraint fk_fact_communication_subscription_dim_subscription_status
  foreign key (subscription_status_key)
  references dim_subscription_status(subscription_status_key)
) on dds_fg5
go

-- Build indexes:

if exists 
  (select * from sys.indexes 
   where name = 'fact_communication_subscription_customer_key'
   and object_id = object_id('fact_communication_subscription'))
drop index fact_communication_subscription.fact_communication_subscription_customer_key
go

create index fact_communication_subscription_customer_key
  on fact_communication_subscription(customer_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_communication_subscription_communication_key'
   and object_id = object_id('fact_communication_subscription'))
drop index fact_communication_subscription.fact_communication_subscription_communication_key
go

create index fact_communication_subscription_communication_key
  on fact_communication_subscription(communication_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_communication_subscription_channel_key'
   and object_id = object_id('fact_communication_subscription'))
drop index fact_communication_subscription.fact_communication_subscription_channel_key
go

create index fact_communication_subscription_channel_key
  on fact_communication_subscription(channel_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_communication_subscription_subscription_start_date_key'
   and object_id = object_id('fact_communication_subscription'))
drop index fact_communication_subscription.fact_communication_subscription_subscription_start_date_key
go

create index fact_communication_subscription_subscription_start_date_key
  on fact_communication_subscription(subscription_start_date_key)
  on dds_fg6
go
