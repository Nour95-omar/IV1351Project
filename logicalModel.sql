DROP DATABASE IF EXISTS db;
CREATE DATABASE db;
USE db;

CREATE TABLE administrative_staff (
 id INT NOT NULL,
 employee_name VARCHAR(500),
 office_place VARCHAR(30),
 employment_id VARCHAR(10)
);

ALTER TABLE administrative_staff ADD CONSTRAINT PK_administrative_staff PRIMARY KEY (id);


CREATE TABLE appointment (
 app_id INT NOT NULL,
 particate_student_id VARCHAR(12),
 teacher_name VARCHAR(10),
 instrument VARCHAR(30),
 student_level VARCHAR(10),
 employment_id INT NOT NULL
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
 person_number VARCHAR(12) NOT NULL,
 zip_code CHAR(15),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instrument (
 id INT NOT NULL,
 instrument_name VARCHAR(30)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE phone (
 id INT NOT NULL,
 phone_number VARCHAR(15) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE student (
 id INT NOT NULL,
 person_number VARCHAR(12),
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100),
 zip_code CHAR(15)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE total_price (
 price_For_Certain_days DOUBLE PRECISION,
 price_by_type_of_lesson DOUBLE PRECISION,
 price_by_level DOUBLE PRECISION,
 number_of_lessons INT
);


CREATE TABLE application (
 apply_id INT NOT NULL,
 status VARCHAR(30),
 application_id VARCHAR(10),
 student_id INT NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (apply_id);


CREATE TABLE audition (
 aud_id INT NOT NULL,
 date DATE,
 time TIMESTAMP(6),
 student_result CHAR(10),
 student_id INT NOT NULL,
 employment INT NOT NULL
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (aud_id);


CREATE TABLE email_address (
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 mail_id INT NOT NULL
);

ALTER TABLE email_address ADD CONSTRAINT PK_email_address PRIMARY KEY (instructor_id,student_id,mail_id);


CREATE TABLE ensembles_lesson (
 ens_id INT NOT NULL,
 number_of_students INT,
 genre VARCHAR(30),
 time TIMESTAMP(6),
 instructor_id INT NOT NULL
);

ALTER TABLE ensembles_lesson ADD CONSTRAINT PK_ensembles_lesson PRIMARY KEY (ens_id);


CREATE TABLE group_lesson (
 grp_id INT NOT NULL,
 number_of_places INT,
 time TIMESTAMP(6),
 instrument VARCHAR(30),
 level VARCHAR(15),
 instructor_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (grp_id);


CREATE TABLE individual_lesson (
 ind_id INT NOT NULL,
 number_of_lessons INT,
 instrument VARCHAR(30),
 instructor_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (ind_id);


CREATE TABLE instrument_rental (
 instru_rent_id INT NOT NULL,
 number_of_rented_instruments INT,
 type_of_rented_instrument VARCHAR(50),
 renting_period VARCHAR(30),
 renting_price DOUBLE PRECISION,
 student_id INT NOT NULL,
 instru_ret_id INT NOT NULL,
 instru_id INT NOT NULL
);

ALTER TABLE instrument_rental ADD CONSTRAINT PK_instrument_rental PRIMARY KEY (instru_rent_id);


CREATE TABLE payment (
 pay_id CHAR(10) NOT NULL,
 amount DOUBLE PRECISION,
 date DATE,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL,
 instru_rent_id INT
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


ALTER TABLE appointment ADD CONSTRAINT FK_appointment_0 FOREIGN KEY (employment_id) REFERENCES administrative_staff (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE audition ADD CONSTRAINT FK_audition_1 FOREIGN KEY (employment) REFERENCES administrative_staff (id);


ALTER TABLE email_address ADD CONSTRAINT FK_email_address_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE email_address ADD CONSTRAINT FK_email_address_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE email_address ADD CONSTRAINT FK_email_address_2 FOREIGN KEY (mail_id) REFERENCES email (id);


ALTER TABLE ensembles_lesson ADD CONSTRAINT FK_ensembles_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_1 FOREIGN KEY (instru_id) REFERENCES instrument (id);


ALTER TABLE payment ADD CONSTRAINT FK_payment_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE payment ADD CONSTRAINT FK_payment_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE payment ADD CONSTRAINT FK_payment_2 FOREIGN KEY (instru_rent_id) REFERENCES instrument_rental (instru_rent_id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_2 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE receipt ADD CONSTRAINT FK_receipt_0 FOREIGN KEY (pay_id) REFERENCES payment (pay_id);


ALTER TABLE room ADD CONSTRAINT FK_room_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE siblings_discount ADD CONSTRAINT FK_siblings_discount_0 FOREIGN KEY (sib_id_0) REFERENCES sibling (sib_id);


ALTER TABLE soundgood_school ADD CONSTRAINT FK_soundgood_school_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE student_present_skill ADD CONSTRAINT FK_student_present_skill_0 FOREIGN KEY (apply_id) REFERENCES application (apply_id);


