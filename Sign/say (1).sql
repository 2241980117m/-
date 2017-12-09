-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-06-01 22:50:49
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
-- 表的结构 `say`
--

CREATE TABLE `say` (
  `context` varchar(1000) NOT NULL COMMENT '留言内容',
  `date` datetime NOT NULL COMMENT '留言时间',
  `id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL COMMENT '留言的成员姓名'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 转存表中的数据 `say`
--

INSERT INTO `say` (`context`, `date`, `id`, `student_name`) VALUES
('第一波留言', '2017-05-27 12:54:21', 21, '马小花'),
('第二波留言', '2017-05-27 12:54:34', 22, '马小花'),
('第五波留言', '2017-05-30 13:45:25', 63, '张浩'),
('第六波留言', '2017-05-30 14:02:58', 64, '张浩'),
('666', '2017-05-30 20:54:24', 65, '王宝彤'),
('有点厉害的样子', '2017-05-30 21:59:23', 67, '陈家兴'),
('1111', '2017-06-01 11:32:56', 134, '张浩'),
('2333', '2017-06-01 16:45:29', 135, '刘煜昊'),
('6666666666666666666666', '2017-06-01 17:03:43', 136, '王星宇'),
('孙娇泳是个zz', '2017-06-01 17:03:56', 137, '王星宇'),
('王星宇个智障           傻X\n', '2017-06-01 17:04:29', 138, '孙娇泳'),
('儿童节快乐啊', '2017-06-01 17:04:30', 139, '王星宇'),
('空调不给力\n应该有个冰箱', '2017-06-01 17:05:26', 140, '孙娇泳'),
('仅表示有点冷  空调转点方向', '2017-06-01 21:43:14', 141, '孙娇泳');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `say`
--
ALTER TABLE `say`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_name` (`student_name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `say`
--
ALTER TABLE `say`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- 限制导出的表
--

--
-- 限制表 `say`
--
ALTER TABLE `say`
  ADD CONSTRAINT `say_ibfk_1` FOREIGN KEY (`student_name`) REFERENCES `sign` (`student_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
