
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


-- Table structure for table `issuebooks`

CREATE TABLE IF NOT EXISTS `issuebooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(50) NOT NULL,
  `studentid` int(11) NOT NULL,
  `studentname` varchar(50) NOT NULL,
  `issueddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;


INSERT INTO `issuebooks` (`id`, `ISBN`, `studentid`, `studentname`, `issueddate`) VALUES
(4, '123456789', 13489423, 'billy', '2016-07-19 18:43:16'),
(6, '123456789', 12498335, 'samsmith', '2016-07-19 18:44:34'),
(7, '123456789', 13596587, 'rachel', '2016-07-19 18:46:12');

