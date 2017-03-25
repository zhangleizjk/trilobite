/* 
 *
 */
drop schema if exists `trilobite_shop`;
create schema if not exists `trilobite_shop`
	default character set utf8
	default collate utf8_bin;

/*
 *
 */
use `trilobite_shop`

/*
 *
 */
create table if not exists `customer` 
(
	`id` bigint unsigned auto_increment not null,
	primary key(`id`)
)
	default character set utf8
	default collate utf8_bin;
	
/*
 * 
 */
drop table if exists `customer_browse_history`;
create table if not exists `customer_browse_history`
(
	`id` bigint unsigned auto_increment not null,
	`customer_id` bigint unsigned not null,
	`product_id` bigint unsigned not null,
	`add_time` timestamp default current_timestamp,
	unique(`customer_id`, `product_id`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;
	
/*
 * 
 */
drop table if exists `customer_favourite`;
create table if not exists `customer_favourite`
(
	`id` bigint unsigned auto_increment not null,
	`customer_id` bigint unsigned not null,
	`product_id` bigint unsigned not null,
	`add_time` timestamp default current_timestamp,
	unique(`customer_id`, `product_id`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;
	
/*
 * 
 */
drop table if exists `customer_wish`;
create table if not exists `customer_wish`
(
	`id` bigint unsigned auto_increment not null,
	`customer_id` bigint unsigned not null,
	`wish_name` varchar(50) character set utf8 collate utf8_bin not null,
	`add_time` timestamp default current_timestamp,
	unique(`customer_id`, `wish_name`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;
	
/*
 * 
 */
drop table if exists `customer_wish_detail`;
create table if not exists `customer_wish_detail`
(
	`id` bigint unsigned auto_increment not null,
	`wish_id` bigint unsigned not null,
	`product_id` bigint unsigned not null,
	`add_time` timestamp default current_timestamp,
	unique(`wisht_id`, `product_id`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;	
	
/*
 * 
 */
drop table if exists `customer_cart`;
create table if not exists `customer_cart`
(
	`id` bigint unsigned auto_increment not null,
	`customer_id` bigint unsigned not null,
	`product_id` bigint unsigned not null,
	`quantity` bigint unsigned default 1,
	`add_time` timestamp default current_timestamp,
	unique(`customer_id`, `product_id`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;
	
/*
 * 
 */
drop table if exists `customer_delivery_address`;
create table if not exists `customer_delivery_address`
(
	`id` bigint unsigned auto_increment not null,
	`customer_id` bigint unsigned not null,
	`receiver` varchar(50) character set utf8 collate utf8_bin not null,
	`phone` varchar(20) character set utf8 collate utf8_bin  not null,
	`primary_address` varchar(100) character set utf8 collate utf8_bin not null,
	`detail_address` varchar(100) character set utf8 collate utf8_bin not null,
	`is_default` boolean default true,
	`add_time` timestamp default current_timestamp,
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;

/*
 * 
 */
drop table if exists `customer_review`;
create table if not exists `customer_review`
(
	`id` bigint unsigned auto_increment not null,
	`order_id` bigint unsigned not null,
	`product_id` bigint unsigned not null,
	`score` tinyint unsigned default 5,
	`content` varchar(500) character set utf8 collate utf8_bin,
	`add_time` timestamp default current_timestamp,
	unique(`order_id`, `product_id`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;		
	
/*
 * 
 */
drop table if exists `gift_card`;
create table if not exists `gift_card`
(
	`id` bigint unsigned auto_increment not null,
	`card_number` varchar(30) character set utf8 collate utf8_bin,
	`money_number` decimal(6,2) default 0,
	`status`enum('freeze', 'sale', 'sold', 'recharged') character set utf8 collate utf8_bin not null,
	`admin_id` bigint unsigned not null,
	`add_time` timestamp default current_timestamp,
	unique(`card_number`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;		
	
/*
 * 
 */
drop table if exists `gift_card_sale`;
create table if not exists `gift_card_sale`
(
	`id` bigint unsigned auto_increment not null,
	`card_id` bigint unsigned not null,
	`card_number` varchar(30) character set utf8 collate utf8_bin,
	`customer_id` bigint unsigned not null,
	`add_time` timestamp default current_timestamp,
	unique(`card_id`),
	unique(`card_number`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			
		
/*
 * 
 */
drop table if exists `gift_card_recharge`;
create table if not exists `gift_card_recharge`
(
	`id` bigint unsigned auto_increment not null,
	`card_id` bigint unsigned not null,
	`card_number` varchar(30) character set utf8 collate utf8_bin,
	`customer_id` bigint unsigned not null,
	`add_time` timestamp default current_timestamp,
	unique(`card_id`),
	unique(`card_number`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			
	
/*
 * 
 */
drop table if exists `customer_message_type`;
create table if not exists `customer_message_type`
(
	`id` bigint unsigned auto_increment not null,
	`name` varchar(50) character set utf8 collate utf8_bin,
	unique(`name`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			
insert into `customer_message_type`(`name`) values('important_message'), ('order_message'), ('account_message'), ('other_message');

/*
 * 
 */
drop table if exists `customer_message`;
create table if not exists `customer_message`
(
	`id` bigint unsigned auto_increment not null,
	`type_id` bigint unsigned not null,
	`customer_id`bigint unsigned not null,
	`title` varchar(100) character set utf8 collate utf8_bin,
	`content` varchar(500) character set utf8 collate utf8_bin,
	`add_time` timestamp default current_timestamp,
	`status` enum('unread', 'read')
	unique(`card_id`),
	unique(`card_number`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			
	
/*
 * 
 */
drop table if exists `recycle_customer_message`;
create table if not exists `recycle_customer_message`
(
	`id` bigint unsigned auto_increment not null,
	`type_id` bigint unsigned not null,
	`customer_id`bigint unsigned not null,
	`title` varchar(100) character set utf8 collate utf8_bin,
	`content` varchar(500) character set utf8 collate utf8_bin,
	`send_time` timestamp not null,
	`status` enum('unread', 'read'),
	`delete_time` timestamp default current_timestamp,
	`delete_operator` enum('customer', 'root'),
	unique(`card_id`),
	unique(`card_number`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*
 * 
 */
drop table if exists `growth_as_grade`;
create table if not exists `growth_as_grade`
(
	`id` bigint unsigned auto_increment not null,
	`require_min_growth` bigint unsigned not null,
	`grade_name` varchar(20) character set utf8 collate utf8_bin,
	`grade_image` varchar(100) character set utf8 collate utf8_bin,
	`grade_image_num` tinyint unsigned default 1,
	unique(`require_min_growth`),
	unique(`grade_name`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			
	
/*
 * 
 */
drop table if exists `money_as_growth`;
create table if not exists `money_as_growth`
(
	`id` bigint unsigned auto_increment not null,
	`money_num` bigint unsigned not null,
	`growth_num` bigint unsigned not null,
	unique(`money_num`),
	unique(`growth_num`),
	primary key(`id`)
)
	engine InnoDB
	default character set utf8
	default collate utf8_bin;			
insert into `money_as_growth`(`money_num`, `growth_num`) values(100, 100);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
