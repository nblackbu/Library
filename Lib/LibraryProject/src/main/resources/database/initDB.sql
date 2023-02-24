create table users (
    id bigserial primary key,
    user_name varchar(256) not null,
    surname varchar(256) not null,
    lastname varchar(256) not null,
    birthday date not null,
    status varchar(64) not null,
    role_id int not null,
    phone_number int not null,
    login varchar(256) not null unique,
    password varchar(256) not null,
    foreign key (role_id) references roles(id)
),

create table authors (
    id bigserial primary key,
    author_name varchar(256) not null,
    surname varchar(256) not null,
    lastname varchar(256) not null
),

create table genres (
    id bigserial primary key,
    genres_name varchar(64) not null
),

create table books (
    id bigserial primary key,
    book_name varchar(512) not null,
    publishing_year int not null,
    quantity int,
    author_id int not null,
    genre_id int not null,
    review_id int,
    foreign key (genre_id) references genres(id)
),

create table reviews (
    id bigserial primary key,
    review varchar(10000) not null,
    user_id int not null,
    book_id int not null,
    creation_date timestamp default current_timestamp,
    foreign key (user_id) references users(id),
    foreign key (book_id) references books(id)
),

create table books_issue (
    id bigserial primary key,
    book_id int not null,
    user_id int not null,
    creation_date timestamp default current_timestamp,
    foreign key (book_id) references books(id),
    foreign key (user_id) references users(id)
),

create table roles (
    id bigserial primary key,
    role varchar(64) not null
);