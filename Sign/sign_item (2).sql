-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-06-01 22:50:37
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
-- 表的结构 `sign_item`
--

CREATE TABLE `sign_item` (
  `end` datetime NOT NULL COMMENT '签到的结束时间',
  `start` datetime NOT NULL COMMENT '签到开始时间',
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '姓名'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 转存表中的数据 `sign_item`
--

INSERT INTO `sign_item` (`end`, `start`, `id`, `name`) VALUES
('2010-10-11 00:00:00', '2010-10-11 00:00:00', 7, '马小花'),
('2017-06-01 08:14:20', '2017-06-01 08:14:19', 8, '马小花'),
('2017-06-01 09:32:14', '2017-06-01 09:31:33', 9, '张帆'),
('2017-06-01 09:37:37', '2017-06-01 09:36:27', 10, '王宝彤'),
('2017-06-01 09:45:14', '2017-06-01 09:45:13', 11, '马小花'),
('2017-06-01 09:46:19', '2017-06-01 09:37:54', 12, '张浩'),
('2017-06-01 09:50:27', '2017-06-01 09:50:26', 13, '马小花'),
('2017-06-01 11:23:33', '2017-06-01 09:39:12', 14, '王宝彤'),
('2017-06-01 11:33:09', '2017-06-01 11:32:42', 15, '张浩'),
('2017-06-01 20:51:22', '2017-06-01 20:51:21', 16, '刘煜昊'),
('2017-06-01 21:39:14', '2017-06-01 18:54:40', 17, '高明昊'),
('2017-06-01 21:45:58', '2017-06-01 16:30:59', 18, '孙娇泳'),
('2017-06-01 21:46:37', '2017-06-01 21:43:00', 19, '雷豪翔'),
('2017-06-01 21:51:23', '2017-06-01 19:25:47', 20, '康文星');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sign_item`
--
ALTER TABLE `sign_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sign_item`
--
ALTER TABLE `sign_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 限制导出的表
--

--
-- 限制表 `sign_item`
--
ALTER TABLE `sign_item`
  ADD CONSTRAINT `item` FOREIGN KEY (`name`) REFERENCES `sign` (`student_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
