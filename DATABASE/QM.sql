-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.55-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for quiz_db
DROP DATABASE IF EXISTS `quiz_db`;
CREATE DATABASE IF NOT EXISTS `quiz_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quiz_db`;


-- Dumping structure for table quiz_db.question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `index_no` int(11) NOT NULL AUTO_INCREMENT,
  `question_paper` int(11) NOT NULL,
  `question_en` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `question_si` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `question_ta` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_a_en` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_a_si` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_a_ta` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_b_en` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_b_si` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_b_ta` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_c_en` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_c_si` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_c_ta` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_d_en` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_d_si` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `answer_d_ta` varchar(100) CHARACTER SET ucs2 DEFAULT NULL,
  `correct_answer` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`index_no`),
  KEY `fk_question_question_paper_idx` (`question_paper`),
  CONSTRAINT `fk_question_question_paper` FOREIGN KEY (`question_paper`) REFERENCES `question_paper` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.question: ~2 rows (approximately)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
REPLACE INTO `question` (`index_no`, `question_paper`, `question_en`, `question_si`, `question_ta`, `answer_a_en`, `answer_a_si`, `answer_a_ta`, `answer_b_en`, `answer_b_si`, `answer_b_ta`, `answer_c_en`, `answer_c_si`, `answer_c_ta`, `answer_d_en`, `answer_d_si`, `answer_d_ta`, `correct_answer`, `active`) VALUES
	(1, 1, 'kjhkjh', 'kjgjg', 'jk', 'jhk', 'hkh', 'kh', 'kjhk', 'jhkj', 'hkj', 'hkjh', 'kjh', 'kjh', 'kjhk', 'jhlok;', 'jl', '', 1),
	(2, 1, 'kutghldsjlh', 'klkjvjyhtjful', 'kilg', 'jb', 'jvgh', 'cgh', 'lkjb', 'klkj', 'vjhv', 'ghc', 'hjfkj', 'gk', 'hiu', 'gjhf', 'hgdghf', 'A', 1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table quiz_db.question_paper
DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE IF NOT EXISTS `question_paper` (
  `index_no` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET ucs2 NOT NULL,
  `last_used_on` timestamp NULL DEFAULT NULL,
  `duration_per_question` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`index_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.question_paper: ~1 rows (approximately)
/*!40000 ALTER TABLE `question_paper` DISABLE KEYS */;
REPLACE INTO `question_paper` (`index_no`, `description`, `last_used_on`, `duration_per_question`, `active`) VALUES
	(1, 'Question 01', NULL, 20, 1);
/*!40000 ALTER TABLE `question_paper` ENABLE KEYS */;


