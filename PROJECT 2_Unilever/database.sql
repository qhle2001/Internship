#create database unilever;
use unilever;
create table user(
	id_user integer primary key,
    user_name char
);
create table account(
	username char primary key,
    passwords char
);