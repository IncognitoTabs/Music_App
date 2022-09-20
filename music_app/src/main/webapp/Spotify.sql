create user c##spotify identified by spotify;
grant unlimited tablespace to c##spotify;
grant resource, connect, dba to c##spotify;

create table album(
	id_album varchar2(10) primary key,
	name_albums varchar2(255),
	id_singer varchar2(10),
	genre_album varchar2(255),
	artWorkPath varchar2(255),
	postedBy_album varchar2(255),
	show varchar2(255),
	postDay date
)

create table singer(
	id_singer varchar2(10) primary key ,
	name_singer varchar2(100),
	picture_singer clob
)
create table song(
	id_song varchar2(10) primary key,
	id_singer varchar2(10),
	id_album varchar2(10),
    id_genre varchar2(10),
	path_song varchar2(255),
	listens number (10),
	postBy_song varchar2(255),
	postDay_song varchar2(255)
)
create table genres(
	id_genre varchar2(10) primary key,
	name_genre varchar2(255)
)

create table users(
	id_user varchar2(10) primary key,
	name_user varchar2(255),
	name_account varchar2(255),
	password varchar2(20),
	email varchar2(255),
	decentralization number(1),
	registration_date date,
	avatar clob
)
ALTER TABLE album 
ADD CONSTRAINT fk_singer_album
FOREIGN KEY (id_singer) REFERENCES singer(id_singer);

ALTER TABLE song 
ADD CONSTRAINT fk_singer_song
FOREIGN KEY (id_singer) REFERENCES singer(id_singer);

ALTER TABLE song 
ADD CONSTRAINT fk_song_genre
FOREIGN KEY (id_genre) REFERENCES genres(id_genre);

--Thêm d? li?u vào b?ng singer
insert into singer(id_singer, name_singer)
values ('01',N'Đàm Vĩnh Hưng');
insert into singer(id_singer, name_singer)
values ('02',N'Sơn Tùng M-TP');
insert into singer(id_singer, name_singer)
values ('03',N'Hà Anh Tuấn');
insert into singer(id_singer, name_singer)
values ('04',N'Bùi Anh Tuấn');
insert into singer(id_singer, name_singer)
values ('05',N'Phan Mạnh Quỳnh');
insert into singer(id_singer, name_singer)
values ('06',N'Lương Bích Hữu');
insert into singer(id_singer, name_singer)
values ('07',N'Uyên Linh');
insert into singer(id_singer, name_singer)
values ('08',N'Thu Minh');

--Thêm d? li?u vào b?ng genres
insert into genres values ('01','Pop');
insert into genres values ('02','Rock');
insert into genres values ('03','Jazz');
insert into genres values ('04','Opera');
insert into genres values ('05','Country');
insert into genres values ('06','RnB');
insert into genres values ('07','Dance');
insert into genres values ('08','Blues');
insert into genres values ('09','Ballad');
insert into genres values ('10','Accoustic');
insert into genres values ('11','Bolero');

insert into album (id_album, name_albums, id_singer)
values ('01',n'Vol.2 Ây da Ây da','06');
insert into album (id_album, name_albums, id_singer)
values ('02','It is Not Over','06');
insert into album (id_album, name_albums, id_singer)
values ('03','Story of Time','06');
insert into album (id_album, name_albums, id_singer)
values ('04',N'Đức từng đoạn ruột','06');
insert into album (id_album, name_albums, id_singer)
values ('05',N'Mình cưới nhau nhé','06');
-------------------------------------------

insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('ad1','admin','admin','admin','admin@gmail.com',1,'13-sep-22 ');

insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au1','Khanh','Khanh','Khanh','Khanh@gmail.com',0,'13-sep-22 ');
insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au2',N'Tài','Tai','Tai','Tai@gmail.com',0,'13-sep-22 ');
insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au3',N'Hi?p','Hiep','Hiep','Hiep@gmail.com',0,'13-sep-22 ');
insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au4',N'Nhân','Nhan','Nhan','Nhan@gmail.com',0,'13-sep-22 ');
insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au5',N'???c','Duoc','Duoc','Duoc@gmail.com',0,'13-sep-22 ');
insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au6',N'H?c','Hoc','Hoc','Hoc@gmail.com',0,'13-sep-22 ');
insert into users (id_user, name_user, name_account, password, email, decentralization, registration_date )
values('au7',N'??i','Dai','Dai','Dai@gmail.com',0,'13-sep-22 ');


------------------------------------------
insert into song (id_song, id_singer, id_album, id_genre)
values ('lbh01','06','01','01');
---------------------------
--trigger
CREATE OR REPLACE TRIGGER bi_album
BEFORE INSERT ON album
for each row
enable
declare 
    v_user varchar2(10);
begin
    select user into v_user from dual;
    dbms_output.put_line('you inserted a line by '||v_user);
end;

insert into album(id_album,name_albums,id_singer) values('07',N'Bước qua nhau','05');
------------