-- Dumping structure for table quiz_db.quiz_session
DROP TABLE IF EXISTS `quiz_session`;
CREATE TABLE IF NOT EXISTS `quiz_session` (
  `index_no` int(11) NOT NULL AUTO_INCREMENT,
  `started_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished_on` timestamp NULL DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`index_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.quiz_session: ~7 rows (approximately)
/*!40000 ALTER TABLE `quiz_session` DISABLE KEYS */;
REPLACE INTO `quiz_session` (`index_no`, `started_on`, `finished_on`, `location`, `user`, `status`) VALUES
	(1, '2016-06-22 15:08:02', NULL, 'Kandy', NULL, 'ON_GOING'),
	(2, '2016-06-22 15:58:40', NULL, 'Kandy', NULL, 'ON_GOING'),
	(3, '2016-06-22 16:17:15', NULL, 'Colombo', NULL, 'ON_GOING'),
	(4, '2016-06-22 16:21:52', NULL, 'JG', NULL, 'ON_GOING'),
	(5, '2016-06-23 17:51:34', NULL, 'Panadura', NULL, 'ON_GOING'),
	(6, '2016-06-23 17:54:10', NULL, 'Panadura', NULL, 'ON_GOING'),
	(7, '2016-06-23 17:57:41', NULL, 'Panadura', NULL, 'ON_GOING');
/*!40000 ALTER TABLE `quiz_session` ENABLE KEYS */;


-- Dumping structure for table quiz_db.quiz_session_user
DROP TABLE IF EXISTS `quiz_session_user`;
CREATE TABLE IF NOT EXISTS `quiz_session_user` (
  `index_no` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_session` int(11) NOT NULL,
  `question_paper` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nic_no` varchar(25) NOT NULL,
  `mobile_no` varchar(25) NOT NULL,
  `language` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`index_no`),
  KEY `fk_quiz_session_user_quiz_session1_idx` (`quiz_session`),
  KEY `fk_quiz_session_user_question_paper1_idx` (`question_paper`),
  CONSTRAINT `fk_quiz_session_user_question_paper1` FOREIGN KEY (`question_paper`) REFERENCES `question_paper` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_session_user_quiz_session1` FOREIGN KEY (`quiz_session`) REFERENCES `quiz_session` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.quiz_session_user: ~13 rows (approximately)
/*!40000 ALTER TABLE `quiz_session_user` DISABLE KEYS */;
REPLACE INTO `quiz_session_user` (`index_no`, `quiz_session`, `question_paper`, `name`, `nic_no`, `mobile_no`, `language`, `status`) VALUES
	(1, 1, 1, 'jgjg', 'kjhkjh', 'jkhkh', 'Sinhala', 'active'),
	(2, 1, 1, 'lkjlk', 'jlkjl', 'lkkl', 'Sinhala', 'active'),
	(3, 1, 1, 'sdf', 'kjhk', 'khjhk', 'English', 'active'),
	(4, 1, 1, 'fdsg', 'dfg', 'dfg', 'Sinhala', 'active'),
	(5, 1, 1, 'lkjl', 'kjlkjl', 'kjllkj', 'Sinhala', 'active'),
	(6, 1, 1, 'sdfkh', 'kjhkj', 'hkj', 'Sinhala', 'active'),
	(7, 2, 1, 'jhj', 'khkjhkj', 'kjhkj', 'English', 'active'),
	(8, 2, 1, 'dfsdf', 'sdfsdf', 'sdg', 'Tamil', 'active'),
	(9, 2, 1, 'kjk', 'hkjh', 'kjhk', 'Sinhala', 'active'),
	(10, 2, 1, 'kjdfh', 'kjhkjh', 'khk', 'Sinhala', 'active'),
	(11, 3, 1, 'dfg', 'jhkj', 'hkjh', 'English', 'active'),
	(12, 5, 1, 'roshan', '68', '7688', 'English', 'active'),
	(13, 7, 1, 'asd', 'sdf', 'sdf', 'Sinhala', 'active');
/*!40000 ALTER TABLE `quiz_session_user` ENABLE KEYS */;


-- Dumping structure for table quiz_db.quiz_session_user_answer
DROP TABLE IF EXISTS `quiz_session_user_answer`;
CREATE TABLE IF NOT EXISTS `quiz_session_user_answer` (
  `index_no` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_session` int(11) NOT NULL,
  `question_paper` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `quiz_user` int(11) NOT NULL,
  `answer` varchar(25) NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`index_no`),
  KEY `fk_quiz_session_user_answer_quiz_session1_idx` (`quiz_session`),
  KEY `fk_quiz_session_user_answer_question1_idx` (`question`),
  KEY `fk_quiz_session_user_answer_question_paper1_idx` (`question_paper`),
  KEY `fk_quiz_session_user_answer_quiz_session_user1_idx` (`quiz_user`),
  CONSTRAINT `fk_quiz_session_user_answer_question1` FOREIGN KEY (`question`) REFERENCES `question` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_session_user_answer_question_paper1` FOREIGN KEY (`question_paper`) REFERENCES `question_paper` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_session_user_answer_quiz_session1` FOREIGN KEY (`quiz_session`) REFERENCES `quiz_session` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_session_user_answer_quiz_session_user1` FOREIGN KEY (`quiz_user`) REFERENCES `quiz_session_user` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.quiz_session_user_answer: ~26 rows (approximately)
/*!40000 ALTER TABLE `quiz_session_user_answer` DISABLE KEYS */;
REPLACE INTO `quiz_session_user_answer` (`index_no`, `quiz_session`, `question_paper`, `question`, `quiz_user`, `answer`, `correct`, `duration`) VALUES
	(1, 1, 1, 1, 1, 'N/A', 0, 20),
	(2, 1, 1, 2, 1, 'N/A', 0, 20),
	(3, 1, 1, 1, 2, 'A', 0, 18),
	(4, 1, 1, 2, 2, 'A', 1, 2),
	(5, 1, 1, 1, 3, 'A', 0, 1),
	(6, 1, 1, 2, 3, 'B', 0, 0),
	(7, 1, 1, 1, 4, 'N/A', 0, 20),
	(8, 1, 1, 2, 4, 'N/A', 0, 20),
	(9, 1, 1, 1, 5, 'C', 0, 5),
	(10, 1, 1, 2, 5, 'D', 0, 5),
	(11, 1, 1, 1, 6, 'D', 0, 1),
	(12, 1, 1, 2, 6, 'B', 0, 0),
	(13, 2, 1, 1, 7, 'A', 0, 8),
	(14, 2, 1, 2, 7, 'B', 0, 1),
	(15, 2, 1, 1, 8, 'B', 0, 1),
	(16, 2, 1, 2, 8, 'D', 0, 2),
	(17, 2, 1, 1, 9, 'B', 0, 1),
	(18, 2, 1, 2, 9, 'B', 0, 0),
	(19, 2, 1, 1, 10, 'A', 0, 2),
	(20, 2, 1, 2, 10, 'D', 0, 0),
	(21, 3, 1, 1, 11, 'A', 0, 5),
	(22, 3, 1, 2, 11, 'D', 0, 0),
	(23, 5, 1, 1, 12, 'B', 0, 16),
	(24, 5, 1, 2, 12, 'C', 0, 8),
	(25, 7, 1, 1, 13, 'A', 0, 0),
	(26, 7, 1, 2, 13, 'B', 0, 0);
/*!40000 ALTER TABLE `quiz_session_user_answer` ENABLE KEYS */;


-- Dumping structure for table quiz_db.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `index_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`index_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`index_no`, `name`, `password`, `type`, `active`) VALUES
	(1, 'user', '123', 'ADMIN', 1),
	(2, 'q', 'q', 'Quiz Master', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
