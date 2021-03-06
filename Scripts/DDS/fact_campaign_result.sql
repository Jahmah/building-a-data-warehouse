use DDS
go

if exists 
  (select * from sys.tables
   where name = 'fact_campaign_result')
drop table fact_campaign_result
go

create table fact_campaign_result
( campaign_key            int not null
, customer_key            int not null
, communication_key       int not null
, channel_key             int not null
, send_date_key           int not null
, delivery_status_key     int not null
, sent                    int
, delivered               int
, bounced                 int
, opened                  int
, clicked_through         int
, complaint               int
, spam_verdict            int
, trap_hit                int
, source_system_code      tinyint
, create_timestamp        datetime
, update_timestamp        datetime
, constraint pk_fact_campaign_result
  primary key clustered
  ( campaign_key, send_date_key, customer_key ) 
  on dds_fg4
, constraint fk_fact_campaign_result_dim_campaign
  foreign key (campaign_key)
  references dim_campaign(campaign_key)
, constraint fk_fact_campaign_result_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
, constraint fk_fact_campaign_result_dim_communication
  foreign key (communication_key)
  references dim_communication(communication_key)
, constraint fk_fact_campaign_result_dim_channel
  foreign key (channel_key)
  references dim_channel(channel_key)
, constraint fk_fact_campaign_result_dim_date
  foreign key (send_date_key)
  references dim_date(date_key)
, constraint fk_fact_campaign_result_dim_delivery_status
  foreign key (delivery_status_key)
  references dim_delivery_status(delivery_status_key)
) on dds_fg5
go

-- Build indexes:

if exists 
  (select * from sys.indexes 
   where name = 'fact_campaign_result_campaign_key'
   and object_id = object_id('fact_campaign_result'))
drop index fact_campaign_result.fact_campaign_result_campaign_key
go

create index fact_campaign_result_campaign_key
  on fact_campaign_result(campaign_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_campaign_result_customer_key'
   and object_id = object_id('fact_campaign_result'))
drop index fact_campaign_result.fact_campaign_result_customer_key
go

create index fact_campaign_result_customer_key
  on fact_campaign_result(customer_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_campaign_result_communication_key'
   and object_id = object_id('fact_campaign_result'))
drop index fact_campaign_result.fact_campaign_result_communication_key
go

create index fact_campaign_result_communication_key
  on fact_campaign_result(communication_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_campaign_result_channel_key'
   and object_id = object_id('fact_campaign_result'))
drop index fact_campaign_result.fact_campaign_result_channel_key
go

create index fact_campaign_result_channel_key
  on fact_campaign_result(channel_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_campaign_result_send_date_key'
   and object_id = object_id('fact_campaign_result'))
drop index fact_campaign_result.fact_campaign_result_send_date_key
go

create index fact_campaign_result_send_date_key
  on fact_campaign_result(send_date_key)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'fact_campaign_result_delivery_status_key'
   and object_id = object_id('fact_campaign_result'))
drop index fact_campaign_result.fact_campaign_result_delivery_status_key
go

create index fact_campaign_result_delivery_status_key
  on fact_campaign_result(delivery_status_key)
  on dds_fg6
go
