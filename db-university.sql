-- SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
    SELECT `name`, `surname` FROM `students` WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
    SELECT * FROM `courses` WHERE `cfu` > 10 ORDER BY `cfu` ASC;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
    SELECT `name`, `surname`, `date_of_birth` FROM `students` WHERE YEAR(`date_of_birth`) < 1992;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
    SELECT * FROM `courses` WHERE `year` = 1 AND `period` = 'i semestre';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
    SELECT * FROM `exams` WHERE HOUR(`hour`) > 14 AND `date` = '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
    SELECT * FROM `degrees` WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
    SELECT COUNT(id) FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
    SELECT COUNT(id) FROM `teachers` WHERE `phone` IS NULL;

-- GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno
    SELECT COUNT(id), YEAR(`enrolment_date`) FROM `students` GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
    SELECT COUNT(office_number), `office_address` FROM `teachers` GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
    SELECT COUNT(exam_id), `exam_id`, ROUND(AVG(`vote`),2) FROM `exam_student` GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
    SELECT COUNT(id), `department_id` FROM `degrees` GROUP BY `department_id`;
