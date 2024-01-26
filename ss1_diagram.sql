create database diagram;
use diagram;
create table banners(
	id varchar(36) primary key,
    title varchar(250) not null,
    image varchar(36),
    summary varchar(36),
    link varchar(36),
    order_by varchar(36),
    status bit default 1
);
create table contacts(
	id varchar(36) primary key,
    email varchar(250) not null,
    address varchar(36),
    message varchar(36),
    status bit default 1
);
create table blogs(
	id varchar(36) primary key,
    title varchar(250) not null,
    image varchar(36),
    content varchar(36),
    status bit default 1
);
create table orders(
	id varchar(36) primary key,
    custom_id varchar(36) not null,
    total int,
    status bit default 1
);
create table abouts(
	id varchar(36) primary key,
    title varchar(250) not null,
    image varchar(36),
    content varchar(36),
    status bit default 1
);
create table categorys(
	id varchar(36) primary key,
    name varchar(250) not null,
    keyword varchar(36),
    description varchar(36),
    status bit default 1
);
create table customers(
	id varchar(36) primary key,
    name varchar(250) not null,
    address varchar(36),
    phone int,
    email varchar(36)
);
create table order_details(
	id varchar(36) primary key,
    product_id varchar(36) not null,
    order_id varchar(36),
    price int,
    quanity int
);
create table products(
	id varchar(36) primary key,
    category_id varchar(36) not null,
    image varchar(36),
    list_image varchar(36),
    price int,
    sale_price int,
    description varchar(36),
    keyword varchar(36),
    content varchar(36),
    status bit default 1,
    foreign key (category_id) references categorys(id)
);
create table services(
	id varchar(36) primary key,
    name varchar(250) not null,
    summary varchar(36),
    content varchar(36),
    image varchar(36),
    order_by varchar(36),
    status bit default 1
);
create table users(
	id varchar(36) primary key
);
create table coments(
	id varchar(36) primary key,
    user_id varchar(36) not null,
    product_id varchar(36) not null,
    message varchar(36),
    status bit default 1,
    foreign key (user_id) references users(id),
    foreign key (product_id) references products(id)
);
create table books(
	id varchar(36) primary key,
    user_id varchar(250) not null,
    service_id varchar(36),
    name varchar(36),
    phone int,
    date date,
    foreign key (user_id) references users(id),
    foreign key (service_id) references services(id)
    );
drop table categories;
-- cập nhật bảng
alter table categories 
	modify column name varchar(100);
alter table categories
	drop column name;
alter table categories
	add column name varchar(250) not null;
    
-- DML (Data Manipulation Language)
-- thêm mới dữ liệu
insert into categories values(uuid(), 'Second category',1);
-- truy vấn dữ liệu
select * from categories;
-- cập nhật cơ sở dữ liệu
update categories
	set name = 'New category'
    where id = '14373122-bab6-11ee-9d88-88b111677266';
-- xóa dữ liệu
delete from categories where name = 'second category';