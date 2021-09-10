
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ISBN` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `issued` int(10) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- table `books`

INSERT INTO `books` (`id`, `ISBN`, `name`, `author`, `publisher`, `quantity`, `issued`, `added_date`) VALUES
(1, '138959224', '123456789, 'Billy', 'publusher1', 5, 3, '2016-07-19 19:37:56'),
(2, '129405894', '123456780', 'sams', 'publisher2', 7, 2, '2016-07-18 18:39:52'),
(3, '149009845', '123456789', 'rachel', 'publisher3', 10, 1, '2016-07-18 23:02:14');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
