-- Username: RFvscEGK0c
--Password: Oh3oyKFjF5
--Database Name: RFvscEGK0c
--Server: remotemysql.com
--Port: 3306


SELECT * from block;

DROP TABLE IF EXISTS `hostel`;

CREATE TABLE `hostel` (
  `hname` varchar(100) NOT NULL,
  `hid` varchar(45) NOT NULL,
  `blocks` int(11) NOT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `hostel` VALUES ('Posham Men\'sHostel','pmh',3),('Tirumala Men\'s Hostel','tmh',1);


DROP TABLE IF EXISTS `block`;

CREATE TABLE `block` (
  `bname` varchar(50) NOT NULL,
  `bid` varchar(45) NOT NULL,
  `hid` varchar(45) NOT NULL,
  `rooms` varchar(45) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `block_fk_idx` (`hid`),
  CONSTRAINT `block_fk` FOREIGN KEY (`hid`) REFERENCES `hostel` (`hid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO block VALUES ('b1','pmhb1','pmh','1'),('b2','pmhb2','pmh','3'),('b3','pmhb3','pmh','2'),('b1','tmhb1','tmh','5');



DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `rno` varchar(15) NOT NULL,
  `rid` varchar(20) NOT NULL,
  `bid` varchar(45) NOT NULL,
  `cost` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `room_fk_idx` (`bid`),
  CONSTRAINT `room_bid_fk` FOREIGN KEY (`bid`) REFERENCES `block` (`bid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO room VALUES ('507','pmhb2_507','pmhb2',5500,4),('508','pmhb2_508','pmhb2',6000,3),('509','pmhb2_509','pmhb2',7500,2),('508','tmhb1_508','tmhb1',6000,3);





DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `name` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `id` varchar(45) NOT NULL,
  `doj` date NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `room` varchar(45) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `bid` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mobile`),
  KEY `bid_idx` (`bid`),
  CONSTRAINT `person_bid_fk` FOREIGN KEY (`bid`) REFERENCES `block` (`bid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `person` VALUES ('lokireddy','7799885251','123456789','2015-02-01','hyd','508',6000,'pmhb2',NULL);



DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `uid` varchar(50) NOT NULL DEFAULT '',
  `pwd` varchar(45) NOT NULL,
  `hid` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `hid_idx` (`hid`),
  CONSTRAINT `hostel_hid_fk` FOREIGN KEY (`hid`) REFERENCES `hostel` (`hid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `login` VALUES ('kanthreddy@gmail.com','kanthreddy','pmh'),('lokireddy@gmail.com','lokireddy','tmh');

