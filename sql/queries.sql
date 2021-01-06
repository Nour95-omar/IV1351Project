-- TASK 1
-- The Number of instrument rented per month during a specified year
CREATE VIEW rented_instru_per_month AS
SELECT COUNT(*) AS rentals_per_month, EXTRACT(MONTH FROM renting_start_date) AS month
FROM instrument_rental
WHERE EXTRACT(YEAR FROM renting_start_date) = '2019'
GROUP BY EXTRACT(MONTH FROM renting_start_date)
ORDER BY COUNT(*) 

-- The number of rented instrument per instrument type
CREATE VIEW rented_instru_type_per_month AS
SELECT COUNT(*) AS rentals_per_month, instrument.instrument_name AS instrument_name 
FROM instrument_rental, instrument
WHERE instrument_rental.instrument_id=instrument.instr_id
GROUP BY instrument_name
ORDER BY COUNT(*) 

-- /////TASK2///////
CREATE VIEW avg_rented_instru_per_month AS
SELECT (CAST(COUNT(*) AS double)/12) AS rentals_per_month, EXTRACT(MONTH FROM renting_start_date) AS month
FROM instrument_rental
WHERE EXTRACT(YEAR FROM renting_start_date) = '2019'
GROUP BY EXTRACT(MONTH FROM renting_start_date)
ORDER BY month

-- ///////////////////////Task3///////////////////////
-- Number of individual lessons per month during a specified year
CREATE VIEW number_of_indi_lessons AS
SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS number_of_lessons
FROM individual_lesson AS ind
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
ORDER BY month 

-- Number of group lessons per month during a specified year
CREATE VIEW number_of_indi_lessons_per_month AS
SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS number_of_lessons
FROM group_lesson AS gro
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
ORDER BY month 




-- //////////////number of total lessons per month during a specified year////
CREATE VIEW total_number_of_lessons AS
SELECT SUM(total_number_of_lessons), month
FROM(
SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

 UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS total_number_of_lessons
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

) AS total_number_of_lessons
GROUP BY month
ORDER BY month


-- ////Number of lesson per year(just one number)////
CREATE VIEW total_number_of_lessons_per_year AS
SELECT SUM(total_number_of_lessons) AS number_of_lessons, year
FROM(
SELECT EXTRACT(YEAR FROM lesson_time)AS year , COUNT(*) AS total_number_of_lessons
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) 
GROUP BY EXTRACT(YEAR FROM lesson_time)

  UNION ALL
 SELECT EXTRACT(YEAR FROM lesson_time)AS year , COUNT(*) AS total_number_of_lessons
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)
GROUP BY EXTRACT(YEAR FROM lesson_time)

 UNION ALL
 SELECT EXTRACT(YEAR FROM lesson_time) AS month , COUNT(*) AS total_number_of_lessons
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)
GROUP BY EXTRACT(YEAR FROM lesson_time)

) AS total_number_of_lessons
GROUP BY year

-- ///////////Number of lessons and the specific number of individual lessons, group lessons and ensembles/////
CREATE VIEW total_number_of_lessons_specific_type AS
SELECT lesson_type ,SUM(total_number_of_lessons) AS number_of_lessons
FROM(
SELECT  COUNT(*) AS total_number_of_lessons,'group_lesson' AS lesson_type
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'

  UNION ALL
 SELECT  COUNT(*) AS total_number_of_lessons,'individual_lesson' AS lesson_type
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'

 UNION ALL
 SELECT COUNT(*) AS total_number_of_lessons,'ensembles_lesson' AS lesson_type
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'

) AS total_number_of_lessons
GROUP BY  lesson_type
-- //////TASK4/////
-- ///The avg number of lessons per month during the entire year divided by lesson type////
CREATE VIEW avg_number_of_lessons_specific_type AS
SELECT lesson_type,month ,AVG(total_number_of_lessons)/12 AS avg_number_of_lessons,SUM(total_number_of_lessons) AS total_num_of_lessons
FROM(
SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons,'group_lesson' AS lesson_type
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons,'individual_lesson' AS lesson_type
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
 UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month ,COUNT(*) AS total_number_of_lessons,'ensembles_lesson' AS lesson_type
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
) AS total_number_of_lessons
GROUP BY  lesson_type,month
ORDER BY month

-- /////TASK4/////
-- /////////The avg number of lessons per month during the entire year//////

CREATE VIEW avg_number_of_lessons_per_month AS
SELECT month ,SUM(total_number_of_lessons)/12 AS avg_number_of_lessons,SUM(total_number_of_lessons) AS total_num_of_lessons
FROM(
SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
 UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month ,COUNT(*) AS total_number_of_lessonns
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
) AS total_number_of_lessons
GROUP BY month
ORDER BY month


-- /////TASK5//////
-- /////instructors that gave more that one lesson during the current month /////

