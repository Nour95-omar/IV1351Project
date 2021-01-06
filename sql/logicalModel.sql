DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;
CREATE TABLE administrative_staff (
 id INT NOT NULL,
 employee_name VARCHAR(500),
 employment_id VARCHAR(10) UNIQUE 
);

ALTER TABLE administrative_staff ADD CONSTRAINT PK_administrative_staff PRIMARY KEY (id);

INSERT INTO administrative_staff(id,employee_name,employment_id)
VALUES (1,'Elen','1256784903');
INSERT INTO administrative_staff VALUES(2,'Leenea','1258784903');
INSERT INTO administrative_staff VALUES (3,'Nemar','1258784900');
INSERT INTO administrative_staff VALUES (4,'Simon','1258787900');

CREATE TABLE appointment (
 app_id INT NOT NULL,
 particate_student_id VARCHAR(12),
 teacher_name VARCHAR(10),
 instrument VARCHAR(30),
 student_level VARCHAR(10),
 admain_id  INT UNIQUE NOT NULL 
);

ALTER TABLE appointment ADD CONSTRAINT PK_appointment PRIMARY KEY (app_id);


CREATE TABLE email (
 id INT NOT NULL,
 e_mail VARCHAR(500) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT NOT NULL,
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 person_number VARCHAR(12) UNIQUE NOT NULL,
 zip_code CHAR(15),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);
INSERT INTO instructor(id,first_name,last_name,person_number,zip_code,country,city,street_number,street_name) VALUES
(1,'Loay','Hanson',198809438010,'Sweden','Stockholm','46046',8,'Sollentunavagen');
INSERT INTO instructor VALUES (2,'Leif','Larssonn',196809438012,'Sweden','Stockholm','46066',8,'Solna');
INSERT INTO instructor VALUES (3,'Nina','Hedberg',196909438012,'Sweden','Stockholm','11166',9,'Kadettgatan');
INSERT INTO instructor VALUES (4,'Samo','Lindberg',197709438012,'Sweden','Stockholm','11163',2,'Kadettgatan');
INSERT INTO instructor VALUES (5,'Salma','Lindqvist',197009438012,'Sweden','Stockholm','11103',2,'Kronansgatan');

CREATE TABLE instrument_stock (
 instru_rent_id INT NOT NULL,
 total_quantity_of_instrument INT,
 available_quantity_of_instrument INT,
 renting_price DOUBLE PRECISION,
 instrument_id INT NOT NULL
);

ALTER TABLE instrument_stock ADD CONSTRAINT PK_instrument_stock PRIMARY KEY (instru_rent_id);



INSERT INTO instrument_stock(instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id)
VALUES (1,20,17,399,1);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (2,30,15,70,2);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (3,30,12,100,3);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (4,30,10,250,4);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (5,30,9,75,5);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (6,30,11,500,6);


CREATE TABLE phone (
 id INT NOT NULL,
 phone_number VARCHAR(15) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE student (
 id INT NOT NULL,
 person_number   VARCHAR(12) UNIQUE,
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100),
 zip_code CHAR(15)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);

