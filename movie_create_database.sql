create database Movie 
create schema movie_details
create schema movie_crew
create table movie_details.Movie
(
m_id int IDENTITY (1, 1)  primary key ,
m_title VARCHAR (255) NOT NULL ,
m_year int NOT NULL ,
m_time int NOT NULL ,
m_lang VARCHAR (255)NOT NULL ,
m_rel_date date NOT NULL ,
m_rel_country VARCHAR (255) NOT NULL ,
)
create table movie_crew.actor
(
a_id int IDENTITY (1, 1)  primary key NOT NULL , 
a_Fname VARCHAR (255) NOT NULL ,
a_Lname VARCHAR (255) NOT NULL ,
a_gender char(1) NOT NULL ,
)
create table movie_crew.director
(
d_id int IDENTITY (1, 1)  primary key NOT NULL , 
d_Fname VARCHAR (255) NOT NULL ,
d_Lname VARCHAR (255)
)
create table movie_crew.Movie_direction
(
d_id int NOT NULL ,
m_id int NOT NULL ,
FOREIGN KEY (m_id) REFERENCES movie_details.Movie (m_id) ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (d_id) REFERENCES movie_crew.director (d_id) ON DELETE CASCADE ON UPDATE CASCADE
)
create table movie_crew.Movie_cast
(
a_id int NOT NULL ,
a_name int NOT NULL ,
role VARCHAR (255) NOT NULL ,
)
create table movie_details.movie_genres
(
m_id int NOT NULL ,
g_id int NOT NULL ,
FOREIGN KEY (m_id) REFERENCES movie_details.Movie (m_id) ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (g_id) REFERENCES movie_details.genres (g_id) ON DELETE CASCADE ON UPDATE CASCADE
)
create table movie_details.genres
(
g_id int IDENTITY (1, 1) primary key NOT NULL ,
g_title VARCHAR (255) NOT NULL ,
)
create table movie_details.rating
(
m_id int NOT NULL , 
rev_id int NOT NULL , 
rev_stars int NOT NULL ,
num_o_r int
FOREIGN KEY (rev_id) REFERENCES movie_details.reviewer (rev_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (m_id) REFERENCES movie_details.Movie (m_id) ON DELETE CASCADE ON UPDATE CASCADE,
)
create table movie_details.reviewer
(
rev_id int IDENTITY (1, 1) primary key NOT NULL ,
rev_name VARCHAR (255) NOT NULL ,
)

