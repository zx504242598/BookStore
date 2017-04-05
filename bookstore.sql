/*
Navicat MySQL Data Transfer

Source Server         : localhost_3307
Source Server Version : 50712
Source Host           : localhost:3307
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-03-28 11:40:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `catalogid` int(11) NOT NULL,
  `picture` varchar(30) NOT NULL,
  `producer` varchar(50) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `pdate` date DEFAULT NULL,
  `described` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  KEY `catalogid` (`catalogid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`catalogid`) REFERENCES `catalog` (`catalogid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'java编程思想', '86', '1', '1.png', '清华大学出版社', '10', '2017-02-08', '从本书获得的各项大奖以及来自世界各地的读者评论中，不难看出这是一本经典之作。本书的作者拥有多年教学经验，对C、C++以及Java语言都有独到、深入的见解，以通俗易懂及小而直接的示例解释了一个个晦涩抽象的概念。本书共22章，包括操作符、控制执行流程、访问权限控制、复用类、多态、接口、通过异常处理错误、字符串、泛型、数组、容器深入研究、JavaI/O系统、枚举类型、并发以及图形化用户界面等内容。');
INSERT INTO `book` VALUES ('4', 'Java从入门到精通', '18', '1', '4.png', '清华大学出版社', '80', '2017-01-25', '《Java从入门到精通（第3版）》从初学者角度出发，通过通俗易懂的语言、丰富多彩的实例，详细介绍了使用Java语言进行程序开发需要掌握的知识。');
INSERT INTO `book` VALUES ('5', 'Python基础教程', '53', '1', '5.png', '人民邮电出版社', '100', '2016-11-16', 'Python入门佳作 经典教程的全新修订 10个项目引人入胜');
INSERT INTO `book` VALUES ('6', '边城', '18', '2', '6.png', '武汉出版社', '18', '2017-02-22', '《边城》是作者最负盛名的代表作，凭此书一举奠定了其在文学史上的重要地位。书中寄托着作者关于“美”与“爱”的美学理想，是最能表现人性美的一部作品。');
INSERT INTO `book` VALUES ('7', '圣女的救济', '35', '2', '7.png', '南海出版社', '100', '2017-01-18', '《圣女的救济》是日本作家东野圭吾的经典长篇小说，比《嫌疑人X的献身》更出人意料、更难破解，上市1周即登顶纪伊国屋书店、三省堂书店、ORICON公信榜这日本三大图书榜。东野圭吾说：“在写《嫌疑人X的献身》的时候，我就开始构思《圣女的救济》了。?《嫌疑人X的献身》里，我让数学家石神登场，与物理学家汤川展开逻辑对逻辑的较量。汤川极不擅长不合逻辑的推理，我就让他在《圣女的救济》中遇到完全不按逻辑出牌的对手，一个与石神类型迥异的劲敌。”');
INSERT INTO `book` VALUES ('8', '围城', '22', '2', '8.png', '人民文学出版社', '112', '2017-03-14', ' 钱锺书所著的《围城》是一幅栩栩如生的世井百态图，人生的酸甜苦辣千般滋味均在其中得到了淋漓尽致的体现。钱钟书先生将自己的语言天才并入极其渊博的知识，再添加上一些讽刺主义的幽默调料，以一书而定江山。《围城》显示给我们一个真正的聪明人是怎样看人生，又怎样用所有作家都必得使用的文字来表述自己的“观”和“感”的。');
INSERT INTO `book` VALUES ('9', '猫城记', '24', '2', '9.png', '天津人民出版社', '123', '2017-02-14', '飞机坠毁在火星，“我”误入火星上*古的国“猫城”，结识了形形色色的猫人：身兼大地主、政客、诗人、军官的大蝎，世事洞明而敷衍的小蝎，只抢迷叶与妇女的猫兵，守着八个小妾的公使太太，杀人不犯法的外国人，打老师的学生，卖文物的学者，起哄为业的党棍，抢着投降的军阀……一声炮响，繁华落尽。');
INSERT INTO `book` VALUES ('10', '少帅', '28', '2', '10.png', '北京四月文艺出版社', '74', '2017-03-06', '《少帅》是张爱玲以1925年至1930年军阀混战时期的北京为背景，以传奇人物张学良和赵四小姐为原型写的一部爱情小说。故事起意于1956年，当时张爱玲刚移居美国，希望借英文写作打进美国市场。极为重视历史细节的张爱玲为此多方搜集资料，1961年10月远赴台湾搜集写作材料，1962年3月回美后又在美国国会图书馆查阅大量参考资料。有了多年的酝酿储备，她很快动笔写作，在给朋友的信中说，“三年来我的一切行动都以这小说为中心”，可见重视之甚。 ');
INSERT INTO `book` VALUES ('11', '明朝那些事儿', '138', '3', '11.png', '北京联合出版公司', '45', '2017-03-20', '《明朝那些事儿》主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。');
INSERT INTO `book` VALUES ('12', '哲学的故事', '29', '3', '12.png', '新星出版社', '45', '2017-02-28', '本书是美国哲学家威尔·杜兰特的经典力作。自问世以来，经久畅销不衰。《哲学的故事》用讲故事的方法，介绍了有史以来的主要哲学家的生平及其观点，从苏格拉底、柏拉图、亚里士多德到叔本华、尼采再到柏格森，罗素、杜威等。在阐述每位哲学家思想的同时，生动地介绍了他们生活的时代背景、生活境遇和情感经历。\r\n　　威尔·杜兰特以其一贯的渊博学识、深入浅出的行文，成功地将看似艰深的哲学写得极富人情。因为，思想的发展也是一部激动人心的浪漫传奇。\"');
INSERT INTO `book` VALUES ('13', '资本论', '103', '3', '13.png', '人民出版社', '45', '2017-03-06', '马克思《资本论》是一本具有伟大历史意义的著作。既是马克思主义经济学的重要著作，也是马克思主义哲学的重要著作。其内容博大精深，其对资本主义经济学的精妙阐述对后世产生了重大的影响。能够分析指出其中的不合理处不容易。');
INSERT INTO `book` VALUES ('14', '梦的解析', '25', '3', '14.png', '国际文化出版公司', '78', '2017-03-22', '《梦的解析》是弗洛伊德的成名代表作，被认为是本世纪最富创见的、最伟大的著作之一，是了解精神分析学说和潜意识理论的必读书，读者可以从中发现很多令人兴奋的观察和大量与我们主题有关的饶有兴趣的材料。《梦的解析》已被视为精神分析学说的重要组成部分和三大理论支柱之一。美国前全国图书馆协会主席唐斯博士将这本书列入“改变世界历史面貌”的十六部巨著之一。');

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `catalogid` int(11) NOT NULL AUTO_INCREMENT,
  `catalogname` varchar(20) NOT NULL,
  PRIMARY KEY (`catalogid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', '计算机');
INSERT INTO `catalog` VALUES ('2', '小说');
INSERT INTO `catalog` VALUES ('3', '人文社会');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `orderid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `orderid` (`orderid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '1', '1');
INSERT INTO `orderitem` VALUES ('2', '1', '2', '1');
INSERT INTO `orderitem` VALUES ('3', '1', '3', '1');
INSERT INTO `orderitem` VALUES ('4', '1', '4', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2017-03-26 11:34:41', '1', '文华学院');
INSERT INTO `orders` VALUES ('2', '2017-03-26 11:38:26', '1', '文华学院');
INSERT INTO `orders` VALUES ('3', '2017-03-26 11:40:47', '1', '文华学院');
INSERT INTO `orders` VALUES ('4', '2017-03-26 14:27:39', '1', '文华学院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zxzxzx', '123456', '文华学院', '123@123.com');
INSERT INTO `user` VALUES ('2', '123123', '123123', null, null);
INSERT INTO `user` VALUES ('3', 'aaaaaaaa', '123123', null, null);
