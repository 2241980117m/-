-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-06-01 22:50:43
-- 服务器版本： 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_sign`
--

-- --------------------------------------------------------

--
-- 表的结构 `sign`
--

CREATE TABLE `sign` (
  `student_id` varchar(8) NOT NULL COMMENT '密码',
  `student_name` varchar(100) NOT NULL COMMENT '成员姓名',
  `last` time NOT NULL COMMENT '签到的总计时间',
  `class_id` varchar(1) NOT NULL COMMENT '组号',
  `time` int(11) NOT NULL COMMENT '签到次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 转存表中的数据 `sign`
--

INSERT INTO `sign` (`student_id`, `student_name`, `last`, `class_id`, `time`) VALUES
('04153006', '付世琦', '00:00:00', '3', 0),
('04161016', '刘帅', '00:00:37', '3', 2),
('04151010', '刘林炫', '00:00:00', '3', 0),
('04161014', '刘浩森', '02:23:48', '1', 1),
('04162126', '刘煜昊', '01:49:47', '3', 2),
('04153071', '刘锁阵', '00:00:00', '3', 0),
('04162027', '孙娇泳', '08:40:38', '3', 2),
('04162051', '康文星', '02:25:36', '2', 1),
('04153125', '张帆', '00:00:41', '1', 1),
('04162105', '张昱昆', '02:00:00', '2', 1),
('04152072', '张浩', '00:00:00', '1', 0),
('04151098', '方冉月', '00:00:00', '4', 0),
('04163120', '杨傲', '00:00:00', '3', 0),
('04151087', '杨锐夫', '00:00:00', '2', 0),
('04152036', '王嘉盛', '00:00:00', '2', 0),
('04161082', '王宝彤', '01:45:31', '2', 2),
('04162052', '王明雪', '00:00:00', '4', 0),
('04162110', '王星宇', '00:00:00', '3', 0),
('04151082', '谢子琦', '00:00:00', '3', 0),
('xiyounet', '路妍', '00:00:00', '3', 0),
('04153064', '邹丹阳', '00:00:00', '1', 0),
('04152119', '郭吉航', '00:00:00', '1', 0),
('04153168', '郭文英', '00:00:00', '1', 0),
('04162099', '陈嘉男', '01:02:19', '2', 2),
('04152002', '陈家兴', '01:22:00', '2', 1),
('04162101', '雷豪翔', '02:03:42', '2', 3),
('04163111', '马伸', '00:00:17', '1', 1),
('04152034', '马小花', '02:20:27', '1', 54),
('04162062', '高明昊', '02:44:43', '1', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sign`
--
ALTER TABLE `sign`
  ADD PRIMARY KEY (`student_name`,`class_id`),
  ADD KEY `class_id` (`class_id`);

--
-- 限制导出的表
--

--
-- 限制表 `sign`
--
ALTER TABLE `sign`
  ADD CONSTRAINT `sign_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
