INSERT INTO administrative_staff(id,employee_name,employment_id)
VALUES (1,'Elen','1256784903');
INSERT INTO administrative_staff VALUES(2,'Leenea','1258784903');
INSERT INTO administrative_staff VALUES (3,'Nemar','1258784900');
INSERT INTO administrative_staff VALUES (4,'Simon','1258787900');


ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);
INSERT INTO instructor(id,first_name,last_name,person_number,zip_code,country,city,street_number,street_name) VALUES
(1,'Loay','Hanson',198809438010,'Sweden','Stockholm','46046',8,'Sollentunavagen');
INSERT INTO instructor VALUES (2,'Leif','Larssonn',196809438012,'Sweden','Stockholm','46066',8,'Solna');
INSERT INTO instructor VALUES (3,'Nina','Hedberg',196909438012,'Sweden','Stockholm','11166',9,'Kadettgatan');
INSERT INTO instructor VALUES (4,'Samo','Lindberg',197709438012,'Sweden','Stockholm','11163',2,'Kadettgatan');
INSERT INTO instructor VALUES (5,'Salma','Lindqvist',197009438012,'Sweden','Stockholm','11103',2,'Kronansgatan');


INSERT INTO instrument_stock(instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id)
VALUES (1,20,17,399,1);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (2,30,15,70,2);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (3,30,12,100,3);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (4,30,10,250,4);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (5,30,9,75,5);
INSERT INTO instrument_stock (instru_rent_id,total_quantity_of_instrument,available_quantity_of_instrument,renting_price,instrument_id) VALUES (6,30,11,500,6);

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


ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (aud_id);
INSERT INTO audition(aud_id,aud_time,student_result,student_id,admain_id)
VALUES (1,'2020-01-30 00:09:30',true,2,1);
INSERT INTO audition VALUES (2,'2020-02-28 00:09:30',false,5,3);
INSERT INTO audition VALUES (3,'2020-04-30 00:09:30',false,10,1);
INSERT INTO audition VALUES (4,'2020-05-30 00:09:30',true,5,3);
INSERT INTO audition VALUES (5,'2020-06-30 00:09:30',true,10,1);

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


INSERT INTO instrument(instr_id,instrument_name) VALUES
(1,'piano');
INSERT INTO instrument VALUES(2,'cello');
INSERT INTO instrument VALUES(3,'grand piano');
INSERT INTO instrument VALUES(4,'guitar');
INSERT INTO instrument VALUES(5,'violin');
INSERT INTO instrument VALUES(6,'maracas');
INSERT INTO instrument VALUES(7,'bongo drums');


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