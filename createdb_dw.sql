create database dw;
create table Dim_Product
(
   product_sk           int   ,
   product_code         int ,
   product_name         varchar(128),
   product_category     varchar(256),
   version              varchar(32),
   effective_date       date,
   expiry_date          date
)
clustered by (product_sk ) into 8 buckets
stored as orc tblproperties('transactional'='true');


/*==============================================================*/
/* Table: dim_customer                                          */
/*==============================================================*/
create table dim_customer
(
   customer_sk          int   ,
   customer_number      int ,
   customer_name        varchar(128),
   customer_street_address varchar(256),
   customer_zip_code    int,
   customer_city        varchar(32),
   customer_state       varchar(32),
   version              varchar(32),
   effective_date       date,
   expiry_date          date
)
clustered by (customer_sk ) into 8 buckets
stored as orc tblproperties('transactional'='true');

/*==============================================================*/
/* Table: dim_date                                              */
/*==============================================================*/
create table dw.dim_date
(
   date_sk              int   ,
   date                 date,
   month                tinyint,
   month_name            varchar(16),
   quarter              tinyint,
   year                 int
) row format delimited fields terminated by ','
stored as textfile;

/*==============================================================*/
/* Table: dim_order                                             */
/*==============================================================*/
create table dim_order
(
   order_sk             int  ,
   order_number         int,
   version              varchar(32),
   effective_date       date,
   expiry_date          date
)
clustered by (order_sk ) into 8 buckets
stored as orc tblproperties('transactional'='true');
;

/*==============================================================*/
/* Table: fact_sales_order                                      */
/*==============================================================*/
create table fact_sales_order
(
   order_sk             int  ,
   customer_sk          int  ,
   product_sk           int  ,
   order_date_sk        int  ,
   order_amount         decimal(18,2)
)
partitioned by(order_date string)
clustered by (order_sk ) into 8 buckets
stored as orc tblproperties('transactional'='true');
;