INSERT INTO student (id,person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
VALUES (1,199709238767,'Rami','jakl','Sweden','Stockholm',3,'faljl','12463');
INSERT INTO student VALUES (2,199669238067,'Louise','jal','Sweden','Stockholm',3,'faljl','12403');
INSERT INTO student VALUES (3,199909938027,'Noura','Andersson','Sweden','Stockholm',2,'Arvingevagen','12483');
INSERT INTO student VALUES (4,199509938010,'Nour','Anders','Sweden','Stockholm',8,'Arvingevagen','16446');
INSERT INTO student VALUES (5,199800938026,'Sara','Warra','Sweden','Stockholm',5,'Langsgatan','12403');
INSERT INTO student VALUES (6,199509438012,'Anders','Svensson','Sweden','Stockholm',8,'Kungsvagen','46446');
INSERT INTO student VALUES (7,199109930027,'Nour','Berg','Sweden','Stockholm',2,'Arvingevagen','12483');
INSERT INTO student VALUES (8,198109938010,'Silina','Anders','Sweden','Stockholm',3,'Halsovagen','16476');
INSERT INTO student VALUES (9,198900938026,'William','Warra','Sweden','Stockholm',5,'Solnavagen','12402');
INSERT INTO student VALUES (10,198809438012,'Leif','Svensson','Sweden','Stockholm',8,'Sollentunavagen','46046');

CREATE TABLE total_price (
 price_For_Certain_days DOUBLE PRECISION,
 price_by_type_of_lesson DOUBLE PRECISION,
 price_by_level DOUBLE PRECISION,
 number_of_lessons INT
);


CREATE TABLE application (
 apply_id INT NOT NULL,
 application_id VARCHAR(10),
 instrument_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (apply_id);


CREATE TABLE audition (
 aud_id INT NOT NULL,
 aud_time TIMESTAMP(6),
 student_result BOOLEAN,
 student_id INT NOT NULL,
 admain_id INT NOT NULL
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (aud_id);
INSERT INTO audition(aud_id,aud_time,student_result,student_id,admain_id)
VALUES (1,'2020-01-30 00:09:30',true,2,1);
INSERT INTO audition VALUES (2,'2020-02-28 00:09:30',false,5,3);
INSERT INTO audition VALUES (3,'2020-04-30 00:09:30',false,10,1);
INSERT INTO audition VALUES (4,'2020-05-30 00:09:30',true,5,3);
INSERT INTO audition VALUES (5,'2020-06-30 00:09:30',true,10,1);

CREATE TABLE email_address (
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 mail_id INT NOT NULL
);

ALTER TABLE email_address ADD CONSTRAINT PK_email_address PRIMARY KEY (instructor_id,student_id,mail_id);


CREATE TABLE ensembles_lesson (
 ens_id INT NOT NULL,
 min_num_of_students INT,
 max_num_of_students INT,
 genre VARCHAR(30),
 avi_seats INT,
 lesson_time TIMESTAMP(6),
 instructor_id INT NOT NULL
);

ALTER TABLE ensembles_lesson ADD CONSTRAINT PK_ensembles_lesson PRIMARY KEY (ens_id);
INSERT INTO ensembles_lesson(ens_id,min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id) 
VALUES (1,1,10,'jazz',1,'2020-01-02 00-11-30',2);
INSERT INTO ensembles_lesson VALUES (2,1,12,'Rock',2,'2020-01-15 00-15-30',1);
INSERT INTO ensembles_lesson VALUES (3,1,10,'Classical',7,'2020-02-12 00-11-30',3);
INSERT INTO ensembles_lesson VALUES (4,1,12,'Pop',0,'2021-01-07 00-14-30',5);
INSERT INTO ensembles_lesson VALUES (5,1,20,'Classical',6,'2021-01-08 00-12-30',4);
INSERT INTO ensembles_lesson VALUES (6,1,12,'Pop',1,'2019-11-15 00-14-30',5);
INSERT INTO ensembles_lesson VALUES (7,1,12,'Pop',8,'2019-11-12 00-14-30',5);
INSERT INTO ensembles_lesson VALUES (8,1,20,'Classical',1,'2019-01-3 00-12-30',3);
INSERT INTO ensembles_lesson VALUES (9,1,12,'Rock',0,'2021-01-09 00-14-30',1);
INSERT INTO ensembles_lesson VALUES (10,1,12,'Pop',0,'2021-01-12 00-14-30',1);
INSERT INTO ensembles_lesson VALUES (11,1,20,'Classical',6,'2021-01-08 00-12-30',4);




CREATE TABLE group_lesson (
 grp_id INT NOT NULL,
 min_num_of_students INT,
 max_num_of_students INT,
 lesson_time TIMESTAMP(6),
 instrument_id INT NOT NULL,
 lesson_level VARCHAR(15),
 instructor_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (grp_id);
INSERT INTO group_lesson(grp_id,min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id) 

VALUES (1,1,10,'2019-01-02 00-11-30',2,'intermediate',2);
INSERT INTO group_lesson VALUES (2,1,20,'2021-01-12 00-11-30',2,'begginers',3);
INSERT INTO group_lesson VALUES (3,1,15,'2019-03-02 00-11-30',1,'intermediate',4);
INSERT INTO group_lesson VALUES (4,1,5,'2020-01-22 00-11-30',7,'advanced',1);
INSERT INTO group_lesson VALUES (5,1,20,'2019-03-07 00-11-30',3,'advanced',1);
INSERT INTO group_lesson VALUES (6,1,20,'2021-12-02 00-11-30',3,'advanced',3);
INSERT INTO group_lesson VALUES (7,1,15,'2019-03-02 00-11-30',1,'intermediate',2);
INSERT INTO group_lesson VALUES (8,1,15,'2019-03-02 00-11-30',1,'intermediate',4);
INSERT INTO group_lesson VALUES (9,1,15,'2019-03-02 00-11-30',1,'intermediate',2);
INSERT INTO group_lesson VALUES (10,1,15,'2021-01-02 00-11-30',1,'intermediate',4);
INSERT INTO group_lesson VALUES (11,1,15,'2021-01-03 00-11-30',1,'intermediate',4);
INSERT INTO group_lesson VALUES (12,1,15,'2021-01-03 00-11-30',1,'intermediate',3);
INSERT INTO group_lesson VALUES (13,1,15,'2021-01-04 00-11-30',1,'intermediate',3);
INSERT INTO group_lesson VALUES (14,1,15,'2021-01-05 00-11-30',1,'intermediate',1);
INSERT INTO group_lesson VALUES (15,1,15,'2021-01-05 00-12-30',1,'intermediate',1);
INSERT INTO group_lesson VALUES (16,1,15,'2019-03-08 00-11-30',1,'intermediate',3);
INSERT INTO group_lesson VALUES (17,1,15,'2019-03-09 00-11-30',1,'intermediate',2);
INSERT INTO group_lesson VALUES (18,1,15,'2021-01-08 00-09-30',1,'intermediate',3);

CREATE TABLE individual_lesson (
 ind_id INT NOT NULL,
 instrument_id INT NOT NULL,
 instructor_id INT NOT NULL,
 lesson_time TIMESTAMP(6)
 
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (ind_id);
INSERT INTO individual_lesson(ind_id,instrument_id,instructor_id,lesson_time)
VALUES(1,3,2,'2019-02-02 00-01-30');
INSERT INTO individual_lesson VALUES(2,1,4,'2019-03-17 00-11-30');
INSERT INTO individual_lesson VALUES(3,4,1,'2020-01-12 00-11-30');
INSERT INTO individual_lesson VALUES(4,3,5,'2020-03-02 00-11-30');
INSERT INTO individual_lesson VALUES(5,2,3,'2020-12-02 00-11-30');
INSERT INTO individual_lesson VALUES(6,1,4,'2019-03-12 00-11-30');
INSERT INTO individual_lesson VALUES(7,1,4,'2019-03-11 00-11-30');
INSERT INTO individual_lesson VALUES(8,1,2,'2019-03-11 00-11-30');
INSERT INTO individual_lesson VALUES(9,1,2,'2019-03-14 00-11-30');
INSERT INTO individual_lesson VALUES(10,1,2,'2019-03-19 00-11-30');
INSERT INTO individual_lesson VALUES(11,1,2,'2021-01-20 00-11-30');
INSERT INTO individual_lesson VALUES(12,1,3,'2021-01-18 00-11-30');
INSERT INTO individual_lesson VALUES(13,1,3,'2021-01-10 00-11-30');


CREATE TABLE instrument (
 instr_id INT NOT NULL,
 instrument_name VARCHAR(50)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instr_id);

INSERT INTO instrument(instr_id,instrument_name) VALUES
(1,'piano');
INSERT INTO instrument VALUES(2,'cello');
INSERT INTO instrument VALUES(3,'grand piano');
INSERT INTO instrument VALUES(4,'guitar');
INSERT INTO instrument VALUES(5,'violin');
INSERT INTO instrument VALUES(6,'maracas');
INSERT INTO instrument VALUES(7,'bongo drums');

CREATE TABLE instrument_rental (
 instru_rent_id INT NOT NULL,
 number_of_rented_instruments INT,
 brand_of_rented_instrument VARCHAR(50),
 renting_start_date DATE,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 renting_end_date DATE
);

ALTER TABLE instrument_rental ADD CONSTRAINT PK_instrument_rental PRIMARY KEY (instru_rent_id);


INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date)
VALUES(1,1,'2020-12-15',7,1,'2021-03-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES (2,2,'2019-06-01',3,7,'2020-04-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(3,1,'2019-12-15',7,2,'2020-3-15');
INSERT INTO instrument_rental  (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(4,2,'2019-12-15',8,3,'2020-3-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(5,2,'2019-12-15',4,1,'2020-3-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(6,1,'2019-12-15',4,1,'2020-05-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(7,2,'2019-12-15',6,1,'2020-3-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(8,1,'2019-12-15',9,2,'2020-3-15');
INSERT INTO instrument_rental (instru_rent_id,number_of_rented_instruments,renting_start_date,student_id,instrument_id,renting_end_date) VALUES(9,1,'2020-11-15',9,2,'2020-12-30');

CREATE TABLE payment (
 pay_id CHAR(10) NOT NULL,
 amount DOUBLE PRECISION,
 date DATE,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (pay_id);


CREATE TABLE phone_number (
 student_id INT NOT NULL,
 instructor_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (student_id,instructor_id,phone_id);


CREATE TABLE receipt (
 rec_id INT NOT NULL,
 date DATE,
 payed_ammount DOUBLE PRECISION,
 pay_id CHAR(10) NOT NULL
);

ALTER TABLE receipt ADD CONSTRAINT PK_receipt PRIMARY KEY (rec_id);


CREATE TABLE rental_payment (
 instru_rent_id INT NOT NULL,
 date DATE,
 amount DOUBLE PRECISION
);

ALTER TABLE rental_payment ADD CONSTRAINT PK_rental_price PRIMARY KEY (instru_rent_id);


CREATE TABLE room (
 room_id INT NOT NULL,
 number_of_available_places INT,
 number_of_participating_students INT,
 student_id INT NOT NULL
);

ALTER TABLE room ADD CONSTRAINT PK_room PRIMARY KEY (room_id);


CREATE TABLE sibling (
 sib_id INT NOT NULL,
 name VARCHAR(500),
 student_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (sib_id);


CREATE TABLE siblings_discount (
 sib_id_0 INT NOT NULL,
 discount_amount DOUBLE PRECISION
);

ALTER TABLE siblings_discount ADD CONSTRAINT PK_siblings_discount PRIMARY KEY (sib_id_0);


CREATE TABLE soundgood_school (
 sc_id INT NOT NULL,
 school_id VARCHAR(12),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100),
 zip_code CHAR(15),
 student_id INT NOT NULL
);

ALTER TABLE soundgood_school ADD CONSTRAINT PK_soundgood_school PRIMARY KEY (sc_id);


CREATE TABLE student_present_skill (
 apply_id INT NOT NULL,
 level VARCHAR(15)
);

ALTER TABLE student_present_skill ADD CONSTRAINT PK_student_present_skill PRIMARY KEY (apply_id);


ALTER TABLE appointment ADD CONSTRAINT FK_appointment_0 FOREIGN KEY (admain_id) REFERENCES administrative_staff (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE audition ADD CONSTRAINT FK_audition_1 FOREIGN KEY (admain_id) REFERENCES administrative_staff (id);


ALTER TABLE email_address ADD CONSTRAINT FK_email_address_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE email_address ADD CONSTRAINT FK_email_address_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE email_address ADD CONSTRAINT FK_email_address_2 FOREIGN KEY (mail_id) REFERENCES email (id);


ALTER TABLE ensembles_lesson ADD CONSTRAINT FK_ensembles_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);



ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);


ALTER TABLE instrument_stock ADD CONSTRAINT FK_instrument_stock_0 FOREIGN KEY (instru_rent_id) REFERENCES instrument_rental (instru_rent_id);
ALTER TABLE instrument_stock ADD CONSTRAINT FK_instrument_stock_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);



ALTER TABLE payment ADD CONSTRAINT FK_payment_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE payment ADD CONSTRAINT FK_payment_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_2 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE receipt ADD CONSTRAINT FK_receipt_0 FOREIGN KEY (pay_id) REFERENCES payment (pay_id);


ALTER TABLE rental_payment ADD CONSTRAINT FK_rental_price_0 FOREIGN KEY (instru_rent_id) REFERENCES instrument_rental (instru_rent_id);


ALTER TABLE room ADD CONSTRAINT FK_room_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE siblings_discount ADD CONSTRAINT FK_siblings_discount_0 FOREIGN KEY (sib_id_0) REFERENCES sibling (sib_id);


ALTER TABLE soundgood_school ADD CONSTRAINT FK_soundgood_school_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE student_present_skill ADD CONSTRAINT FK_student_present_skill_0 FOREIGN KEY (apply_id) REFERENCES application (apply_id);