CREATE VIEW number_of_instructor_lessons_during_amonth AS
SELECT first_name,last_name,instructor_id,SUM(num_lessons)AS num_lessons,month
FROM(
SELECT gro.instructor_id,ins.first_name AS first_name,ins.last_name AS last_name ,COUNT(gro.instructor_id) AS num_lessons, EXTRACT(MONTH FROM lesson_time) AS month
FROM group_lesson AS gro, instructor AS ins
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE) AND gro.instructor_id=ins.id
GROUP BY instructor_id,month,first_name,last_name
HAVING  COUNT(instructor_id)>1
UNION ALL
SELECT ens.instructor_id,ins.first_name AS first_name,ins.last_name AS last_name ,COUNT(ens.instructor_id) AS num_lessons, EXTRACT(MONTH FROM lesson_time) AS month
FROM ensembles_lesson AS ens, instructor AS ins
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE) AND ens.instructor_id=ins.id
GROUP BY instructor_id,month,first_name,last_name
HAVING  COUNT(instructor_id)>1
UNION ALL
SELECT ind.instructor_id,ins.first_name AS first_name,ins.last_name AS last_name, COUNT(ind.instructor_id) AS num_lessons, EXTRACT(MONTH FROM lesson_time) AS month
FROM individual_lesson As ind, instructor AS ins
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE) AND ind.instructor_id=ins.id
GROUP BY instructor_id,month,first_name,last_name
HAVING  COUNT(instructor_id)>1) AS num_lessons
GROUP BY instructor_id,month,first_name,last_name
LIMIT 3


-- //////////Sum all lessons, independent of type///////
CREATE VIEW sum_lessons_depending_on_type AS
SELECT instructor_id,SUM(num_lessons)AS num_lessons, lesson_type,month
FROM(
SELECT instructor_id, COUNT(instructor_id) AS num_lessons, 'group_lesson' AS lesson_type,EXTRACT(MONTH FROM lesson_time) AS month
FROM group_lesson
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)
UNION ALL
SELECT instructor_id, COUNT(instructor_id) AS num_lessons,'ensembles_lesson' AS lesson_type, EXTRACT(MONTH FROM lesson_time) AS month
FROM ensembles_lesson 
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)
UNION ALL
SELECT instructor_id, COUNT(instructor_id) AS num_lessons, 'individual_lesson' AS lesson_type,EXTRACT(MONTH FROM lesson_time) AS month
FROM individual_lesson
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)) AS num_lessons
GROUP BY instructor_id,month, lesson_type
ORDER BY num_lessons DESC

-- /////////////the three instructors having given most lessons (independent of lesson type) during the last month, sorted by number of given lessons.//////
CREATE VIEW instructors_have_most_lessons_last_month AS
SELECT instructor_id,SUM(num_lessons)AS num_lessons, lesson_type,month
FROM(
SELECT instructor_id, COUNT(instructor_id) AS num_lessons, 'group_lesson' AS lesson_type,EXTRACT(MONTH FROM lesson_time) AS month
FROM group_lesson
WHERE EXTRACT(MONTH FROM lesson_time)='12' AND EXTRACT(YEAR FROM lesson_time)='2019'
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)>1 
UNION ALL
SELECT instructor_id, COUNT(instructor_id) AS num_lessons,'ensembles_lesson' AS lesson_type, EXTRACT(MONTH FROM lesson_time) AS month
FROM ensembles_lesson 
WHERE EXTRACT(MONTH FROM lesson_time)='12' AND EXTRACT(YEAR FROM lesson_time)='2019'
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)>1 
UNION ALL
SELECT instructor_id, COUNT(instructor_id) AS num_lessons, 'individual_lesson' AS lesson_type,EXTRACT(MONTH FROM lesson_time) AS month
FROM individual_lesson
WHERE EXTRACT(MONTH FROM lesson_time)='12' AND EXTRACT(YEAR FROM lesson_time)='2019'
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)>1) AS num_lessons
GROUP BY instructor_id,month, lesson_type
ORDER BY num_lessons DESC
LIMIT 3

-- /////////////////////TASK6/////////////
CREATE VIEW ensembles_lesson_next_week AS
SELECT genre, COUNT(genre) AS num_lessons_of_same_genre, DAYNAME(lesson_time) AS day, 
(CASE
    WHEN (avi_seats =1 )THEN 'There are 1-2 seats available'
    WHEN (avi_seats =2 )THEN 'There are 1-2 seats available'
    WHEN  (avi_seats > 2) THEN 'More than 2 seats are available'
    ELSE 'Full booked'
END) AS status_of_seats
FROM ensembles_lesson
WHERE EXTRACT(WEEK FROM lesson_time)=EXTRACT(WEEK FROM CURRENT_DATE+1) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY genre,day,status_of_seats
ORDER BY day DESC

-- //////////////Task7///////
-- /////List the three instrument with the lowest monthly fee and for each tell whether it is rented or available/////
CREATE VIEW  instruments_with_lowest_fee AS
SELECT inst.renting_price, instrument_id AS id, ins.instrument_name AS instrument,inst.available_quantity_of_instrument AS available_quantity
FROM instrument_stock AS inst,instrument AS ins
WHERE inst.instrument_id=ins.instr_id 
GROUP BY instrument_id,renting_price,instrument_name,available_quantity_of_instrument
ORDER BY renting_price,available_quantity,instrument,id
LIMIT 3

-- ////////List the three instruments with the lowest monthly rental fee. For each instrument tell whether it is rented or available to rent. Also tell when the next group lesson for each listed instrument is scheduled.////////
CREATE VIEW instruments_with_lowest_fee_next_gro_lesson_each AS
SELECT ins.instr_id AS instrument_id,ins.instrument_name AS instrument,inst.renting_price AS price,available_quantity_of_instrument AS available_quantity, gro.lesson_time AS next_lesson
FROM instrument_stock AS inst,group_lesson AS gro, instrument AS ins
WHERE  inst.instrument_id=ins.instr_id AND ins.instr_id =gro.instrument_id AND gro.lesson_time>CURRENT_DATE
GROUP BY price,available_quantity,next_lesson,instrument,instrument_id
ORDER BY price
LIMIT 3

