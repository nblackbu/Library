create table users (
    user_id bigserial primary key,
    name varchar(256) not null,
    surname varchar(256) not null,
    lastname varchar(256) not null,
    birthday date not null,
    status varchar(64) not null,
    role_id varchar(64) not null,
    phone_number int(64) not null,
    login varchar(256) not null unique,
    password varchar(256) not null,
    foreign key (role_id) references roles(role_id)
),

create table reviews (
    review_id bigserial primary key,
    review varchar(10000) not null,
    user_id int not null,
    book_id int not null,
    creation_date timestamp default current_timestamp,
    foreign key (user_id) references users(user_id),
    foreign key (book_id) references books(book_id)
),
create table authors (
    author_id bigserial primary key,
    name varchar(256) not null,
    surname varchar(256) not null,
    lastname varchar(256) not null
),

create table genres (
    genre_id bigserial primary key,
    genres_name varchar(64) not null
),

create table books (
    book_id bigserial primary key,
    name varchar(512) not null,
    publishing_year int not null,
    quantity int,
    author_id int not null,
    genre_id int not null,
    review_id int
    foreign key (author_id) references author(author_id),
    foreign key (genre_id) references genres(genre_id)
)

create table books_issue (
    id bigserial primary key,
    books_id int not null,
    user_id int not null,
    creation_date timestamp default current_timestamp,
    foreign key (book_id) references books(book_id),
    foreign key (user_id) references users(user_id)
),

create table roles (
    role_id bigserial primary key,
    role varchar(64) not null
);