create table mng_album(
    table_name varchar2(20),
    transaction_name VARCHAR2(10),

    by_user VARCHAR2(30),

    transaction_date varchar2(30)
    
);
create or replace trigger album_trg
before insert or update or delete on album
for each row
declare
    v_user varchar2(10);
    v_date varchar2(30);
begin
    select user, to_char(sysdate, 'DD/MM/YY HH24:MI:SS') into v_user,v_date from dual;
    if inserting then
        insert into mng_album(table_name, transaction_name, by_user,transaction_date)
        values('ALBUM','INSERTING',v_user,v_date);
    elsif updating then
        insert into mng_album(table_name, transaction_name, by_user,transaction_date)
        values('ALBUM','UPDATING',v_user,v_date);
    elsif deleting then
        insert into mng_album(table_name, transaction_name, by_user,transaction_date)
        values('ALBUM','DELETING',v_user,v_date);
    end if;
end;

insert into album(id_album,name_albums,id_singer) values('08','Tracking NO2','05');
-------------
desc album;
create table album_backup as select * from album;

create or replace trigger album_backup_trg
before insert or update or delete on album
for each row
begin
    if inserting then
        insert into album_backup(id_album, name_albums, id_singer, genre_album, artworkpath,postedby_album,show,postday)
        values(:new.id_album,:new.name_albums,:new.id_singer, :new.genre_album, 
        :new.artworkpath,:new.postedby_album,:new.show,:new.postday);
    elsif deleting then
        delete from album_backup where id_album = :old.id_album and id_singer= :old.id_singer;
    elsif updating then
        update album_backup set id_album = :new.id_album, 
        name_albums= :new.name_albums, 
        id_singer= :new.id_singer, 
        genre_album= :new.genre_album, 
        artworkpath= :new.artworkpath,
        postedby_album= :new.postedby_album,
        show= :new.show,
        postday= :new.postday
        where id_album = :old.id_album and id_singer = :old.id_singer;
    end if;
end;
------------------
desc genres
create table genres_backup as select * from genres;

create or replace trigger genres_backup_trg
before insert or update or delete on genres
for each row
begin
    if inserting then
        insert into genres_backup(id_genre,name_genre)
        values(:new.id_genre, :new.name_genre);
    elsif updating then
        update genres_backup set id_genre =:new.id_genre, name_genre=:new.name_genre
        where id_genre = :old.id_genre;
    elsif deleting then
        delete from genres_backup where id_genre = :old.id_genre;
    end if;
end;

-----------------
desc singer
create table singer_backup as select id_singer,name_singer,picture_singer from singer;

create or replace trigger singer_backup_trg
before insert or update or delete on singer
for each row
begin
    if inserting then
        insert into singer_backup (id_singer,name_singer,picture_singer)
        values(:new.id_singer, :new.name_singer,:new.picture_singer);
    elsif updating then
        update singer_backup set id_singer=:new.id_singer,name_singer=:new.name_singer,picture_singer=:new.picture_singer
        where id_singer = :new.id_singer;
    elsif deleting then
        delete from singer_backup where id_singer=:old.id_singer;
    end if;
    exception
    when others then dbms_output.put_line(sqlcode||sqlerrm);
end;
----------------
desc song
create table song_backup as select * from song;

create or replace trigger song_backup_trg
before insert or update or delete on song
for each row
begin
    if inserting then
        insert into song_backup(id_song,id_singer,id_album,id_genre,path_song,listens,postby_song,postday_song)
        values(:new.id_song,:new.id_singer,:new.id_album,:new.id_genre,:new.path_song,:new.listens,:new.postby_song,:new.postday_song);
    elsif updating then
        update song_backup set id_song=:new.id_song,
        id_singer=:new.id_singer,
        id_album=:new.id_album,
        id_genre=:new.id_genre,
        path_song=:new.path_song,
        listens=:new.listens,
        postby_song=:new.postby_song,
        postday_song=:new.postday_song;
    elsif deleting then
        delete from song_backup where id_song = :old.id_song and id_singer=:old.id_singer;
        
    end if;
    exception
    when others then dbms_output.put_line(sqlcode||sqlerrm);
end;
-----------------
desc users
create table users_backup as select * from users;

create or replace trigger users_backup_trg
before insert or update or delete on users
for each row
begin
    if inserting then
     insert into users_backup(id_user, name_user,name_account,password,email,decentralization, registration_date,avatar)
     values(:new.id_user, :new.name_user,:new.name_account,:new.password,:new.email,:new.decentralization, :new.registration_date,:new.avatar);
    elsif updating then
        update users_backup set id_user=:new.id_user, 
        name_user=:new.name_user,
        name_account=:new.name_account,
        password=:new.password,
        email=:new.email,
        decentralization=:new.decentralization,
        registration_date=:new.registration_date,
        avatar=:new.avatar;
    elsif deleting then
        delete from users_backup where id_user = :old.id_user;
    end if;

end;


