-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.33-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema time_table_management
--

CREATE DATABASE IF NOT EXISTS time_table_management;
USE time_table_management;

--
-- Definition of table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE `buildings` (
  `buliding_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(20) NOT NULL,
  PRIMARY KEY (`buliding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buildings`
--

/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;


--
-- Definition of table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(25) NOT NULL,
  `department_related_faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_related_faculty_id` (`department_related_faculty_id`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`department_related_faculty_id`) REFERENCES `faculties` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;


--
-- Definition of table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
CREATE TABLE `faculties` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(25) NOT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculties`
--

/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;


--
-- Definition of table `lecture_sessions`
--

DROP TABLE IF EXISTS `lecture_sessions`;
CREATE TABLE `lecture_sessions` (
  `lecture_session_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lecture_session_group_id` int(10) unsigned DEFAULT NULL,
  `lecture_session_group_name` varchar(45) DEFAULT NULL,
  `lecture_session_no_of_students` varchar(45) DEFAULT NULL,
  `lecture_session_duration` varchar(45) DEFAULT NULL,
  `lecture_session_detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lecture_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecture_sessions`
--

/*!40000 ALTER TABLE `lecture_sessions` DISABLE KEYS */;
INSERT INTO `lecture_sessions` (`lecture_session_id`,`lecture_session_group_id`,`lecture_session_group_name`,`lecture_session_no_of_students`,`lecture_session_duration`,`lecture_session_detail`) VALUES 
 (1,0,'Group 222315','30','12','Test Subject 22221'),
 (2,0,'Test Group 1','45','10','Test Subject 1');
/*!40000 ALTER TABLE `lecture_sessions` ENABLE KEYS */;


--
-- Definition of table `lecturer_positions`
--

DROP TABLE IF EXISTS `lecturer_positions`;
CREATE TABLE `lecturer_positions` (
  `lecturer_position_level` tinyint(1) NOT NULL,
  `lecturer_position_name` varchar(20) NOT NULL,
  PRIMARY KEY (`lecturer_position_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturer_positions`
--

/*!40000 ALTER TABLE `lecturer_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturer_positions` ENABLE KEYS */;


--
-- Definition of table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
CREATE TABLE `lecturers` (
  `lecturer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lecturer_name` varchar(150) DEFAULT NULL,
  `lecturer_level` varchar(150) DEFAULT NULL,
  `Rank` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturers`
--

/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` (`lecturer_id`,`lecturer_name`,`lecturer_level`,`Rank`) VALUES 
 (3,'Mr. Kaushalya','2','rnk-001'),
 (5,'Mr. Tharindu','5','rnk-0004');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;


--
-- Definition of table `not_available_time_allocations`
--

DROP TABLE IF EXISTS `not_available_time_allocations`;
CREATE TABLE `not_available_time_allocations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lecturer_name` varchar(400) DEFAULT NULL,
  `group_name` varchar(450) DEFAULT NULL,
  `sub_group_name` varchar(450) DEFAULT NULL,
  `session_id_string` varchar(450) DEFAULT NULL,
  `detail` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `not_available_time_allocations`
--

/*!40000 ALTER TABLE `not_available_time_allocations` DISABLE KEYS */;
INSERT INTO `not_available_time_allocations` (`id`,`lecturer_name`,`group_name`,`sub_group_name`,`session_id_string`,`detail`) VALUES 
 (1,'Mr. Kaushalya','g-001','sg-001','ses-00111111','11:45');
/*!40000 ALTER TABLE `not_available_time_allocations` ENABLE KEYS */;


--
-- Definition of table `not_available_times_rooms`
--

DROP TABLE IF EXISTS `not_available_times_rooms`;
CREATE TABLE `not_available_times_rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(450) DEFAULT NULL,
  `day` varchar(45) DEFAULT NULL,
  `start_time` varchar(45) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `not_available_times_rooms`
--

/*!40000 ALTER TABLE `not_available_times_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_available_times_rooms` ENABLE KEYS */;


--
-- Definition of table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_type` varchar(200) DEFAULT NULL,
  `room_capacity` int(10) unsigned DEFAULT NULL,
  `room_related_building_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`room_id`,`room_type`,`room_capacity`,`room_related_building_name`,`room_name`) VALUES 
 (1,'Lecture Hall',50,'Building 1','Test room 1'),
 (2,'Laboratory',45,'Building 1','Test room 2'),
 (4,'Laboratory',20,'Building 2','room 123'),
 (5,'Laboratory',99,'Building 3 ','room 45'),
 (6,'Lecture Hall',200,'Building 1','room test 2');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;


--
-- Definition of table `session_rooms`
--

DROP TABLE IF EXISTS `session_rooms`;
CREATE TABLE `session_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(400) DEFAULT NULL,
  `room_name` varchar(450) DEFAULT NULL,
  `detail` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session_rooms`
--

/*!40000 ALTER TABLE `session_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rooms` ENABLE KEYS */;


--
-- Definition of table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `consecutive_sessions_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consecutive_sessions_tag_id` int(10) unsigned DEFAULT NULL,
  `consecutive_sessions_tag_name` varchar(150) DEFAULT NULL,
  `consecutive_sessions_day` varchar(45) DEFAULT NULL,
  `consecutive_sessions_start_time_hour` varchar(45) DEFAULT NULL,
  `consecutive_sessions_start_time_minutes` varchar(45) DEFAULT NULL,
  `consecutive_sessions_start_time_am_pm` varchar(45) DEFAULT NULL,
  `consecutive_sessions_end_time_hour` varchar(45) DEFAULT NULL,
  `consecutive_sessions_end_time_minutes` varchar(45) DEFAULT NULL,
  `consecutive_sessions_end_time_am_pm` varchar(45) DEFAULT NULL,
  `consecutive_sessions_status` varchar(45) DEFAULT NULL,
  `consecutive_sessions_detail` varchar(450) DEFAULT NULL,
  `consecutive_sessions_session_type` varchar(250) DEFAULT NULL,
  `consecutive_sessions_session_id` int(10) unsigned DEFAULT NULL,
  `consecutive_sessions_session_id_string` varchar(250) DEFAULT NULL,
  `consecutive_sessions_category` varchar(250) DEFAULT NULL,
  `consecutive_sessions_module` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`consecutive_sessions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`consecutive_sessions_id`,`consecutive_sessions_tag_id`,`consecutive_sessions_tag_name`,`consecutive_sessions_day`,`consecutive_sessions_start_time_hour`,`consecutive_sessions_start_time_minutes`,`consecutive_sessions_start_time_am_pm`,`consecutive_sessions_end_time_hour`,`consecutive_sessions_end_time_minutes`,`consecutive_sessions_end_time_am_pm`,`consecutive_sessions_status`,`consecutive_sessions_detail`,`consecutive_sessions_session_type`,`consecutive_sessions_session_id`,`consecutive_sessions_session_id_string`,`consecutive_sessions_category`,`consecutive_sessions_module`) VALUES 
 (2,0,'Tag 1','Monday','03','55','PM','05','35','PM',NULL,NULL,'Consecutive',0,'','','');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `student_groups`
--

DROP TABLE IF EXISTS `student_groups`;
CREATE TABLE `student_groups` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_group_no` varchar(100) DEFAULT NULL,
  `student_sub_group_no` varchar(100) DEFAULT NULL,
  `student_group_id` varchar(45) DEFAULT NULL,
  `student_sub_group_id` varchar(45) DEFAULT NULL,
  `student_academic_year_and_sem` varchar(45) DEFAULT NULL,
  `student_programme` varchar(200) DEFAULT NULL,
  `detail` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_groups`
--

/*!40000 ALTER TABLE `student_groups` DISABLE KEYS */;
INSERT INTO `student_groups` (`student_id`,`student_group_no`,`student_sub_group_no`,`student_group_id`,`student_sub_group_id`,`student_academic_year_and_sem`,`student_programme`,`detail`) VALUES 
 (3,'g-001','sg-001','61','20','2021 SEM 2','Programme 1 ',NULL),
 (4,'G001','4','8','SG002','2022 SEM 1','Programme 4',NULL),
 (5,'G001','4','4','SG002','2021 SEM 1','Programme 1 ',NULL);
/*!40000 ALTER TABLE `student_groups` ENABLE KEYS */;


--
-- Definition of table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `subject_code` varchar(100) NOT NULL,
  `subject_name` varchar(150) DEFAULT NULL,
  `subject_offered_year` varchar(100) DEFAULT NULL,
  `subject_offered_semester` varchar(100) DEFAULT NULL,
  `subject_lecture_hours_amount` int(4) DEFAULT NULL,
  `subject_tutorial_hours` int(4) DEFAULT NULL,
  `subject_lab_hours` int(4) DEFAULT NULL,
  `subject_evaluation_hours` int(4) DEFAULT NULL,
  `subject_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`subject_code`,`subject_name`,`subject_offered_year`,`subject_offered_semester`,`subject_lecture_hours_amount`,`subject_tutorial_hours`,`subject_lab_hours`,`subject_evaluation_hours`,`subject_id`) VALUES 
 ('sub-003','test sub 444444','2022','1',13,70,0,12,4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;


--
-- Definition of table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tag_code` varchar(100) DEFAULT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `tag_related_name` varchar(100) DEFAULT NULL,
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`tag_code`,`tag_name`,`tag_related_name`,`tag_id`) VALUES 
 ('1','lec','Lecture',1),
 ('tg-004','lab','Lab',3),
 ('5','lab 2','Tutuorial',4),
 ('tg-002','lecture 122','Lecture',5);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


--
-- Definition of table `working_days`
--

DROP TABLE IF EXISTS `working_days`;
CREATE TABLE `working_days` (
  `working_day_id` int(11) NOT NULL AUTO_INCREMENT,
  `working_day_no_work_days` int(10) unsigned DEFAULT NULL,
  `working_day_hours` int(2) DEFAULT NULL,
  `working_day_minutes` int(5) DEFAULT NULL,
  `working_day_amount` decimal(10,2) DEFAULT NULL,
  `working_day_monday` tinyint(1) NOT NULL DEFAULT '0',
  `working_day_tuesday` tinyint(1) NOT NULL DEFAULT '0',
  `working_day_wednesday` tinyint(1) NOT NULL DEFAULT '0',
  `working_day_thursday` tinyint(1) NOT NULL DEFAULT '0',
  `working_day_friday` tinyint(1) NOT NULL DEFAULT '0',
  `working_day_saturday` tinyint(1) NOT NULL DEFAULT '0',
  `working_day_sunday` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`working_day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `working_days`
--

/*!40000 ALTER TABLE `working_days` DISABLE KEYS */;
INSERT INTO `working_days` (`working_day_id`,`working_day_no_work_days`,`working_day_hours`,`working_day_minutes`,`working_day_amount`,`working_day_monday`,`working_day_tuesday`,`working_day_wednesday`,`working_day_thursday`,`working_day_friday`,`working_day_saturday`,`working_day_sunday`) VALUES 
 (4,8,10,50,'2500.00',0,1,0,1,0,1,1),
 (9,4,6,25,'3600.00',0,1,0,1,1,0,1),
 (10,4,2,30,'6000.00',0,1,0,1,0,1,0);
/*!40000 ALTER TABLE `working_days` ENABLE KEYS */;


--
-- Definition of table `working_days_amounts`
--

DROP TABLE IF EXISTS `working_days_amounts`;
CREATE TABLE `working_days_amounts` (
  `working_days_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `working_days_amount_per_week` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`working_days_amount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `working_days_amounts`
--

/*!40000 ALTER TABLE `working_days_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `working_days_amounts` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
