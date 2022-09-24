create user c##spotify identified by spotify;
grant unlimited tablespace to c##spotify;
grant resource, connect, dba to c##spotify;

create table album(
	id_album varchar2(10) primary key,
	name_albums nvarchar2(255),
	id_singer varchar2(10),
	genre_album nvarchar2(255),
	artWorkPath varchar2(255),
	postedBy_album nvarchar2(255),
	show nvarchar2(255),
	postDay date
)

create table singer(
	id_singer varchar2(10) primary key ,
	name_singer nvarchar2(100),
	picture_singer clob
)
create table song(
	id_song varchar2(10) primary key,
	id_singer varchar2(10),
	id_album varchar2(10),
    id_genre varchar2(10),
	path_song varchar2(255),
	listens number (10),
	postBy_song nvarchar2(255),
	postDay_song date
)
create table genres(
	id_genre varchar2(10) primary key,
	name_genre nvarchar2(255)
)

create table users(
	id_user varchar2(10) primary key,
	name_user nvarchar2(255),
	name_account nvarchar2(255),
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

-------------------
create table spotify_event_logon_logoff(
    event_type varchar2(20),
    logon_date date,
    logon_time varchar2(15),
    logof_date date,
    logof_time varchar2(15)
);


create or replace trigger spotify_logon
after logon on schema
begin
    insert into spotify_event_logon_logoff values(
    ora_sysevent,
    sysdate,
    to_char(sysdate,'hh24:mi:ss'),
    null,
    null);
    commit;

end;
--select * from spotify_event_logon_logoff;
--disc;
--conn c##spotify/spotify;
--------
--create or replace trigger spotify_logoff
--before logoff on schema
--begin
--    insert into spotify_event_logon_logoff values(
--    ora_sysevent,
--    null,
--    null,
--    sysdate,
--    to_char(sysdate,'hh24:mi:ss'));
--    commit;
--
--end;
--select * from spotify_event_logon_logoff;
--disc;
--conn c##spotify/spotify;


---trigger auto-crement table users
--step 1
create sequence users_seq start with 1 increment by 1;
--step 2
CREATE OR REPLACE TRIGGER  bi_users
  before insert on users             
  for each row  
begin   
  if :NEW.id_user is null then 
    select users_seq.nextval into :NEW.id_user from dual; 
  end if; 
end;
---trigger auto-crement table song
create sequence song_seq start with 10 increment by 1;

CREATE OR REPLACE TRIGGER  bi_song_trg
  before insert on song             
  for each row  
begin   
  if :NEW.id_song is null then 
    select song_seq.nextval into :NEW.id_song from dual; 
  end if; 
end;

---trigger auto-crement table singer
create sequence singer_seq start with 10 increment by 1;

CREATE OR REPLACE TRIGGER  bi_singer_trg
  before insert on singer             
  for each row  
begin   
  if :NEW.id_singer is null then 
    select singer_seq.nextval into :NEW.id_singer from dual; 
  end if; 
end;
---trigger auto-crement table genres

create sequence genres_seq start with 10 increment by 1;

CREATE OR REPLACE TRIGGER  bi_genres_trg
  before insert on genres            
  for each row  
begin   
  if :NEW.id_genre is null then 
    select genres_seq.nextval into :NEW.id_genre from dual; 
  end if; 
end;
---trigger auto-crement table album
create sequence album_seq start with 10 increment by 1;

CREATE OR REPLACE TRIGGER  bi_album_trg
  before insert on album            
  for each row  
begin   
  if :NEW.id_album is null then 
    select album_seq.nextval into :NEW.id_album from dual; 
  end if; 
end;

--add data into table singer
insert into singer(name_singer)
values (N'Đàm Vĩnh Hưng');
insert into singer(name_singer)
values (N'Sơn Tùng M-TP');
insert into singer(name_singer)
values (N'Hà Anh Tuấn');
insert into singer(name_singer)
values (N'Bùi Anh Tuấn');
insert into singer(name_singer)
values (N'Phan Mạnh Quỳnh');
insert into singer(name_singer)
values (N'Lương Bích Hưu');
insert into singer(name_singer)
values (N'Uyên Linh');
insert into singer(name_singer)
values (N'Thu Minh');

--add data into table genres
insert into genres(name_genre) values ('Pop');
insert into genres(name_genre) values ('Rock');
insert into genres(name_genre) values ('Jazz');
insert into genres(name_genre) values ('Opera');
insert into genres(name_genre) values ('Country');
insert into genres(name_genre) values ('RnB');
insert into genres(name_genre) values ('Dance');
insert into genres(name_genre) values ('Blues');
insert into genres(name_genre) values ('Ballad');
insert into genres(name_genre) values ('Accoustic');
insert into genres(name_genre) values ('Bolero');

insert into album ( name_albums, id_singer)
values (n'Vol.2 Ây da Ây da','15');
insert into album ( name_albums, id_singer)
values ('It is Not Over','15');
insert into album ( name_albums, id_singer)
values ('Story of Time','15');
insert into album ( name_albums, id_singer)
values (N'Đứt từng đoạn ruột','15');
insert into album (name_albums, id_singer)
values (N'Mình cưới nhau nhé','15');
-------------------------------------------

insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values('admin','admin','admin','admin@gmail.com',1,'13-sep-22 ');

insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values('Khanh','Khanh','Khanh','Khanh@gmail.com',0,'13-sep-22 ');
insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Tai','Tai','Tai','Tai@gmail.com',0,'13-sep-22 ');
insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Hiep','Hiep','Hiep','Hiep@gmail.com',0,'13-sep-22 ');
insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Nhan','Nhan','Nhan','Nhan@gmail.com',0,'13-sep-22 ');
insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Duoc','Duoc','Duoc','Duoc@gmail.com',0,'13-sep-22 ');
insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Hoc','Hoc','Hoc','Hoc@gmail.com',0,'13-sep-22 ');
insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Dai','Dai','Dai','Dai@gmail.com',0,'13-sep-22 ');

insert into users ( name_user, name_account, password, email, decentralization, registration_date )
values(N'Phung','Phung','Phung','Phung@gmail.com',0,'24-sep-22 ');


------------------------------------------
insert into song ( id_singer, id_album, id_genre,path_song,postday_song)
values ('10','10','10','https://firebasestorage.googleapis.com/v0/b/fir-dc1e5.appspot.com/o/Mp3%2FLuongBichHuu%2FTaiNhacMienPhi.Net%20-%20Em%20D%E1%BB%ABng%20L%E1%BA%A1i.mp3?alt=media&token=aa5cfa33-81e9-4989-ab5a-405b4b4e8ee7','24-sep-22');
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

insert into album(name_albums,id_singer) values(N'Buowsc qua nhau','10');
