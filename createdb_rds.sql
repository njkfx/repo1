create database sales_rds
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/23 1:09:10                           */
/*==============================================================*/

CREATE DATABASE IF NOT EXISTS sales_rds DEFAULT CHARSET utf8 COLLATE utf8_general_ci; 

USE sales_rds;

DROP TABLE IF EXISTS rds.customer;

DROP TABLE IF EXISTS rds.product;

DROP TABLE IF EXISTS rds.sales_order;

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
CREATE TABLE sales_rds.customer
(
   customer_number      INT ,
   customer_name        VARCHAR(128)  ,
   customer_street_address VARCHAR(256)  ,
   customer_zip_code    INT  ,
   customer_city        VARCHAR(32)  ,
   customer_state       VARCHAR(32)  
);

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
CREATE TABLE sales_rds.product
(
   product_code         INT,
   product_name         VARCHAR(128)  ,
   product_category     VARCHAR(256)  
);

/*==============================================================*/
/* Table: sales_order                                           */
/*==============================================================*/
CREATE TABLE sales_rds.sales_order
(
   order_number         INT ,
   customer_number      INT,
   product_code         INT ,
   order_date           timestamp  ,
   entry_date           timestamp  ,
   order_amount         DECIMAL(18,2)  
);




