-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.question: ~15 rows (approximately)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
REPLACE INTO `question` (`index_no`, `question_paper`, `question_en`, `question_si`, `question_ta`, `answer_a_en`, `answer_a_si`, `answer_a_ta`, `answer_b_en`, `answer_b_si`, `answer_b_ta`, `answer_c_en`, `answer_c_si`, `answer_c_ta`, `answer_d_en`, `answer_d_si`, `answer_d_ta`, `correct_answer`, `active`) VALUES
	(1, 2, 'To get the best taste, for how many minutes should you brew your Black Tea?', 'Wmßu rih .ekSug kï fldmuK ñks;a;= .Kkla f;a ;eïìh hq;= o@', 'Rpwe;j Urpia ngWtjw;F> vj;jid epkplq;fs; Njapiyia fha;r;r Ntz;Lk;?', '3 - 5 Minutes', 'úkdä 3 - 5', '3 - 5 epkplq;fs;', '5 - 8 Minutes', 'úkdä 5-8', '5 - 8 epkplq;fs;', ' 1 - 2 Minutes', 'úkdä 1-2', '1 - 2 epkplq;fs;', '10 Minutes', 'úkdä 10', '10 epkplq;fs;', 'A', 1),
	(2, 2, 'What is the grade of Dilmah premium leaf tea range?', 'ä,aud  ms%ñhï f;a  ksIamdokhg fhdod .kafka l=uk f;a j¾.h o @', 'by;kh g;upkpak; Njapiy gpuptpd; juk; vd;d?', 'BOP', 'î T ms', 'gp X gP', 'Dust', 'viaÜ', 'J}s;', 'BOPF', 'î T ms t*a', 'gp X gP v/g;', 'OPA', 'T ms tA', 'X gP V', 'C', 1),
	(3, 1, 'How many countries is Dilmah tea exported to?', 'ä,aud f;a fldmuK rgj,a m%udKhlg wmkhkh lrkafka o@', 'vj;jid ehLfSf;F by;kh Njapiy Vw;Wkjp nra;ag;gLfpwJ?', '100 countries', 'rgj,a 100 ', '100 ehLfs;', 'Less than 50 countries', 'rgj,a 50 g wvq', '50 ,w;Fk; Fiwthd ehLfs;', 'Over 100 countries', 'rgj,a 100 g jeä', '100 ,w;F Nkyjpf ehLfs;', '50 countries ', 'rgj,a 50 hs', '50 ehLfs;', 'C', 1),
	(4, 1, 'What is the grade of Dilmah premium leaf tea range?', 'ä,aud  ms%ñhï f;a  ksIamdokhg fhdod .kafka l=uk f;a j¾.h o @', 'by;kh g;upkpak; Njapiy gpuptpd; juk; vd;d?', 'BOP', 'î T ms', 'gp X gP', 'Dust', 'viaÜ', 'J}s;', 'BOPF', 'î T ms t*a', 'gp X gP v/g;', 'OPA', 'T ms tA', 'X gP V', 'C', 1),
	(5, 1, 'What is the botanical name of the tea plant?', 'f;a .fia WoaNso kduh l=ula o@', 'Njapiy nrbapd; jhtutpay; ngaH vd;d?', 'Acacia nilotica', 'weflaIshd ksf,daáld', 'mfhrpah epNyhbfh', 'Camalia Senensis', 'lefï,shd fifkkaisia	', 'fnkypah nridd;]p];', 'Alpinia calcarata', 'w,amSkshd l,alrdgd', 'my;gpdpah fy;fyhlh', 'Aegiceras Corriculatum', 'ta.sfirdia fldßlshqf,agï', 'map[pnru]; nfhupFnylk;', 'B', 1),
	(6, 2, 'Where was Dilmah tea launched for the first time? ', 'ä,aud f;a m%:u jrg yÿkajd fokq ,enqfõ lskï rglo  @ ', 'by;kh Njapiy Kjypy; vq;Nf njhlq;fg;gl;lJ?', 'India ', 'bkaÈhdj 	', ',e;jpah', 'Japan', 'cmdkh', '[g;ghd; ', 'Australia', 'Tiafá%,shdj', 'mT];jpNuypah', 'Russia', 'reishdj', 'u\\;ah', 'C', 1),
	(7, 3, 'What denotes the authenticity & quality of Sri Lankan tea?', ' ,dxlsl m%ñ;shg wkqj ksIamdokh lrk ,o f;a nj ixfla;j;a lrk ,dxPkh ñka l=ula o @', ' ,yq;ifapd; kpf rpwe;j Njapiyia Fwpf;Fk; rpd;dk; vd;d? ', 'Ceylon tea Logo', 'isf,daka à  ,dxPkh 	', ' rpNyhd; B rpd;dk', 'SLS Logo', 'tia t,a tia  ,dxPkh	', 'v]; vy; v]; rpd;dk; ', 'ISO Logo ', 'whs tia ´  ,dxPkh', ' I v]; X rpd;dk; ', 'HACCP Logo', 'tÉ ta is is ms  ,dxPkh', ' vr; V rP rP gP. rpd;dk; ', 'A', 1),
	(8, 3, 'Who planted the first tea tree in Sri Lanka? ', ',xldfõ m%:u f;a .i isgjQfha ljqo @', ',yq;ifapy; KjyhtJ Njapiy nrb ahuhy; elg;gl;lJ?', 'Robert Knox', 'frdnÜ fkdlaia uy;d ', 'nuhgHl; nehf;];', 'James Taylor', 'fcaïia fÜ,¾ uy;d', 'N[k;]; NlyH', 'William Harvey', 'ú,shï ydú uy;d', 'tpy;ypak; `htp', 'James William', 'fcaïia ú,shï uy;d', 'N[k;]; tpy;ypak;', 'B', 1),
	(9, 3, 'What is the botanical name of the tea plant?', 'f;a .fia WoaNso kduh l=ula o@', 'Njapiy nrbapd; jhtutpay; ngaH vd;d?', 'Acacia nilotica', 'weflaIshd ksf,dáld', 'mfhrpah epNyhbfh', 'Camalia Senensis', 'lefï,shd fifkkaisia	', 'fnkypah nridd;]p];', 'Alpinia calcarata', 'w,amSkshd l,alrdgd', 'my;gpdpah fy;fyhlh', 'Aegiceras Corriculatum', 'ta.sfirdia fldßlshqf,agï', 'map[pnru]; nfhupFnylk;', 'B', 1),
	(10, 4, 'What is the grade of Dilmah premium leaf tea range?', 'ä,aud  ms%ñhï f;a  ksIamdokhg fhdod .kafka l=uk f;a j¾.h o @', 'by;kh g;upkpak; Njapiy gpuptpd; juk; vd;d?', 'BOP', 'î T mss', 'gp X gP', 'Dust', 'viaÜ', 'J}s;', 'BOPF', 'î T ms t*a', 'gp X gP v/g;', 'OPA', 'T ms tA', 'X gP V', 'C', 1),
	(11, 4, 'Tea is rich in?', ' kejqï f;a j, nyq,j wvx.= .=Kdx.hla jkafka @', 'J}a Njapiyapy; fhzg;gLk; rpwg;G mk;rk;?', 'Tea is rich in anti-oxidant', 'm%;s Tlaisldrl ', 'md;b-xf;rpld;l; NjitahdsT fhzg;gLtJ', 'Tea is rich in Carbohydrate', 'ldfndayhsâf¾Ü', 'fhNghi`l;Nul; NjitahdsT fhzg;gLtJ', 'Tea is rich in Oxygen', 'Tlaiscka', 'xf;rp[d; NjitahdsT fhzg;gLtJ', 'Tea is rich in Protein', 'fm%daàka ', 'GNuhBd; NjitahdsT fhzg;gLtJ	', 'A', 1),
	(12, 4, 'To get the best taste, for how many minutes should you brew your Black Tea?', 'Wmrsu rih .ekSug kï fldmuK ñks;a;= .Kkla f;a ;eìh hq;= o@', 'Rpwe;j Urpia ngWtjw;F> vj;jid epkplq;fs; Njapiyia fha;r;r Ntz;Lk;?', '3 - 5 Minutes', 'úkdä 3-5', '3 - 5 epkplq;fs;', ' 5 - 8 Minutes', 'úkdä  5-8', '5 - 8 epkplq;fs;', ' 1 ? 2 Minutes', 'úkdä 1-2	', '1 - 2 epkplq;fs;', '10 Minutes', 'úkdä 10', '10 epkplq;fs;', 'A', 1),
	(13, 5, 'How many countries is Dilmah tea exported to?', 'ä,aud f;a" fldmuK rgj,a m%udKhlg wmkhkh lrkafka o@', 'vj;jid ehLfSf;F by;kh Njapiy Vw;Wkjp nra;ag;gLfpwJ?', '100 countries', 'rgj,a 100 ', '100 ehLfs;', 'Less than 50 countries', 'rgj,a 50g wvq', '50 ,w;Fk; Fiwthd ehLfs;', 'Over 100 countries', 'rgj,a 100g jeä', '100 ,w;F Nkyjpf ehLfs;', '50 countries ', 'rgj,a 50 hs ', '50 ehLfs;', 'C', 1),
	(14, 5, 'What denotes the authenticity & quality of Sri Lankan tea?', ',dxlsl mñ;shg wkqj ksIamdokh lrk ,o f;a nj ixfla;j;a lrk ,dxPkh ñka l=ula o @', ' ,yq;ifapd; kpf rpwe;j Njapiyia Fwpf;Fk; rpd;dk; vd;d? ', 'Ceylon tea Logo', 'isf,daka à ,dxPkh 	', 'rpNyhd; B rpd;dk; ', 'SLS Logo', 'tia t,a tia ,dxPkh	', 'v]; vy; v]; rpd;dk; ', 'ISO Logo ', 'whs tia ´ ,dxPkh', 'I v]; X rpd;dk; ', 'HACCP Logo', 'tÉ ta is is ms ,dxPkh', 'vr; V rP rP gP rpd;dk; ', 'A', 1),
	(15, 5, 'From where did tea originate ?', 'f;a uq,au jrg f,dalhg yÿkajd fokq ,enqfõ lskï rfÜ o@', 'Njapiyapd; gpwg;gplk; vJ?', 'Japan', 'cmdkh', '[g;ghd;', 'India', 'bkoshdj	', ',e;jpah', 'China', 'Ökh', 'rPdh', 'Sri Lanka', 'YS% ,xldj', ',yq;if', 'C', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.question_paper: ~5 rows (approximately)
/*!40000 ALTER TABLE `question_paper` DISABLE KEYS */;
REPLACE INTO `question_paper` (`index_no`, `description`, `last_used_on`, `duration_per_question`, `active`) VALUES
	(1, 'Question Paper 01', NULL, 20, 1),
	(2, 'Question Paper 02', NULL, 20, 1),
	(3, 'Question Paper 03', NULL, 20, 1),
	(4, 'Question Paper 04', NULL, 20, 1),
	(5, 'Question Paper 05', NULL, 20, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.quiz_session: ~4 rows (approximately)
/*!40000 ALTER TABLE `quiz_session` DISABLE KEYS */;
REPLACE INTO `quiz_session` (`index_no`, `started_on`, `finished_on`, `location`, `user`, `status`) VALUES
	(1, '2016-07-06 05:30:11', '2016-07-07 04:30:36', 'dsgs', NULL, 'COMPLETED'),
	(2, '2016-07-07 04:30:49', '2016-07-08 01:26:04', 'Panadura Food city', NULL, 'COMPLETED'),
	(3, '2016-07-08 01:26:12', '2016-07-08 01:35:14', 'Panadura Food city', NULL, 'COMPLETED'),
	(4, '2016-07-08 01:36:28', NULL, 'kalutara', NULL, 'ON_GOING');
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
  `winner` tinyint(1) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`index_no`),
  KEY `fk_quiz_session_user_quiz_session1_idx` (`quiz_session`),
  KEY `fk_quiz_session_user_question_paper1_idx` (`question_paper`),
  CONSTRAINT `fk_quiz_session_user_question_paper1` FOREIGN KEY (`question_paper`) REFERENCES `question_paper` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_session_user_quiz_session1` FOREIGN KEY (`quiz_session`) REFERENCES `quiz_session` (`index_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.quiz_session_user: ~28 rows (approximately)
/*!40000 ALTER TABLE `quiz_session_user` DISABLE KEYS */;
REPLACE INTO `quiz_session_user` (`index_no`, `quiz_session`, `question_paper`, `name`, `nic_no`, `mobile_no`, `language`, `winner`, `status`) VALUES
	(1, 1, 5, 'hjygjhghjgjgjh', '', '', 'English', 0, 'active'),
	(2, 1, 3, 'dsfdsf', '', '', 'English', 0, 'active'),
	(3, 1, 3, 'fgdf', '', '', 'English', 0, 'active'),
	(4, 1, 1, 'sgfkk', '', '', 'English', 0, 'active'),
	(5, 1, 2, 'dsfg', '', '', 'English', 0, 'active'),
	(6, 1, 4, 'kaza', '646437', '476476474', 'Sinhala', 1, 'active'),
	(7, 1, 4, 'nidura', '', '', 'English', 1, 'active'),
	(8, 1, 4, 'nidura', '', '', 'English', 0, 'active'),
	(9, 1, 4, 'nidura', '933013650V', '07523424242', 'Sinhala', 0, 'active'),
	(10, 1, 4, 'gyfy', '', '', 'Sinhala', 1, 'active'),
	(11, 1, 1, 'li psjmdfk', '', '', 'Sinhala', 1, 'active'),
	(12, 1, 2, 'kaza', '', '', 'Sinhala', 0, 'active'),
	(13, 1, 2, 'fsdfdf', '', '', 'English', 1, 'active'),
	(14, 2, 4, 'kaza', '353453', '564564', 'Sinhala', 1, 'active'),
	(15, 2, 3, 'nidura', '23523', '45435345', 'Sinhala', 1, 'active'),
	(16, 2, 5, 'sadaka', '45634653', '463463', 'Tamil', 1, 'active'),
	(17, 2, 5, 'lal kumara', '234523', '346346', 'English', 1, 'active'),
	(18, 2, 1, 'udesh', '53453', '7648u4', 'English', 0, 'active'),
	(19, 2, 3, 'li', '43252', '2352', 'English', 1, 'active'),
	(20, 2, 5, 'Nidura', '4634', '', 'English', 0, 'active'),
	(21, 2, 4, 'kamal', '231243', '12321312', 'English', 1, 'active'),
	(22, 2, 3, 'kaza', '000000000V', '0000000000', 'Sinhala', 1, 'active'),
	(23, 2, 5, 'gsdg', '933013650V', '0711727579', 'English', 0, 'active'),
	(24, 3, 3, 'nidura', '1131313', '0334315', 'Tamil', 1, 'active'),
	(25, 3, 4, 'ndsaad', '2133', '03224', 'Sinhala', 1, 'active'),
	(26, 4, 3, 'nidura', '9212313212v', '077123131', 'English', 1, 'active'),
	(27, 4, 5, 'namal', '3242342', '423452', 'Sinhala', 1, 'active'),
	(28, 4, 1, 'arunoda', '32456365', '0787690734', 'Sinhala', 1, 'active');
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.quiz_session_user_answer: ~78 rows (approximately)
/*!40000 ALTER TABLE `quiz_session_user_answer` DISABLE KEYS */;
REPLACE INTO `quiz_session_user_answer` (`index_no`, `quiz_session`, `question_paper`, `question`, `quiz_user`, `answer`, `correct`, `duration`) VALUES
	(1, 1, 5, 13, 1, 'C', 1, 18),
	(2, 1, 5, 14, 1, 'D', 0, 2),
	(3, 1, 5, 15, 1, 'D', 0, 1),
	(4, 1, 3, 7, 2, 'N/A', 0, 20),
	(5, 1, 3, 8, 2, 'N/A', 0, 20),
	(6, 1, 3, 9, 2, 'N/A', 0, 20),
	(7, 1, 1, 3, 4, 'N/A', 0, 20),
	(8, 1, 1, 4, 4, 'N/A', 0, 20),
	(9, 1, 1, 5, 4, 'A', 0, 20),
	(10, 1, 2, 1, 5, 'N/A', 0, 20),
	(11, 1, 2, 2, 5, 'N/A', 0, 20),
	(12, 1, 2, 6, 5, 'N/A', 0, 20),
	(13, 1, 4, 10, 6, 'C', 1, 4),
	(14, 1, 4, 11, 6, 'A', 1, 6),
	(15, 1, 4, 12, 6, 'A', 1, 3),
	(16, 1, 4, 10, 7, 'C', 1, 3),
	(17, 1, 4, 11, 7, 'B', 0, 5),
	(18, 1, 4, 12, 7, 'A', 1, 1),
	(19, 1, 4, 10, 9, 'N/A', 0, 20),
	(20, 1, 4, 11, 9, 'A', 1, 8),
	(21, 1, 4, 12, 9, 'B', 0, 8),
	(22, 1, 4, 10, 10, 'C', 1, 3),
	(23, 1, 4, 11, 10, 'A', 1, 2),
	(24, 1, 4, 12, 10, 'A', 1, 1),
	(25, 1, 1, 3, 11, 'C', 1, 7),
	(26, 1, 1, 4, 11, 'C', 1, 2),
	(27, 1, 1, 5, 11, 'B', 1, 10),
	(28, 1, 2, 1, 12, 'N/A', 0, 20),
	(29, 1, 2, 2, 12, 'N/A', 0, 20),
	(30, 1, 2, 6, 12, 'C', 1, 14),
	(31, 1, 2, 1, 13, 'A', 1, 8),
	(32, 1, 2, 2, 13, 'C', 1, 9),
	(33, 1, 2, 6, 13, 'C', 1, 3),
	(34, 2, 4, 10, 14, 'C', 1, 2),
	(35, 2, 4, 11, 14, 'A', 1, 3),
	(36, 2, 4, 12, 14, 'A', 1, 3),
	(37, 2, 3, 7, 15, 'A', 1, 12),
	(38, 2, 3, 8, 15, 'B', 1, 3),
	(39, 2, 3, 9, 15, 'B', 1, 2),
	(40, 2, 5, 13, 16, 'C', 1, 3),
	(41, 2, 5, 14, 16, 'C', 0, 2),
	(42, 2, 5, 15, 16, 'C', 1, 4),
	(43, 2, 5, 13, 17, 'C', 1, 2),
	(44, 2, 5, 14, 17, 'A', 1, 1),
	(45, 2, 5, 15, 17, 'C', 1, 2),
	(46, 2, 1, 3, 18, 'D', 0, 2),
	(47, 2, 1, 4, 18, 'D', 0, 1),
	(48, 2, 1, 5, 18, 'C', 0, 1),
	(49, 2, 3, 7, 19, 'A', 1, 2),
	(50, 2, 3, 8, 19, 'B', 1, 2),
	(51, 2, 3, 9, 19, 'B', 1, 3),
	(52, 2, 5, 13, 20, 'A', 0, 2),
	(53, 2, 5, 14, 20, 'B', 0, 3),
	(54, 2, 5, 15, 20, 'A', 0, 1),
	(55, 2, 4, 10, 21, 'C', 1, 5),
	(56, 2, 4, 11, 21, 'C', 0, 10),
	(57, 2, 4, 12, 21, 'A', 1, 2),
	(58, 2, 3, 7, 22, 'B', 0, 12),
	(59, 2, 3, 8, 22, 'B', 1, 5),
	(60, 2, 3, 9, 22, 'B', 1, 8),
	(61, 2, 5, 13, 23, 'A', 0, 4),
	(62, 2, 5, 14, 23, 'B', 0, 2),
	(63, 2, 5, 15, 23, 'B', 0, 1),
	(64, 3, 3, 7, 24, 'C', 0, 4),
	(65, 3, 3, 8, 24, 'B', 1, 2),
	(66, 3, 3, 9, 24, 'B', 1, 1),
	(67, 3, 4, 10, 25, 'C', 1, 4),
	(68, 3, 4, 11, 25, 'A', 1, 4),
	(69, 3, 4, 12, 25, 'B', 0, 1),
	(70, 4, 3, 7, 26, 'A', 1, 9),
	(71, 4, 3, 8, 26, 'B', 1, 6),
	(72, 4, 3, 9, 26, 'B', 1, 8),
	(73, 4, 5, 13, 27, 'C', 1, 20),
	(74, 4, 5, 14, 27, 'A', 1, 5),
	(75, 4, 5, 15, 27, 'C', 1, 13),
	(76, 4, 1, 3, 28, 'B', 0, 14),
	(77, 4, 1, 4, 28, 'C', 1, 20),
	(78, 4, 1, 5, 28, 'B', 1, 7);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`index_no`, `name`, `password`, `type`, `active`) VALUES
	(1, 'Quiz-Master', 'chathu123', 'QUIZ_MASTER', 1),
	(2, 'Admin', 'chathu123', 'ADMIN', 1),
	(3, 'User', 'chathu123', 'USER', 1),
	(8, 'kaza', 'kaza', 'ADMIN', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
