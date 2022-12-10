--добавление 5 пользователей
insert into users(name, email, gender, register_date, occupation)
    select 'Nikishkin Egor', 'nikishkine@mail.ru', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Nyanzin Maksim', 'nyanzinm@gmail.com', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Pomelova Alina', 'pomelovaalina04@mail.ru', 'female', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Prokopenko Anton', 'prokopenkoanton@mail.ru', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Prokopenko Danil', 'prokopenkodanil@mail.ru', 'male', date('now'), 'student';

--добавление 3 фильмов

insert into movies(title, year) values
('Shutter Island', 2010),
('The Illusionist', 2006),
('Home Alone', 1990);

insert into movies_genres(movie_id, genre_id) select id, (select id from genres where name == 'Crime') from movies where title == 'Shutter Island';
insert into movies_genres(movie_id, genre_id) select id, (select id from genres where name == 'Crime') from movies where title == 'The Illusionist';
insert into movies_genres(movie_id, genre_id) select id, (select id from genres where name == 'Comedy') from movies where title == 'Home Alone';

--добавление 3 отзывов

insert into tags_contents(tag) values('fascinating');
insert into tags(user_id, movie_id, tag_id, timestamp) select
                                                           (select id from users where name == 'Pomelova Alina'),
                                                           (select id from movies where title == 'Shutter Island'),
                                                           (select max(id) from tags),
                                                           strftime('%s', 'now');

insert into tags_contents(tag) values('interesting');
insert into tags(user_id, movie_id, tag_id, timestamp) select
                                                           (select id from users where name == 'Pomelova Alina'),
                                                           (select id from movies where title == 'The Illusionist'),
                                                           (select max(id) from tags),
                                                           strftime('%s', 'now');

insert into tags_contents(tag) values('very funny');
insert into tags(user_id, movie_id, tag_id, timestamp) select
                                                           (select id from users where name == 'Pomelova Alina'),
                                                           (select id from movies where title == 'Home Alone'),
                                                           (select max(id) from tags),
                                                           strftime('%s', 'now');