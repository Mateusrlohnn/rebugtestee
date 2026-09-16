/*M!999999\- enable the sandbox mode */ 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) NOT NULL DEFAULT 'ACH_',
  `category` enum('identity','explore','music','social','games','room_builder','tools','commercial','survival_mode','pets') NOT NULL DEFAULT 'identity',
  `level` int(11) NOT NULL DEFAULT 1,
  `reward_activity_points` int(11) NOT NULL DEFAULT 0,
  `reward_achievement_points` int(11) DEFAULT 10,
  `reward_type` int(11) DEFAULT 0,
  `progress_requirement` int(11) NOT NULL DEFAULT 1,
  `enabled` enum('1','0') NOT NULL DEFAULT '1',
  `game_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1580 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES
(1,'ACH_AvatarLooks','identity',1,50,50,0,1,'1',0),
(2,'ACH_Motto','identity',1,50,50,0,1,'1',0),
(3,'ACH_RespectGiven','social',1,5,10,0,1,'1',0),
(4,'ACH_RespectEarned','social',1,5,10,0,1,'1',0),
(5,'ACH_RespectEarned','social',2,10,10,0,5,'1',0),
(6,'ACH_RespectEarned','social',3,25,10,0,10,'1',0),
(7,'ACH_RespectEarned','social',4,50,10,0,20,'1',0),
(8,'ACH_RespectEarned','social',5,75,10,0,30,'1',0),
(9,'ACH_RespectEarned','social',6,100,25,0,50,'1',0),
(10,'ACH_RespectEarned','social',7,200,25,0,60,'1',0),
(11,'ACH_RespectEarned','social',8,300,25,0,70,'1',0),
(12,'ACH_RespectEarned','social',9,400,25,0,80,'1',0),
(13,'ACH_RespectEarned','social',10,500,50,0,100,'1',0),
(14,'ACH_RoomEntry','explore',1,5,10,0,5,'1',0),
(15,'ACH_RoomEntry','explore',2,10,10,0,10,'1',0),
(16,'ACH_RoomEntry','explore',3,25,10,0,20,'1',0),
(17,'ACH_RoomEntry','explore',4,50,10,0,30,'1',0),
(18,'ACH_RoomEntry','explore',5,75,10,0,40,'1',0),
(19,'ACH_PetLover','social',1,5,10,0,1,'1',0),
(20,'ACH_PetLover','social',2,10,10,0,5,'1',0),
(21,'ACH_PetLover','social',3,25,10,0,10,'1',0),
(22,'ACH_PetLover','social',4,50,10,0,25,'1',0),
(23,'ACH_PetLover','social',5,75,10,0,50,'1',0),
(24,'ACH_PetRespectGiver','social',1,5,10,0,1,'1',0),
(25,'ACH_PetLevelUp','social',1,0,10,0,1,'1',0),
(26,'ACH_PetRespectGiver','social',2,10,10,0,10,'1',0),
(27,'ACH_PetRespectGiver','social',3,25,10,0,50,'1',0),
(28,'ACH_PetRespectGiver','social',4,50,10,0,100,'1',0),
(29,'ACH_PetRespectGiver','social',5,75,10,0,150,'1',0),
(30,'ACH_PetRespectGiver','social',6,100,25,0,200,'1',0),
(31,'ACH_PetRespectGiver','social',7,200,25,0,250,'1',0),
(32,'ACH_PetRespectGiver','social',8,300,25,0,300,'1',0),
(33,'ACH_PetRespectGiver','social',9,400,25,0,350,'1',0),
(34,'ACH_PetRespectGiver','social',10,500,50,0,500,'1',0),
(35,'ACH_FriendListSize','social',1,5,10,0,1,'1',0),
(36,'ACH_FriendListSize','social',2,10,10,0,10,'1',0),
(37,'ACH_FriendListSize','social',3,25,10,0,25,'1',0),
(38,'ACH_FriendListSize','social',4,50,10,0,50,'1',0),
(39,'ACH_FriendListSize','social',5,75,10,0,100,'1',0),
(40,'ACH_FriendListSize','social',6,100,10,0,200,'1',0),
(41,'ACH_FriendListSize','social',7,200,10,0,300,'1',0),
(42,'ACH_FriendListSize','social',8,300,10,0,400,'1',0),
(43,'ACH_FriendListSize','social',9,400,10,0,500,'1',0),
(44,'ACH_FriendListSize','social',10,500,25,0,600,'1',0),
(45,'ACH_FriendListSize','social',11,600,25,0,700,'1',0),
(46,'ACH_FriendListSize','social',12,700,25,0,800,'1',0),
(47,'ACH_FriendListSize','social',13,800,25,0,900,'1',0),
(48,'ACH_FriendListSize','social',14,900,25,0,1000,'1',0),
(49,'ACH_FriendListSize','social',15,1000,50,0,1500,'1',0),
(50,'ACH_RoomEntry','explore',6,100,10,0,50,'1',0),
(51,'ACH_RoomEntry','explore',7,200,10,0,200,'1',0),
(52,'ACH_RoomEntry','explore',8,300,10,0,300,'1',0),
(53,'ACH_RoomEntry','explore',9,400,10,0,400,'1',0),
(54,'ACH_RoomEntry','explore',10,500,25,0,500,'1',0),
(55,'ACH_RoomEntry','explore',11,550,25,0,750,'1',0),
(56,'ACH_RoomEntry','explore',12,600,25,0,1000,'1',0),
(57,'ACH_RoomEntry','explore',13,650,25,0,1500,'1',0),
(58,'ACH_RoomEntry','explore',14,700,25,0,2000,'1',0),
(59,'ACH_RoomEntry','explore',15,750,25,0,2500,'1',0),
(60,'ACH_RoomEntry','explore',16,800,50,0,3000,'1',0),
(61,'ACH_RoomEntry','explore',17,850,50,0,4500,'1',0),
(62,'ACH_RoomEntry','explore',18,900,50,0,5000,'1',0),
(63,'ACH_RoomEntry','explore',19,950,50,0,7500,'1',0),
(64,'ACH_RoomEntry','explore',20,1000,100,0,10000,'1',0),
(65,'ACH_RespectGiven','social',2,10,10,0,10,'1',0),
(66,'ACH_RespectGiven','social',3,25,10,0,20,'1',0),
(67,'ACH_RespectGiven','social',4,50,10,0,30,'1',0),
(68,'ACH_RespectGiven','social',5,75,10,0,40,'1',0),
(69,'ACH_RespectGiven','social',6,100,10,0,50,'1',0),
(70,'ACH_RespectGiven','social',7,200,10,0,60,'1',0),
(71,'ACH_RespectGiven','social',8,300,10,0,70,'1',0),
(72,'ACH_RespectGiven','social',9,400,10,0,80,'1',0),
(73,'ACH_RespectGiven','social',10,500,25,0,90,'1',0),
(74,'ACH_RespectGiven','social',11,550,25,0,100,'1',0),
(75,'ACH_RespectGiven','social',12,600,25,0,120,'1',0),
(76,'ACH_RespectGiven','social',13,650,25,0,140,'1',0),
(77,'ACH_RespectGiven','social',14,700,25,0,160,'1',0),
(78,'ACH_RespectGiven','social',15,750,25,0,180,'1',0),
(79,'ACH_RespectGiven','social',16,800,50,0,200,'1',0),
(80,'ACH_RespectGiven','social',17,850,50,0,250,'1',0),
(81,'ACH_RespectGiven','social',18,900,50,0,300,'1',0),
(82,'ACH_RespectGiven','social',19,950,50,0,350,'1',0),
(83,'ACH_RespectGiven','social',20,1000,100,0,500,'1',0),
(84,'ACH_SelfModRoomFilterSeen','tools',1,10,10,0,1,'1',0),
(85,'ACH_SelfModDoorModeSeen','tools',1,10,10,0,1,'1',0),
(86,'ACH_SelfModWalkthroughSeen','tools',1,10,10,0,1,'1',0),
(87,'ACH_SelfModChatScrollSpeedSeen','tools',1,10,10,0,1,'1',0),
(88,'ACH_SelfModChatFloodFilterSeen','tools',1,10,10,0,1,'1',0),
(89,'ACH_SelfModChatHearRangeSeen','tools',1,10,10,0,1,'1',0),
(90,'ACH_SelfModIgnoreSeen','tools',1,10,10,0,1,'1',0),
(91,'ACH_SelfModMuteSeen','tools',1,10,10,0,1,'1',0),
(92,'ACH_SelfModKickSeen','tools',1,10,10,0,1,'1',0),
(93,'ACH_SelfModBanSeen','tools',1,10,10,0,1,'1',0),
(94,'ACH_Name','identity',1,10,10,0,1,'1',0),
(95,'ACH_BattleBallTilesLocked','games',1,5,10,0,25,'1',0),
(96,'ACH_BattleBallTilesLocked','games',2,10,10,0,65,'1',0),
(97,'ACH_BattleBallTilesLocked','games',3,25,10,0,125,'1',0),
(98,'ACH_BattleBallTilesLocked','games',4,50,10,0,205,'1',0),
(99,'ACH_BattleBallTilesLocked','games',5,75,10,0,335,'1',0),
(100,'ACH_BattleBallTilesLocked','games',6,100,10,0,525,'1',0),
(101,'ACH_BattleBallTilesLocked','games',7,200,10,0,805,'1',0),
(102,'ACH_BattleBallTilesLocked','games',8,300,10,0,1235,'1',0),
(103,'ACH_BattleBallTilesLocked','games',9,400,10,0,1875,'1',0),
(104,'ACH_BattleBallTilesLocked','games',10,500,25,0,2875,'1',0),
(105,'ACH_BattleBallTilesLocked','games',11,550,25,0,4375,'1',0),
(106,'ACH_BattleBallTilesLocked','games',12,600,25,0,6875,'1',0),
(107,'ACH_BattleBallTilesLocked','games',13,650,25,0,10775,'1',0),
(108,'ACH_BattleBallTilesLocked','games',14,700,25,0,17075,'1',0),
(109,'ACH_BattleBallTilesLocked','games',15,750,25,0,27175,'1',0),
(110,'ACH_BattleBallTilesLocked','games',16,800,50,0,43275,'1',0),
(111,'ACH_BattleBallTilesLocked','games',17,850,50,0,69075,'1',0),
(112,'ACH_BattleBallTilesLocked','games',18,900,50,0,110375,'1',0),
(113,'ACH_BattleBallTilesLocked','games',19,950,50,0,176375,'1',0),
(114,'ACH_BattleBallTilesLocked','games',20,1000,100,0,282075,'1',0),
(115,'ACH_BattleBallPlayer','games',1,5,10,0,1,'1',0),
(116,'ACH_BattleBallPlayer','games',2,10,10,0,5,'1',0),
(117,'ACH_BattleBallPlayer','games',3,25,10,0,10,'1',0),
(118,'ACH_BattleBallPlayer','games',4,50,10,0,25,'1',0),
(119,'ACH_BattleBallPlayer','games',5,75,10,0,50,'1',0),
(120,'ACH_BattleBallPlayer','games',6,100,10,0,100,'1',0),
(121,'ACH_BattleBallPlayer','games',7,200,10,0,150,'1',0),
(122,'ACH_BattleBallPlayer','games',8,300,10,0,200,'1',0),
(123,'ACH_BattleBallPlayer','games',9,400,10,0,250,'1',0),
(124,'ACH_BattleBallPlayer','games',10,500,10,0,300,'1',0),
(125,'ACH_BattleBallPlayer','games',11,550,25,0,350,'1',0),
(126,'ACH_BattleBallPlayer','games',12,600,25,0,400,'1',0),
(127,'ACH_BattleBallPlayer','games',13,650,25,0,450,'1',0),
(128,'ACH_BattleBallPlayer','games',14,700,25,0,500,'1',0),
(129,'ACH_BattleBallPlayer','games',15,750,25,0,600,'1',0),
(130,'ACH_BattleBallPlayer','games',16,800,50,0,700,'1',0),
(131,'ACH_BattleBallPlayer','games',17,850,50,0,800,'1',0),
(132,'ACH_BattleBallPlayer','games',18,900,50,0,900,'1',0),
(133,'ACH_BattleBallPlayer','games',19,950,50,0,1000,'1',0),
(134,'ACH_BattleBallPlayer','games',20,1000,100,0,1500,'1',0),
(135,'ACH_BattleBallWinner','games',1,5,10,0,1,'1',0),
(136,'ACH_BattleBallWinner','games',2,10,10,0,10,'1',0),
(137,'ACH_BattleBallWinner','games',3,25,10,0,25,'1',0),
(138,'ACH_BattleBallWinner','games',4,50,10,0,50,'1',0),
(139,'ACH_BattleBallWinner','games',5,75,10,0,100,'1',0),
(140,'ACH_BattleBallWinner','games',6,100,10,0,150,'1',0),
(141,'ACH_BattleBallWinner','games',7,200,10,0,200,'1',0),
(142,'ACH_BattleBallWinner','games',8,300,10,0,250,'1',0),
(143,'ACH_BattleBallWinner','games',9,400,10,0,300,'1',0),
(144,'ACH_BattleBallWinner','games',10,500,25,0,350,'1',0),
(145,'ACH_BattleBallWinner','games',11,550,25,0,400,'1',0),
(146,'ACH_BattleBallWinner','games',12,600,25,0,500,'1',0),
(147,'ACH_BattleBallWinner','games',13,650,25,0,600,'1',0),
(148,'ACH_BattleBallWinner','games',14,700,25,0,700,'1',0),
(149,'ACH_BattleBallWinner','games',15,750,25,0,800,'1',0),
(150,'ACH_BattleBallWinner','games',16,800,50,0,900,'1',0),
(151,'ACH_BattleBallWinner','games',17,850,50,0,1000,'1',0),
(152,'ACH_BattleBallWinner','games',18,900,50,0,1500,'1',0),
(153,'ACH_BattleBallWinner','games',19,950,50,0,2000,'1',0),
(154,'ACH_BattleBallWinner','games',20,1000,100,0,2500,'1',0),
(155,'ACH_FootballGoalScored','games',1,5,10,0,1,'1',0),
(156,'ACH_FootballGoalScored','games',2,10,10,0,10,'1',0),
(157,'ACH_FootballGoalScored','games',3,25,10,0,100,'1',0),
(158,'ACH_FootballGoalScored','games',4,50,25,0,1000,'1',0),
(159,'ACH_FootballGoalScored','games',5,100,50,0,10000,'1',0),
(160,'ACH_GiftGiver','social',1,5,10,0,1,'1',0),
(161,'ACH_GiftGiver','social',2,10,10,0,10,'1',0),
(162,'ACH_GiftGiver','social',3,25,10,0,25,'1',0),
(163,'ACH_GiftGiver','social',4,50,10,0,50,'1',0),
(164,'ACH_GiftGiver','social',5,75,10,0,100,'1',0),
(165,'ACH_GiftGiver','social',6,100,10,0,150,'1',0),
(166,'ACH_GiftGiver','social',7,200,10,0,200,'1',0),
(167,'ACH_GiftGiver','social',8,300,10,0,250,'1',0),
(168,'ACH_GiftGiver','social',9,400,10,0,300,'1',0),
(169,'ACH_GiftGiver','social',10,500,25,0,350,'1',0),
(170,'ACH_GiftReceiver','social',1,5,10,0,1,'1',0),
(171,'ACH_GiftReceiver','social',2,10,10,0,10,'1',0),
(172,'ACH_GiftReceiver','social',3,25,10,0,25,'1',0),
(173,'ACH_GiftReceiver','social',4,50,10,0,50,'1',0),
(174,'ACH_GiftReceiver','social',5,75,10,0,100,'1',0),
(175,'ACH_GiftReceiver','social',6,100,25,0,150,'1',0),
(176,'ACH_GiftReceiver','social',7,200,25,0,200,'1',0),
(177,'ACH_GiftReceiver','social',8,300,25,0,300,'1',0),
(178,'ACH_GiftReceiver','social',9,400,25,0,500,'1',0),
(179,'ACH_GiftReceiver','social',10,500,50,0,1000,'1',0),
(180,'ACH_GiftGiver','social',11,600,25,0,400,'1',0),
(181,'ACH_GiftGiver','social',12,700,25,0,500,'1',0),
(182,'ACH_GiftGiver','social',13,800,25,0,600,'1',0),
(183,'ACH_GiftGiver','social',14,900,25,0,800,'1',0),
(184,'ACH_GiftGiver','social',15,1000,75,0,1000,'1',0),
(185,'ACH_BaseJumpDaysPlayed','games',1,0,10,0,1,'1',1),
(186,'ACH_BaseJumpDaysPlayed','games',2,0,10,0,2,'1',1),
(187,'ACH_BaseJumpDaysPlayed','games',3,0,10,0,3,'1',1),
(188,'ACH_BaseJumpDaysPlayed','games',4,0,10,0,4,'1',1),
(189,'ACH_BaseJumpDaysPlayed','games',5,0,10,0,5,'1',1),
(190,'ACH_BaseJumpDaysPlayed','games',6,0,10,0,6,'1',1),
(191,'ACH_BaseJumpDaysPlayed','games',7,0,10,0,7,'1',1),
(192,'ACH_BaseJumpDaysPlayed','games',8,0,10,0,8,'1',1),
(193,'ACH_BaseJumpDaysPlayed','games',9,0,10,0,9,'1',1),
(194,'ACH_BaseJumpDaysPlayed','games',10,0,10,0,10,'1',1),
(195,'ACH_BaseJumpDaysPlayed','games',11,0,10,0,11,'1',1),
(196,'ACH_BaseJumpDaysPlayed','games',12,0,10,0,12,'1',1),
(197,'ACH_BaseJumpDaysPlayed','games',13,0,10,0,13,'1',1),
(198,'ACH_BaseJumpDaysPlayed','games',14,0,10,0,14,'1',1),
(199,'ACH_BaseJumpDaysPlayed','games',15,0,10,0,15,'1',1),
(200,'ACH_BaseJumpDaysPlayed','games',16,0,10,0,16,'1',1),
(201,'ACH_BaseJumpDaysPlayed','games',17,0,10,0,17,'1',1),
(202,'ACH_BaseJumpDaysPlayed','games',18,0,10,0,18,'1',1),
(203,'ACH_BaseJumpDaysPlayed','games',19,0,15,0,19,'1',1),
(204,'ACH_BaseJumpDaysPlayed','games',20,0,20,0,20,'1',1),
(205,'ACH_BaseJumpBigParachute','games',1,0,10,0,1,'1',1),
(206,'ACH_BaseJumpBigParachute','games',2,0,10,0,5,'1',1),
(207,'ACH_BaseJumpBigParachute','games',3,0,10,0,20,'1',1),
(208,'ACH_BaseJumpBigParachute','games',4,0,10,0,50,'1',1),
(209,'ACH_BaseJumpBigParachute','games',5,0,10,0,100,'1',1),
(210,'ACH_BaseJumpBigParachute','games',6,0,10,0,200,'1',1),
(211,'ACH_BaseJumpBigParachute','games',7,0,10,0,300,'1',1),
(212,'ACH_BaseJumpBigParachute','games',8,0,10,0,400,'1',1),
(213,'ACH_BaseJumpBigParachute','games',9,0,10,0,500,'1',1),
(214,'ACH_BaseJumpBigParachute','games',10,0,10,0,600,'1',1),
(215,'ACH_BaseJumpBigParachute','games',11,0,10,0,700,'1',1),
(216,'ACH_BaseJumpBigParachute','games',12,0,10,0,800,'1',1),
(217,'ACH_BaseJumpBigParachute','games',13,0,10,0,900,'1',1),
(218,'ACH_BaseJumpBigParachute','games',14,0,10,0,1000,'1',1),
(219,'ACH_BaseJumpBigParachute','games',15,0,10,0,1100,'1',1),
(220,'ACH_BaseJumpBigParachute','games',16,0,10,0,1200,'1',1),
(221,'ACH_BaseJumpBigParachute','games',17,0,10,0,1300,'1',1),
(222,'ACH_BaseJumpBigParachute','games',18,0,10,0,1400,'1',1),
(223,'ACH_BaseJumpBigParachute','games',19,0,15,0,1500,'1',1),
(224,'ACH_BaseJumpBigParachute','games',20,0,20,0,2000,'1',1),
(225,'ACH_BaseJumpShield','games',1,0,10,0,1,'1',1),
(226,'ACH_BaseJumpShield','games',2,0,10,0,5,'1',1),
(227,'ACH_BaseJumpShield','games',3,0,10,0,20,'1',1),
(228,'ACH_BaseJumpShield','games',4,0,10,0,50,'1',1),
(229,'ACH_BaseJumpShield','games',5,0,10,0,100,'1',1),
(230,'ACH_BaseJumpShield','games',6,0,10,0,200,'1',1),
(231,'ACH_BaseJumpShield','games',7,0,10,0,300,'1',1),
(232,'ACH_BaseJumpShield','games',8,0,10,0,400,'1',1),
(233,'ACH_BaseJumpShield','games',9,0,10,0,500,'1',1),
(234,'ACH_BaseJumpShield','games',10,0,10,0,600,'1',1),
(235,'ACH_BaseJumpShield','games',11,0,10,0,700,'1',1),
(236,'ACH_BaseJumpShield','games',12,0,10,0,800,'1',1),
(237,'ACH_BaseJumpShield','games',13,0,10,0,900,'1',1),
(238,'ACH_BaseJumpShield','games',14,0,10,0,1000,'1',1),
(239,'ACH_BaseJumpShield','games',15,0,10,0,1100,'1',1),
(240,'ACH_BaseJumpShield','games',16,0,10,0,1200,'1',1),
(241,'ACH_BaseJumpShield','games',17,0,10,0,1300,'1',1),
(242,'ACH_BaseJumpShield','games',18,0,10,0,1400,'1',1),
(243,'ACH_BaseJumpShield','games',19,0,15,0,1500,'1',1),
(244,'ACH_BaseJumpShield','games',20,0,20,0,2000,'1',1),
(245,'ACH_BaseJumpWins','games',1,0,10,0,1,'1',1),
(246,'ACH_BaseJumpWins','games',2,0,10,0,5,'1',1),
(247,'ACH_BaseJumpWins','games',3,0,10,0,20,'1',1),
(248,'ACH_BaseJumpWins','games',4,0,10,0,50,'1',1),
(249,'ACH_BaseJumpWins','games',5,0,10,0,100,'1',1),
(250,'ACH_BaseJumpWins','games',6,0,10,0,200,'1',1),
(251,'ACH_BaseJumpWins','games',7,0,10,0,300,'1',1),
(252,'ACH_BaseJumpWins','games',8,0,10,0,400,'1',1),
(253,'ACH_BaseJumpWins','games',9,0,10,0,500,'1',1),
(254,'ACH_BaseJumpWins','games',10,0,10,0,600,'1',1),
(255,'ACH_BaseJumpWins','games',11,0,10,0,700,'1',1),
(256,'ACH_BaseJumpWins','games',12,0,10,0,800,'1',1),
(257,'ACH_BaseJumpWins','games',13,0,10,0,900,'1',1),
(258,'ACH_BaseJumpWins','games',14,0,10,0,1000,'1',1),
(259,'ACH_BaseJumpWins','games',15,0,10,0,1100,'1',1),
(260,'ACH_BaseJumpWins','games',16,0,10,0,1200,'1',1),
(261,'ACH_BaseJumpWins','games',17,0,10,0,1300,'1',1),
(262,'ACH_BaseJumpWins','games',18,0,10,0,1400,'1',1),
(263,'ACH_BaseJumpWins','games',19,0,15,0,1500,'1',1),
(264,'ACH_BaseJumpWins','games',20,0,20,0,2000,'1',1),
(265,'ACH_BaseJumpMissile','games',1,0,10,0,1,'1',1),
(266,'ACH_BaseJumpMissile','games',2,0,10,0,5,'1',1),
(267,'ACH_BaseJumpMissile','games',3,0,10,0,20,'1',1),
(268,'ACH_BaseJumpMissile','games',4,0,10,0,50,'1',1),
(269,'ACH_BaseJumpMissile','games',5,0,10,0,100,'1',1),
(270,'ACH_BaseJumpMissile','games',6,0,10,0,200,'1',1),
(271,'ACH_BaseJumpMissile','games',7,0,10,0,300,'1',1),
(272,'ACH_BaseJumpMissile','games',8,0,10,0,400,'1',1),
(273,'ACH_BaseJumpMissile','games',9,0,10,0,500,'1',1),
(274,'ACH_BaseJumpMissile','games',10,0,10,0,600,'1',1),
(275,'ACH_BaseJumpMissile','games',11,0,10,0,700,'1',1),
(276,'ACH_BaseJumpMissile','games',12,0,10,0,800,'1',1),
(277,'ACH_BaseJumpMissile','games',13,0,10,0,900,'1',1),
(278,'ACH_BaseJumpMissile','games',14,0,10,0,1000,'1',1),
(279,'ACH_BaseJumpMissile','games',15,0,10,0,1100,'1',1),
(280,'ACH_BaseJumpMissile','games',16,0,10,0,1200,'1',1),
(281,'ACH_BaseJumpMissile','games',17,0,10,0,1300,'1',1),
(282,'ACH_BaseJumpMissile','games',18,0,10,0,1400,'1',1),
(283,'ACH_BaseJumpMissile','games',19,0,15,0,1500,'1',1),
(284,'ACH_BaseJumpMissile','games',20,0,20,0,2000,'1',1),
(285,'ACH_AllTimeHotelPresence','identity',1,5,10,0,60,'1',0),
(286,'ACH_AllTimeHotelPresence','identity',2,10,15,0,180,'1',0),
(287,'ACH_AllTimeHotelPresence','identity',3,25,20,0,360,'1',0),
(288,'ACH_AllTimeHotelPresence','identity',4,50,30,0,540,'1',0),
(289,'ACH_AllTimeHotelPresence','identity',5,75,40,0,1080,'1',0),
(290,'ACH_AllTimeHotelPresence','identity',6,100,50,0,1620,'1',0),
(291,'ACH_AllTimeHotelPresence','identity',7,150,60,0,2160,'1',0),
(292,'ACH_AllTimeHotelPresence','identity',8,200,70,0,2700,'1',0),
(293,'ACH_AllTimeHotelPresence','identity',9,250,80,0,3240,'1',0),
(294,'ACH_AllTimeHotelPresence','identity',10,300,90,0,3780,'1',0),
(295,'ACH_AllTimeHotelPresence','identity',11,400,100,0,4320,'1',0),
(296,'ACH_AllTimeHotelPresence','identity',12,500,200,0,4860,'1',0),
(297,'ACH_AllTimeHotelPresence','identity',13,1000,300,0,5400,'1',0),
(298,'ACH_AllTimeHotelPresence','identity',14,2000,400,0,10800,'1',0),
(299,'ACH_AllTimeHotelPresence','identity',15,4000,500,0,21600,'1',0),
(300,'ACH_AllTimeHotelPresence','identity',16,6000,600,0,43200,'1',0),
(301,'ACH_AllTimeHotelPresence','identity',17,8000,800,0,86400,'1',0),
(302,'ACH_AllTimeHotelPresence','identity',18,10000,1000,0,172800,'1',0),
(303,'ACH_AllTimeHotelPresence','identity',19,15000,1500,0,216000,'1',0),
(304,'ACH_AllTimeHotelPresence','identity',20,20000,2000,0,288000,'1',0),
(305,'ACH_RegistrationDuration','identity',1,5,10,0,1,'1',0),
(306,'ACH_RegistrationDuration','identity',2,10,15,0,2,'1',0),
(307,'ACH_RegistrationDuration','identity',3,25,20,0,3,'1',0),
(308,'ACH_RegistrationDuration','identity',4,50,30,0,4,'1',0),
(309,'ACH_RegistrationDuration','identity',5,75,40,0,5,'1',0),
(310,'ACH_RegistrationDuration','identity',6,100,50,0,6,'1',0),
(311,'ACH_RegistrationDuration','identity',7,150,60,0,7,'1',0),
(312,'ACH_RegistrationDuration','identity',8,200,70,0,8,'1',0),
(313,'ACH_RegistrationDuration','identity',9,250,80,0,10,'1',0),
(314,'ACH_RegistrationDuration','identity',10,300,90,0,15,'1',0),
(315,'ACH_RegistrationDuration','identity',11,400,100,0,20,'1',0),
(316,'ACH_RegistrationDuration','identity',12,500,200,0,25,'1',0),
(317,'ACH_RegistrationDuration','identity',13,1000,300,0,30,'1',0),
(318,'ACH_RegistrationDuration','identity',14,2000,400,0,45,'1',0),
(319,'ACH_RegistrationDuration','identity',15,4000,500,0,60,'1',0),
(320,'ACH_RegistrationDuration','identity',16,6000,600,0,75,'1',0),
(321,'ACH_RegistrationDuration','identity',17,8000,800,0,100,'1',0),
(322,'ACH_RegistrationDuration','identity',18,10000,1000,0,150,'1',0),
(323,'ACH_RegistrationDuration','identity',19,15000,1500,0,200,'1',0),
(324,'ACH_RegistrationDuration','identity',20,20000,2000,0,250,'1',0),
(325,'ACH_Login','identity',1,5,10,0,1,'0',0),
(326,'ACH_Login','identity',2,10,15,0,2,'0',0),
(327,'ACH_Login','identity',3,25,20,0,3,'0',0),
(328,'ACH_Login','identity',4,50,30,0,4,'0',0),
(329,'ACH_Login','identity',5,75,40,0,5,'0',0),
(330,'ACH_Login','identity',6,100,50,0,6,'0',0),
(331,'ACH_Login','identity',7,150,60,0,7,'0',0),
(332,'ACH_Login','identity',8,200,70,0,8,'0',0),
(333,'ACH_Login','identity',9,250,80,0,10,'0',0),
(334,'ACH_Login','identity',10,300,90,0,15,'0',0),
(335,'ACH_Login','identity',11,400,100,0,20,'0',0),
(336,'ACH_Login','identity',12,500,200,0,25,'0',0),
(337,'ACH_Login','identity',13,1000,300,0,30,'0',0),
(338,'ACH_Login','identity',14,1500,400,0,45,'0',0),
(339,'ACH_Login','identity',15,2000,500,0,60,'0',0),
(340,'ACH_Login','identity',16,3000,600,0,75,'0',0),
(341,'ACH_Login','identity',17,4000,800,0,100,'0',0),
(342,'ACH_Login','identity',18,5000,1000,0,120,'0',0),
(343,'ACH_Login','identity',19,10000,1500,0,150,'0',0),
(344,'ACH_Login','identity',20,15000,2000,0,200,'0',0),
(345,'ACH_RoomDecoFloor','room_builder',1,5,10,0,3,'1',0),
(346,'ACH_RoomDecoFloor','room_builder',2,10,10,0,5,'1',0),
(347,'ACH_RoomDecoFloor','room_builder',3,25,10,0,7,'1',0),
(348,'ACH_RoomDecoFloor','room_builder',4,50,10,0,12,'1',0),
(349,'ACH_RoomDecoFloor','room_builder',5,75,10,0,17,'1',0),
(350,'ACH_RoomDecoFloor','room_builder',6,100,10,0,22,'1',0),
(351,'ACH_RoomDecoFloor','room_builder',7,150,10,0,27,'1',0),
(352,'ACH_RoomDecoFloor','room_builder',8,200,10,0,32,'1',0),
(353,'ACH_RoomDecoFloor','room_builder',9,250,10,0,37,'1',0),
(354,'ACH_RoomDecoFloor','room_builder',10,300,25,0,47,'1',0),
(355,'ACH_RoomDecoFloor','room_builder',11,350,25,0,57,'1',0),
(356,'ACH_RoomDecoFloor','room_builder',12,400,25,0,67,'1',0),
(357,'ACH_RoomDecoFloor','room_builder',13,500,25,0,77,'1',0),
(358,'ACH_RoomDecoFloor','room_builder',14,600,25,0,97,'1',0),
(359,'ACH_RoomDecoFloor','room_builder',15,700,25,0,117,'1',0),
(360,'ACH_RoomDecoFloor','room_builder',16,800,50,0,137,'1',0),
(361,'ACH_RoomDecoFloor','room_builder',17,900,50,0,167,'1',0),
(362,'ACH_RoomDecoFloor','room_builder',18,1000,50,0,197,'1',0),
(363,'ACH_RoomDecoFloor','room_builder',19,1500,50,0,237,'1',0),
(364,'ACH_RoomDecoFloor','room_builder',20,2000,100,0,287,'1',0),
(365,'ACH_RoomDecoWallpaper','room_builder',1,5,10,0,3,'1',0),
(366,'ACH_RoomDecoWallpaper','room_builder',2,10,10,0,5,'1',0),
(367,'ACH_RoomDecoWallpaper','room_builder',3,25,10,0,7,'1',0),
(368,'ACH_RoomDecoWallpaper','room_builder',4,50,10,0,12,'1',0),
(369,'ACH_RoomDecoWallpaper','room_builder',5,75,10,0,17,'1',0),
(370,'ACH_RoomDecoWallpaper','room_builder',6,100,10,0,22,'1',0),
(371,'ACH_RoomDecoWallpaper','room_builder',7,150,10,0,27,'1',0),
(372,'ACH_RoomDecoWallpaper','room_builder',8,200,10,0,32,'1',0),
(373,'ACH_RoomDecoWallpaper','room_builder',9,250,10,0,37,'1',0),
(374,'ACH_RoomDecoWallpaper','room_builder',10,300,25,0,47,'1',0),
(375,'ACH_RoomDecoWallpaper','room_builder',11,350,25,0,57,'1',0),
(376,'ACH_RoomDecoWallpaper','room_builder',12,400,25,0,67,'1',0),
(377,'ACH_RoomDecoWallpaper','room_builder',13,500,25,0,77,'1',0),
(378,'ACH_RoomDecoWallpaper','room_builder',14,600,25,0,97,'1',0),
(379,'ACH_RoomDecoWallpaper','room_builder',15,700,25,0,117,'1',0),
(380,'ACH_RoomDecoWallpaper','room_builder',16,800,50,0,137,'1',0),
(381,'ACH_RoomDecoWallpaper','room_builder',17,900,50,0,167,'1',0),
(382,'ACH_RoomDecoWallpaper','room_builder',18,1000,50,0,197,'1',0),
(383,'ACH_RoomDecoWallpaper','room_builder',19,1500,50,0,237,'1',0),
(384,'ACH_RoomDecoWallpaper','room_builder',20,2000,100,0,287,'1',0),
(385,'ACH_RoomDecoLandscape','room_builder',1,5,10,0,3,'1',0),
(386,'ACH_RoomDecoLandscape','room_builder',2,10,10,0,5,'1',0),
(387,'ACH_RoomDecoLandscape','room_builder',3,25,10,0,7,'1',0),
(388,'ACH_RoomDecoLandscape','room_builder',4,50,10,0,12,'1',0),
(389,'ACH_RoomDecoLandscape','room_builder',5,75,10,0,17,'1',0),
(390,'ACH_RoomDecoLandscape','room_builder',6,100,10,0,22,'1',0),
(391,'ACH_RoomDecoLandscape','room_builder',7,150,10,0,27,'1',0),
(392,'ACH_RoomDecoLandscape','room_builder',8,200,10,0,32,'1',0),
(393,'ACH_RoomDecoLandscape','room_builder',9,250,10,0,37,'1',0),
(394,'ACH_RoomDecoLandscape','room_builder',10,300,25,0,47,'1',0),
(395,'ACH_RoomDecoLandscape','room_builder',11,350,25,0,57,'1',0),
(396,'ACH_RoomDecoLandscape','room_builder',12,400,25,0,67,'1',0),
(397,'ACH_RoomDecoLandscape','room_builder',13,500,25,0,77,'1',0),
(398,'ACH_RoomDecoLandscape','room_builder',14,600,25,0,97,'1',0),
(399,'ACH_RoomDecoLandscape','room_builder',15,700,25,0,117,'1',0),
(400,'ACH_RoomDecoLandscape','room_builder',16,800,50,0,137,'1',0),
(401,'ACH_RoomDecoLandscape','room_builder',17,900,50,0,167,'1',0),
(402,'ACH_RoomDecoLandscape','room_builder',18,1000,50,0,197,'1',0),
(403,'ACH_RoomDecoLandscape','room_builder',19,1500,50,0,237,'1',0),
(404,'ACH_RoomDecoLandscape','room_builder',20,2000,100,0,287,'1',0),
(405,'ACH_RoomDecoFurniCount','room_builder',1,5,10,0,5,'1',0),
(406,'ACH_RoomDecoFurniCount','room_builder',2,10,10,0,25,'1',0),
(407,'ACH_RoomDecoFurniCount','room_builder',3,25,10,0,40,'1',0),
(408,'ACH_RoomDecoFurniCount','room_builder',4,50,10,0,60,'1',0),
(409,'ACH_RoomDecoFurniCount','room_builder',5,75,10,0,80,'1',0),
(410,'ACH_RoomDecoFurniCount','room_builder',6,100,10,0,100,'1',0),
(411,'ACH_RoomDecoFurniCount','room_builder',7,150,10,0,200,'1',0),
(412,'ACH_RoomDecoFurniCount','room_builder',8,200,10,0,300,'1',0),
(413,'ACH_RoomDecoFurniCount','room_builder',9,250,10,0,400,'1',0),
(414,'ACH_RoomDecoFurniCount','room_builder',10,300,25,0,500,'1',0),
(415,'ACH_RoomDecoFurniCount','room_builder',11,350,25,0,600,'1',0),
(416,'ACH_RoomDecoFurniCount','room_builder',12,400,25,0,700,'1',0),
(417,'ACH_RoomDecoFurniCount','room_builder',13,500,25,0,800,'1',0),
(418,'ACH_RoomDecoFurniCount','room_builder',14,600,25,0,900,'1',0),
(419,'ACH_RoomDecoFurniCount','room_builder',15,700,25,0,1000,'1',0),
(420,'ACH_RoomDecoFurniCount','room_builder',16,800,50,0,1500,'1',0),
(421,'ACH_RoomDecoFurniCount','room_builder',17,900,50,0,2000,'1',0),
(422,'ACH_RoomDecoFurniCount','room_builder',18,1000,50,0,2500,'1',0),
(423,'ACH_RoomDecoFurniCount','room_builder',19,1500,50,0,3000,'1',0),
(424,'ACH_RoomDecoFurniCount','room_builder',20,2000,100,0,3500,'1',0),
(425,'ACH_SelfModForumCanModerateSeen','tools',1,10,10,0,1,'1',0),
(426,'ACH_SelfModForumCanPostSeen','tools',1,10,10,0,1,'1',0),
(427,'ACH_SelfModForumCanPostThrdSeen','tools',1,10,10,0,1,'1',0),
(428,'ACH_SelfModForumCanReadSeen','tools',1,10,10,0,1,'1',0),
(429,'ACH_CameraPhotoCount','explore',1,5,10,0,1,'1',0),
(430,'ACH_CameraPhotoCount','explore',2,10,10,0,5,'1',0),
(431,'ACH_CameraPhotoCount','explore',3,25,10,0,10,'1',0),
(432,'ACH_CameraPhotoCount','explore',4,50,10,0,25,'1',0),
(433,'ACH_CameraPhotoCount','explore',5,75,10,0,50,'1',0),
(434,'ACH_CameraPhotoCount','explore',6,100,25,0,75,'1',0),
(435,'ACH_CameraPhotoCount','explore',7,150,25,0,150,'1',0),
(436,'ACH_CameraPhotoCount','explore',8,200,25,0,300,'1',0),
(437,'ACH_CameraPhotoCount','explore',9,250,25,0,500,'1',0),
(438,'ACH_CameraPhotoCount','explore',10,500,50,0,1000,'1',0),
(439,'ACH_PinataWhacker','explore',1,0,5,0,1,'1',0),
(440,'ACH_PinataWhacker','explore',2,0,100,0,5,'1',0),
(441,'ACH_PinataWhacker','explore',3,0,50,0,10,'1',0),
(442,'ACH_PinataWhacker','explore',4,0,50,0,25,'1',0),
(443,'ACH_PinataWhacker','explore',5,0,50,0,35,'1',0),
(444,'ACH_PinataWhacker','explore',6,0,50,0,50,'1',0),
(445,'ACH_PinataWhacker','explore',7,0,50,0,60,'1',0),
(446,'ACH_PinataWhacker','explore',8,0,50,0,75,'1',0),
(447,'ACH_PinataWhacker','explore',9,0,50,0,85,'1',0),
(448,'ACH_PinataWhacker','explore',10,0,50,0,100,'1',0),
(459,'ACH_PinataBreaker','explore',1,0,50,0,10,'1',0),
(460,'ACH_PinataBreaker','explore',2,0,50,0,25,'1',0),
(461,'ACH_PinataBreaker','explore',3,0,50,0,10,'1',0),
(462,'ACH_PinataBreaker','explore',4,0,50,0,25,'1',0),
(463,'ACH_PinataBreaker','explore',5,0,50,0,35,'1',0),
(479,'ACH_Citizenship','identity',1,0,150,0,1,'1',0),
(480,'ACH_GuideEnrollmentLifetime','social',1,0,10,0,5,'1',0),
(481,'ACH_GuideEnrollmentLifetime','social',2,0,20,0,10,'1',0),
(482,'ACH_GuideEnrollmentLifetime','social',3,0,30,0,25,'1',0),
(483,'ACH_GuideEnrollmentLifetime','social',4,0,40,0,30,'1',0),
(484,'ACH_GuideEnrollmentLifetime','social',5,0,50,0,50,'1',0),
(485,'ACH_GuideEnrollmentLifetime','social',6,0,60,0,60,'1',0),
(486,'ACH_GuideEnrollmentLifetime','social',7,0,70,0,70,'1',0),
(487,'ACH_GuideEnrollmentLifetime','social',8,0,80,0,80,'1',0),
(488,'ACH_GuideEnrollmentLifetime','social',9,0,90,0,90,'1',0),
(489,'ACH_GuideEnrollmentLifetime','social',10,0,100,0,100,'1',0),
(490,'ACH_GuideEnrollmentLifetime','social',11,0,200,0,110,'1',0),
(491,'ACH_GuideEnrollmentLifetime','social',12,0,300,0,120,'1',0),
(492,'ACH_GuideEnrollmentLifetime','social',13,0,300,0,130,'1',0),
(493,'ACH_GuideEnrollmentLifetime','social',14,0,300,0,140,'1',0),
(494,'ACH_GuideEnrollmentLifetime','social',15,0,300,0,150,'1',0),
(495,'ACH_GuideEnrollmentLifetime','social',16,0,300,0,160,'1',0),
(496,'ACH_GuideEnrollmentLifetime','social',17,0,300,0,170,'1',0),
(497,'ACH_GuideEnrollmentLifetime','social',18,0,300,0,180,'1',0),
(498,'ACH_GuideEnrollmentLifetime','social',19,0,300,0,190,'1',0),
(499,'ACH_GuideEnrollmentLifetime','social',20,0,300,0,200,'1',0),
(500,'ACH_Forum','identity',1,0,150,0,5,'1',0),
(501,'ACH_Forum','identity',2,0,150,0,15,'1',0),
(502,'ACH_Forum','identity',3,0,300,0,25,'1',0),
(503,'ACH_Forum','identity',4,0,300,0,50,'1',0),
(504,'ACH_Forum','identity',5,0,300,0,75,'1',0),
(505,'ACH_Forum','identity',6,0,300,0,100,'1',0),
(506,'ACH_Forum','identity',7,0,300,0,125,'1',0),
(507,'ACH_Forum','identity',8,0,300,0,150,'1',0),
(508,'ACH_Forum','identity',9,0,300,0,175,'1',0),
(509,'ACH_Forum','identity',10,0,300,0,200,'1',0),
(510,'ACH_LTDPurchased','explore',1,5,10,0,5,'1',0),
(511,'ACH_LTDPurchased','explore',2,10,20,0,10,'1',0),
(512,'ACH_LTDPurchased','explore',3,25,30,0,15,'1',0),
(513,'ACH_LTDPurchased','explore',4,50,40,0,20,'1',0),
(514,'ACH_LTDPurchased','explore',5,75,50,0,25,'1',0),
(515,'ACH_LTDPurchased','explore',6,100,60,0,30,'1',0),
(516,'ACH_LTDPurchased','explore',7,150,70,0,35,'1',0),
(517,'ACH_LTDPurchased','explore',8,200,80,0,40,'1',0),
(518,'ACH_LTDPurchased','explore',9,250,90,0,45,'1',0),
(519,'ACH_LTDPurchased','explore',10,300,100,0,50,'1',0),
(520,'ACH_LTDPurchased','explore',11,400,250,0,55,'1',0),
(521,'ACH_LTDPurchased','explore',12,500,500,0,60,'1',0),
(522,'ACH_LTDPurchased','explore',13,1000,1000,0,65,'1',0),
(523,'ACH_LTDPurchased','explore',14,2000,1500,0,70,'1',0),
(524,'ACH_LTDPurchased','explore',15,4000,2000,0,75,'1',0),
(525,'ACH_LTDPurchased','explore',16,6000,2500,0,80,'1',0),
(526,'ACH_LTDPurchased','explore',17,8000,3000,0,85,'1',0),
(527,'ACH_LTDPurchased','explore',18,10000,3500,0,90,'1',0),
(528,'ACH_LTDPurchased','explore',19,15000,4000,0,95,'1',0),
(529,'ACH_LTDPurchased','explore',20,20000,5000,0,100,'1',0),
(530,'ACH_CrystalCracker','explore',1,0,100,0,5,'1',0),
(531,'ACH_CrystalCracker','explore',2,0,100,0,10,'1',0),
(532,'ACH_CrystalCracker','explore',3,0,100,0,10,'1',0),
(533,'ACH_CrystalCracker','explore',4,0,100,0,10,'1',0),
(534,'ACH_CrystalCracker','explore',5,0,100,0,15,'1',0),
(535,'ACH_CrystalCracker','explore',6,0,100,0,15,'1',0),
(536,'ACH_CrystalCracker','explore',7,0,100,0,10,'1',0),
(537,'ACH_CrystalCracker','explore',8,0,100,0,10,'1',0),
(538,'ACH_CrystalCracker','explore',9,0,100,0,15,'1',0),
(539,'ACH_CrystalCracker','explore',10,0,100,0,50,'1',0),
(540,'ACH_Crafting','explore',1,0,100,0,5,'1',0),
(541,'ACH_Crafting','explore',2,0,100,0,10,'1',0),
(542,'ACH_Crafting','explore',3,0,100,0,10,'1',0),
(543,'ACH_Crafting','explore',4,0,100,0,10,'1',0),
(544,'ACH_Crafting','explore',5,0,100,0,15,'1',0),
(545,'ACH_Crafting','explore',6,0,100,0,15,'1',0),
(546,'ACH_Crafting','explore',7,0,100,0,10,'1',0),
(547,'ACH_Crafting','explore',8,0,100,0,10,'1',0),
(548,'ACH_Crafting','explore',9,0,100,0,15,'1',0),
(549,'ACH_Crafting','explore',10,0,100,0,50,'1',0),
(550,'ACH_ViciousViking','explore',1,0,100,0,5,'1',0),
(551,'ACH_ViciousViking','explore',2,0,100,0,10,'1',0),
(552,'ACH_ViciousViking','explore',3,0,100,0,10,'1',0),
(553,'ACH_ViciousViking','explore',4,0,100,0,10,'1',0),
(554,'ACH_ViciousViking','explore',5,0,100,0,15,'1',0),
(555,'ACH_ViciousViking','explore',6,0,100,0,15,'1',0),
(556,'ACH_ViciousViking','explore',7,0,100,0,10,'1',0),
(557,'ACH_ViciousViking','explore',8,0,100,0,10,'1',0),
(558,'ACH_ViciousViking','explore',9,0,100,0,15,'1',0),
(559,'ACH_ViciousViking','explore',10,0,100,0,50,'1',0),
(560,'ACH_EggCracker','explore',1,0,100,0,1,'1',0),
(561,'ACH_EggCracker','explore',2,0,100,0,4,'1',0),
(562,'ACH_EggCracker','explore',3,0,100,0,5,'1',0),
(563,'ACH_EggCracker','explore',4,0,100,0,10,'1',0),
(564,'ACH_EggCracker','explore',5,0,100,0,10,'1',0),
(565,'ACH_EggCracker','explore',6,0,100,0,15,'1',0),
(566,'ACH_EggCracker','explore',7,0,100,0,10,'1',0),
(567,'ACH_EggCracker','explore',8,0,100,0,10,'1',0),
(568,'ACH_EggCracker','explore',9,0,100,0,15,'1',0),
(569,'ACH_EggCracker','explore',10,0,100,0,25,'1',0),
(610,'ACH_FILWinner','games',1,0,100,0,1,'1',0),
(611,'ACH_FILWinner','games',2,0,100,0,15,'1',0),
(612,'ACH_FILWinner','games',3,0,100,0,30,'1',0),
(613,'ACH_FILWinner','games',4,0,100,0,50,'1',0),
(614,'ACH_FILWinner','games',5,0,100,0,70,'1',0),
(615,'ACH_FILWinner','games',6,0,100,0,100,'1',0),
(616,'ACH_FILWinner','games',7,0,100,0,125,'1',0),
(617,'ACH_FILWinner','games',8,0,100,0,150,'1',0),
(618,'ACH_FILWinner','games',9,0,100,0,175,'1',0),
(619,'ACH_FILWinner','games',10,0,100,0,200,'1',0),
(620,'ACH_FILWinner','games',11,0,100,0,225,'1',0),
(621,'ACH_FILWinner','games',12,0,100,0,250,'1',0),
(622,'ACH_FILWinner','games',13,0,100,0,275,'1',0),
(623,'ACH_FILWinner','games',14,0,100,0,300,'1',0),
(624,'ACH_FILWinner','games',15,0,100,0,325,'1',0),
(625,'ACH_FILWinner','games',16,0,100,0,350,'1',0),
(626,'ACH_FILWinner','games',17,0,100,0,375,'1',0),
(627,'ACH_FILWinner','games',18,0,100,0,400,'1',0),
(628,'ACH_FILWinner','games',19,0,100,0,425,'1',0),
(629,'ACH_FILWinner','games',20,0,100,0,450,'1',0),
(630,'ACH_ChessWinner','games',20,0,100,0,25,'1',0),
(631,'ACH_ChessWinner','games',19,0,100,0,25,'1',0),
(632,'ACH_ChessWinner','games',18,0,100,0,25,'1',0),
(633,'ACH_ChessWinner','games',17,0,100,0,25,'1',0),
(634,'ACH_ChessWinner','games',16,0,100,0,25,'1',0),
(635,'ACH_ChessWinner','games',15,0,100,0,25,'1',0),
(636,'ACH_ChessWinner','games',14,0,100,0,25,'1',0),
(637,'ACH_ChessWinner','games',13,0,100,0,25,'1',0),
(638,'ACH_ChessWinner','games',12,0,100,0,25,'1',0),
(639,'ACH_ChessWinner','games',11,0,100,0,25,'1',0),
(640,'ACH_ChessWinner','games',10,0,100,0,25,'1',0),
(641,'ACH_ChessWinner','games',9,0,100,0,25,'1',0),
(642,'ACH_ChessWinner','games',8,0,100,0,25,'1',0),
(643,'ACH_ChessWinner','games',7,0,100,0,25,'1',0),
(644,'ACH_ChessWinner','games',6,0,100,0,30,'1',0),
(645,'ACH_ChessWinner','games',5,0,100,0,20,'1',0),
(646,'ACH_ChessWinner','games',4,0,100,0,20,'1',0),
(647,'ACH_ChessWinner','games',3,0,100,0,15,'1',0),
(648,'ACH_ChessWinner','games',2,0,100,0,14,'1',0),
(649,'ACH_ChessWinner','games',1,0,100,0,1,'1',0),
(650,'ACH_ChessPlayed','games',20,0,100,0,25,'1',0),
(651,'ACH_ChessPlayed','games',19,0,100,0,25,'1',0),
(652,'ACH_ChessPlayed','games',18,0,100,0,25,'1',0),
(653,'ACH_ChessPlayed','games',17,0,100,0,25,'1',0),
(654,'ACH_ChessPlayed','games',16,0,100,0,25,'1',0),
(655,'ACH_ChessPlayed','games',15,0,100,0,25,'1',0),
(656,'ACH_ChessPlayed','games',14,0,100,0,25,'1',0),
(657,'ACH_ChessPlayed','games',13,0,100,0,25,'1',0),
(658,'ACH_ChessPlayed','games',12,0,100,0,25,'1',0),
(659,'ACH_ChessPlayed','games',11,0,100,0,25,'1',0),
(660,'ACH_ChessPlayed','games',10,0,100,0,25,'1',0),
(661,'ACH_ChessPlayed','games',9,0,100,0,25,'1',0),
(662,'ACH_ChessPlayed','games',8,0,100,0,25,'1',0),
(663,'ACH_ChessPlayed','games',7,0,100,0,25,'1',0),
(664,'ACH_ChessPlayed','games',6,0,100,0,30,'1',0),
(665,'ACH_ChessPlayed','games',5,0,100,0,20,'1',0),
(666,'ACH_ChessPlayed','games',4,0,100,0,20,'1',0),
(667,'ACH_ChessPlayed','games',3,0,100,0,15,'1',0),
(668,'ACH_ChessPlayed','games',2,0,100,0,14,'1',0),
(669,'ACH_ChessPlayed','games',1,0,100,0,1,'1',0),
(670,'ACH_GuideTourGiver','social',1,0,10,0,1,'1',0),
(671,'ACH_GuideTourGiver','social',2,0,20,0,9,'1',0),
(672,'ACH_GuideTourGiver','social',3,0,30,0,25,'1',0),
(673,'ACH_GuideTourGiver','social',4,0,40,0,30,'1',0),
(674,'ACH_GuideTourGiver','social',5,0,50,0,50,'1',0),
(675,'ACH_GuideTourGiver','social',6,0,60,0,60,'1',0),
(676,'ACH_GuideTourGiver','social',7,0,70,0,70,'1',0),
(677,'ACH_GuideTourGiver','social',8,0,80,0,80,'1',0),
(678,'ACH_GuideTourGiver','social',9,0,90,0,90,'1',0),
(679,'ACH_GuideTourGiver','social',10,0,100,0,100,'1',0),
(680,'ACH_GuideRecommendation','social',1,0,10,0,1,'1',0),
(681,'ACH_GuideRecommendation','social',2,0,20,0,9,'1',0),
(682,'ACH_GuideRecommendation','social',3,0,30,0,25,'1',0),
(683,'ACH_GuideRecommendation','social',4,0,40,0,30,'1',0),
(684,'ACH_GuideRecommendation','social',5,0,50,0,50,'1',0),
(685,'ACH_GuideRecommendation','social',6,0,60,0,60,'1',0),
(686,'ACH_GuideRecommendation','social',7,0,70,0,70,'1',0),
(687,'ACH_GuideRecommendation','social',8,0,80,0,80,'1',0),
(688,'ACH_GuideRecommendation','social',9,0,90,0,90,'1',0),
(689,'ACH_GuideRecommendation','social',10,0,100,0,100,'1',0),
(690,'ACH_PetRespectReceiver','social',10,500,50,0,500,'1',0),
(691,'ACH_PetRespectReceiver','social',9,400,25,0,350,'1',0),
(692,'ACH_PetRespectReceiver','social',8,300,25,0,300,'1',0),
(693,'ACH_PetRespectReceiver','social',7,200,25,0,250,'1',0),
(694,'ACH_PetRespectReceiver','social',6,100,25,0,200,'1',0),
(695,'ACH_PetRespectReceiver','social',5,75,10,0,150,'1',0),
(696,'ACH_PetRespectReceiver','social',4,50,10,0,100,'1',0),
(697,'ACH_PetRespectReceiver','social',3,25,10,0,50,'1',0),
(698,'ACH_PetRespectReceiver','social',2,10,10,0,10,'1',0),
(699,'ACH_PetRespectReceiver','social',1,5,10,0,1,'1',0),
(700,'ACH_Farmer','games',10,0,20,0,30,'1',0),
(701,'ACH_Farmer','games',9,0,15,0,20,'1',0),
(702,'ACH_Farmer','games',8,0,10,0,20,'1',0),
(703,'ACH_Farmer','games',7,0,10,0,20,'1',0),
(704,'ACH_Farmer','games',6,0,10,0,20,'1',0),
(705,'ACH_Farmer','games',5,0,10,0,20,'1',0),
(706,'ACH_Farmer','games',4,0,10,0,10,'1',0),
(707,'ACH_Farmer','games',3,0,10,0,5,'1',0),
(708,'ACH_Farmer','games',2,0,10,0,4,'1',0),
(709,'ACH_Farmer','games',1,0,10,0,1,'1',0),
(710,'ACH_SoKWinner','games',1,0,100,0,1,'1',0),
(711,'ACH_SoKWinner','games',2,0,100,0,15,'1',0),
(712,'ACH_SoKWinner','games',3,0,100,0,30,'1',0),
(713,'ACH_SoKWinner','games',4,0,100,0,50,'1',0),
(714,'ACH_SoKWinner','games',5,0,100,0,70,'1',0),
(715,'ACH_SoKWinner','games',6,0,100,0,100,'1',0),
(716,'ACH_SoKWinner','games',7,0,100,0,125,'1',0),
(717,'ACH_SoKWinner','games',8,0,100,0,150,'1',0),
(718,'ACH_SoKWinner','games',9,0,100,0,175,'1',0),
(719,'ACH_SoKWinner','games',10,0,100,0,200,'1',0),
(720,'ACH_SoKWinner','games',11,0,100,0,225,'1',0),
(721,'ACH_SoKWinner','games',12,0,100,0,250,'1',0),
(722,'ACH_SoKWinner','games',13,0,100,0,275,'1',0),
(723,'ACH_SoKWinner','games',14,0,100,0,300,'1',0),
(724,'ACH_SoKWinner','games',15,0,100,0,325,'1',0),
(725,'ACH_SoKWinner','games',16,0,100,0,350,'1',0),
(726,'ACH_SoKWinner','games',17,0,100,0,375,'1',0),
(727,'ACH_SoKWinner','games',18,0,100,0,400,'1',0),
(728,'ACH_SoKWinner','games',19,0,100,0,425,'1',0),
(729,'ACH_SoKSaver','games',1,0,100,0,1,'1',0),
(730,'ACH_SoKSaver','games',2,0,100,0,15,'1',0),
(731,'ACH_SoKSaver','games',3,0,100,0,30,'1',0),
(732,'ACH_SoKSaver','games',4,0,100,0,50,'1',0),
(733,'ACH_SoKSaver','games',5,0,100,0,70,'1',0),
(734,'ACH_SoKSaver','games',6,0,100,0,100,'1',0),
(735,'ACH_SoKSaver','games',7,0,100,0,125,'1',0),
(736,'ACH_SoKSaver','games',8,0,100,0,150,'1',0),
(737,'ACH_SoKSaver','games',9,0,100,0,175,'1',0),
(738,'ACH_SoKSaver','games',10,0,100,0,200,'1',0),
(739,'ACH_SoKSaver','games',11,0,100,0,225,'1',0),
(740,'ACH_SoKSaver','games',12,0,100,0,250,'1',0),
(741,'ACH_SoKSaver','games',13,0,100,0,275,'1',0),
(742,'ACH_SoKSaver','games',14,0,100,0,300,'1',0),
(743,'ACH_SoKSaver','games',15,0,100,0,325,'1',0),
(744,'ACH_SoKSaver','games',16,0,100,0,350,'1',0),
(745,'ACH_SoKSaver','games',17,0,100,0,375,'1',0),
(746,'ACH_SoKSaver','games',18,0,100,0,400,'1',0),
(747,'ACH_SoKSaver','games',19,0,100,0,425,'1',0),
(748,'ACH_SoKSaver','games',20,0,100,0,450,'1',0),
(749,'ACH_SoKKiller','games',1,0,100,0,1,'1',0),
(750,'ACH_SoKKiller','games',2,0,100,0,15,'1',0),
(751,'ACH_SoKKiller','games',3,0,100,0,30,'1',0),
(752,'ACH_SoKKiller','games',4,0,100,0,50,'1',0),
(753,'ACH_SoKKiller','games',5,0,100,0,70,'1',0),
(754,'ACH_SoKKiller','games',6,0,100,0,100,'1',0),
(755,'ACH_SoKKiller','games',7,0,100,0,125,'1',0),
(756,'ACH_SoKKiller','games',8,0,100,0,150,'1',0),
(757,'ACH_SoKKiller','games',9,0,100,0,175,'1',0),
(758,'ACH_SoKKiller','games',10,0,100,0,200,'1',0),
(759,'ACH_SoKKiller','games',11,0,100,0,225,'1',0),
(760,'ACH_SoKKiller','games',12,0,100,0,250,'1',0),
(761,'ACH_SoKKiller','games',13,0,100,0,275,'1',0),
(762,'ACH_SoKKiller','games',14,0,100,0,300,'1',0),
(763,'ACH_SoKKiller','games',15,0,100,0,325,'1',0),
(764,'ACH_SoKKiller','games',16,0,100,0,350,'1',0),
(765,'ACH_SoKKiller','games',17,0,100,0,375,'1',0),
(766,'ACH_SoKKiller','games',18,0,100,0,400,'1',0),
(767,'ACH_SoKKiller','games',19,0,100,0,425,'1',0),
(768,'ACH_SoKKiller','games',20,0,100,0,450,'1',0),
(769,'ACH_NotesReceived','room_builder',1,0,10,0,1,'1',0),
(770,'ACH_NotesReceived','room_builder',2,0,10,0,25,'1',0),
(771,'ACH_NotesReceived','room_builder',3,0,10,0,50,'1',0),
(772,'ACH_NotesReceived','room_builder',4,0,10,0,100,'1',0),
(773,'ACH_NotesReceived','room_builder',5,0,10,0,250,'1',0),
(774,'ACH_NotesReceived','room_builder',6,0,25,0,350,'1',0),
(775,'ACH_NotesReceived','room_builder',7,0,25,0,500,'1',0),
(776,'ACH_NotesReceived','room_builder',8,0,25,0,750,'1',0),
(777,'ACH_NotesReceived','room_builder',9,0,25,0,1000,'1',0),
(778,'ACH_NotesReceived','room_builder',10,0,50,0,2000,'1',0),
(779,'ACH_NotesLeft','room_builder',1,0,50,0,1,'1',0),
(780,'ACH_NotesLeft','room_builder',2,0,50,0,25,'1',0),
(781,'ACH_NotesLeft','room_builder',3,0,100,0,50,'1',0),
(782,'ACH_NotesLeft','room_builder',4,0,100,0,100,'1',0),
(783,'ACH_NotesLeft','room_builder',5,0,100,0,250,'1',0),
(784,'ACH_NotesLeft','room_builder',6,0,100,0,350,'1',0),
(785,'ACH_NotesLeft','room_builder',7,0,100,0,500,'1',0),
(786,'ACH_NotesLeft','room_builder',8,0,100,0,750,'1',0),
(787,'ACH_NotesLeft','room_builder',9,0,100,0,1000,'1',0),
(788,'ACH_NotesLeft','room_builder',10,0,200,0,2000,'1',0),
(789,'ACH_snowBoardBuild','room_builder',1,5,10,0,1,'1',0),
(790,'ACH_snowBoardBuild','room_builder',2,10,10,0,5,'1',0),
(791,'ACH_snowBoardBuild','room_builder',3,25,10,0,25,'1',0),
(792,'ACH_snowBoardBuild','room_builder',4,50,10,0,50,'1',0),
(793,'ACH_snowBoardBuild','room_builder',5,100,25,0,100,'1',0),
(794,'ACH_FireworksCharger','explore',1,5,25,0,1,'1',0),
(795,'ACH_FireworksCharger','explore',2,10,25,0,25,'1',0),
(796,'ACH_FireworksCharger','explore',3,20,25,0,50,'1',0),
(797,'ACH_FireworksCharger','explore',4,30,25,0,75,'1',0),
(798,'ACH_FireworksCharger','explore',5,50,50,0,100,'1',0),
(799,'ACH_FireworksCharger','explore',6,100,25,0,125,'1',0),
(800,'ACH_FireworksCharger','explore',7,150,25,0,150,'1',0),
(801,'ACH_FireworksCharger','explore',8,200,25,0,175,'1',0),
(802,'ACH_FireworksCharger','explore',9,300,25,0,200,'1',0),
(803,'ACH_FireworksCharger','explore',10,500,100,0,250,'1',0),
(804,'ACH_EsA','games',1,50,10,0,1,'1',0),
(805,'ACH_EsA','games',2,100,10,0,25,'1',0),
(806,'ACH_EsA','games',3,150,10,0,50,'1',0),
(807,'ACH_EsA','games',4,200,10,0,75,'1',0),
(808,'ACH_EsA','games',5,300,10,0,100,'1',0),
(809,'ACH_EsA','games',6,400,10,0,125,'1',0),
(810,'ACH_EsA','games',7,500,10,0,150,'1',0),
(811,'ACH_EsA','games',8,600,10,0,200,'1',0),
(812,'ACH_EsA','games',9,700,10,0,250,'1',0),
(813,'ACH_EsA','games',10,800,10,0,300,'1',0),
(814,'ACH_EsA','games',11,900,25,0,350,'1',0),
(815,'ACH_EsA','games',12,1000,25,0,400,'1',0),
(816,'ACH_EsA','games',13,1500,25,0,450,'1',0),
(817,'ACH_EsA','games',14,2000,25,0,500,'1',0),
(818,'ACH_EsA','games',15,2500,25,0,550,'1',0),
(819,'ACH_EsA','games',16,3000,50,0,600,'1',0),
(820,'ACH_EsA','games',17,3500,50,0,650,'1',0),
(821,'ACH_EsA','games',18,4000,50,0,700,'1',0),
(822,'ACH_EsA','games',19,4500,50,0,850,'1',0),
(823,'ACH_EsA','games',20,5000,100,0,1000,'1',0),
(824,'ACH_FreezePlayer','games',1,5,10,0,1,'1',0),
(825,'ACH_FreezePlayer','games',2,10,10,0,25,'1',0),
(826,'ACH_FreezePlayer','games',3,25,10,0,50,'1',0),
(827,'ACH_FreezePlayer','games',4,50,10,0,75,'1',0),
(828,'ACH_FreezePlayer','games',5,75,10,0,100,'1',0),
(829,'ACH_FreezePlayer','games',6,100,10,0,125,'1',0),
(830,'ACH_FreezePlayer','games',7,150,10,0,150,'1',0),
(831,'ACH_FreezePlayer','games',8,200,10,0,200,'1',0),
(832,'ACH_FreezePlayer','games',9,250,10,0,250,'1',0),
(833,'ACH_FreezePlayer','games',10,300,25,0,300,'1',0),
(834,'ACH_FreezePlayer','games',11,400,25,0,350,'1',0),
(835,'ACH_FreezePlayer','games',12,500,25,0,400,'1',0),
(836,'ACH_FreezePlayer','games',13,1000,25,0,450,'1',0),
(837,'ACH_FreezePlayer','games',14,2000,25,0,500,'1',0),
(838,'ACH_FreezePlayer','games',15,4000,25,0,550,'1',0),
(839,'ACH_FreezePlayer','games',16,6000,50,0,600,'1',0),
(840,'ACH_FreezePlayer','games',17,8000,50,0,650,'1',0),
(841,'ACH_FreezePlayer','games',18,10000,50,0,700,'1',0),
(842,'ACH_FreezePlayer','games',19,15000,50,0,850,'1',0),
(843,'ACH_FreezePlayer','games',20,20000,100,0,1000,'1',0),
(844,'ACH_FreezePowerUp','games',1,5,10,0,1,'1',0),
(845,'ACH_FreezePowerUp','games',2,10,10,0,25,'1',0),
(846,'ACH_FreezePowerUp','games',3,25,10,0,50,'1',0),
(847,'ACH_FreezePowerUp','games',4,50,10,0,75,'1',0),
(848,'ACH_FreezePowerUp','games',5,75,10,0,100,'1',0),
(849,'ACH_FreezePowerUp','games',6,100,10,0,125,'1',0),
(850,'ACH_FreezePowerUp','games',7,150,10,0,150,'1',0),
(851,'ACH_FreezePowerUp','games',8,200,10,0,200,'1',0),
(852,'ACH_FreezePowerUp','games',9,250,10,0,250,'1',0),
(853,'ACH_FreezePowerUp','games',10,300,10,0,300,'1',0),
(854,'ACH_FreezePowerUp','games',11,400,25,0,350,'1',0),
(855,'ACH_FreezePowerUp','games',12,500,25,0,400,'1',0),
(856,'ACH_FreezePowerUp','games',13,750,25,0,450,'1',0),
(857,'ACH_FreezePowerUp','games',14,1000,25,0,500,'1',0),
(858,'ACH_FreezePowerUp','games',15,2000,25,0,550,'1',0),
(859,'ACH_FreezePowerUp','games',16,3000,50,0,600,'1',0),
(860,'ACH_FreezePowerUp','games',17,4000,50,0,650,'1',0),
(861,'ACH_FreezePowerUp','games',18,5000,50,0,700,'1',0),
(862,'ACH_FreezePowerUp','games',19,7500,50,0,850,'1',0),
(863,'ACH_FreezePowerUp','games',20,10000,100,0,1000,'1',0),
(864,'ACH_FreezeWinner','games',1,5,10,0,1,'1',0),
(865,'ACH_FreezeWinner','games',2,10,10,0,25,'1',0),
(866,'ACH_FreezeWinner','games',3,25,10,0,50,'1',0),
(867,'ACH_FreezeWinner','games',4,50,10,0,75,'1',0),
(868,'ACH_FreezeWinner','games',5,75,10,0,100,'1',0),
(869,'ACH_FreezeWinner','games',6,100,10,0,125,'1',0),
(870,'ACH_FreezeWinner','games',7,150,10,0,150,'1',0),
(871,'ACH_FreezeWinner','games',8,200,10,0,200,'1',0),
(872,'ACH_FreezeWinner','games',9,250,10,0,250,'1',0),
(873,'ACH_FreezeWinner','games',10,300,25,0,300,'1',0),
(874,'ACH_FreezeWinner','games',11,400,25,0,350,'1',0),
(875,'ACH_FreezeWinner','games',12,500,25,0,400,'1',0),
(876,'ACH_FreezeWinner','games',13,750,25,0,450,'1',0),
(877,'ACH_FreezeWinner','games',14,1000,25,0,500,'1',0),
(878,'ACH_FreezeWinner','games',15,2000,25,0,550,'1',0),
(879,'ACH_FreezeWinner','games',16,3000,50,0,600,'1',0),
(880,'ACH_FreezeWinner','games',17,4000,50,0,650,'1',0),
(881,'ACH_FreezeWinner','games',18,5000,50,0,700,'1',0),
(882,'ACH_FreezeWinner','games',19,7500,50,0,850,'1',0),
(883,'ACH_FreezeWinner','games',20,10000,100,0,1000,'1',0),
(884,'ACH_FreezeQuestCompleted','games',1,0,50,0,1,'1',0),
(885,'ACH_FreezeQuestCompleted','games',2,0,50,0,25,'1',0),
(886,'ACH_FreezeQuestCompleted','games',3,0,50,0,50,'1',0),
(887,'ACH_FreezeQuestCompleted','games',4,0,50,0,75,'1',0),
(888,'ACH_FreezeQuestCompleted','games',5,0,50,0,100,'1',0),
(889,'ACH_FreezeQuestCompleted','games',6,0,50,0,125,'1',0),
(890,'ACH_FreezeQuestCompleted','games',7,0,50,0,150,'1',0),
(891,'ACH_FreezeQuestCompleted','games',8,0,50,0,200,'1',0),
(892,'ACH_FreezeQuestCompleted','games',9,0,50,0,250,'1',0),
(893,'ACH_FreezeQuestCompleted','games',10,0,100,0,300,'1',0),
(894,'ACH_HabboRoue','games',1,0,10,0,1,'1',0),
(895,'ACH_HabboRoue','games',2,0,10,0,25,'1',0),
(896,'ACH_HabboRoue','games',3,0,10,0,50,'1',0),
(897,'ACH_HabboRoue','games',4,0,10,0,75,'1',0),
(898,'ACH_HabboRoue','games',5,0,50,0,100,'1',0),
(899,'ACH_HabboName','identity',1,0,50,0,1,'1',0),
(900,'ACH_KissHabbo','social',1,0,10,0,1,'1',0),
(901,'ACH_KissHabbo','social',2,0,10,0,5,'1',0),
(902,'ACH_KissHabbo','social',3,0,10,0,10,'1',0),
(903,'ACH_KissHabbo','social',4,0,10,0,25,'1',0),
(904,'ACH_KissHabbo','social',5,0,10,0,50,'1',0),
(905,'ACH_KissHabbo','social',6,0,10,0,75,'1',0),
(906,'ACH_KissHabbo','social',7,0,10,0,100,'1',0),
(907,'ACH_KissHabbo','social',8,0,50,0,125,'1',0),
(908,'ACH_KissHabbo','social',9,0,50,0,150,'1',0),
(909,'ACH_KissHabbo','social',10,0,100,0,200,'1',0),
(910,'ACH_AnimationRanking','games',17,0,100,0,650,'1',0),
(911,'ACH_AnimationRanking','games',18,0,100,0,700,'1',0),
(912,'ACH_AnimationRanking','games',19,0,100,0,850,'1',0),
(913,'ACH_AnimationRanking','games',20,0,300,0,1000,'1',0),
(914,'ACH_AnimationRanking','games',16,0,100,0,600,'1',0),
(915,'ACH_AnimationRanking','games',15,0,100,0,550,'1',0),
(916,'ACH_AnimationRanking','games',14,0,100,0,500,'1',0),
(917,'ACH_AnimationRanking','games',13,0,100,0,450,'1',0),
(918,'ACH_AnimationRanking','games',12,0,100,0,400,'1',0),
(919,'ACH_AnimationRanking','games',11,0,100,0,350,'1',0),
(920,'ACH_AnimationRanking','games',10,0,100,0,300,'1',0),
(921,'ACH_AnimationRanking','games',9,0,50,0,250,'1',0),
(923,'ACH_AnimationRanking','games',8,0,50,0,200,'1',0),
(924,'ACH_AnimationRanking','games',7,0,50,0,150,'1',0),
(925,'ACH_AnimationRanking','games',6,0,50,0,125,'1',0),
(926,'ACH_AnimationRanking','games',5,0,50,0,100,'1',0),
(927,'ACH_AnimationRanking','games',4,0,50,0,75,'1',0),
(928,'ACH_AnimationRanking','games',3,0,50,0,50,'1',0),
(929,'ACH_AnimationRanking','games',2,0,50,0,25,'1',0),
(930,'ACH_AnimationRanking','games',1,0,50,0,1,'1',0),
(931,'ACH_SurvivalKills','survival_mode',1,0,25,0,1,'1',3),
(932,'ACH_SurvivalKills','survival_mode',2,0,25,0,25,'1',3),
(933,'ACH_SurvivalKills','survival_mode',3,0,25,0,50,'1',3),
(934,'ACH_SurvivalKills','survival_mode',4,0,25,0,75,'1',3),
(935,'ACH_SurvivalKills','survival_mode',5,0,50,0,100,'1',3),
(936,'ACH_SurvivalKills','survival_mode',6,0,25,0,150,'1',3),
(937,'ACH_SurvivalKills','survival_mode',7,0,25,0,200,'1',3),
(938,'ACH_SurvivalKills','survival_mode',8,0,25,0,250,'1',3),
(939,'ACH_SurvivalKills','survival_mode',9,0,25,0,375,'1',3),
(940,'ACH_SurvivalKills','survival_mode',10,0,100,0,500,'1',3),
(941,'ACH_SurvivalBullets','survival_mode',1,0,25,0,1,'1',3),
(942,'ACH_SurvivalBullets','survival_mode',2,0,25,0,25,'1',3),
(943,'ACH_SurvivalBullets','survival_mode',3,0,25,0,50,'1',3),
(944,'ACH_SurvivalBullets','survival_mode',4,0,25,0,75,'1',3),
(945,'ACH_SurvivalBullets','survival_mode',5,0,50,0,100,'1',3),
(946,'ACH_SurvivalBullets','survival_mode',6,0,25,0,150,'1',3),
(947,'ACH_SurvivalBullets','survival_mode',7,0,25,0,200,'1',3),
(948,'ACH_SurvivalBullets','survival_mode',8,0,25,0,250,'1',3),
(949,'ACH_SurvivalBullets','survival_mode',9,0,25,0,375,'1',3),
(950,'ACH_SurvivalBullets','survival_mode',10,0,100,0,500,'1',3),
(951,'ACH_SurvivalChest','survival_mode',1,0,25,0,1,'1',3),
(952,'ACH_SurvivalChest','survival_mode',2,0,25,0,25,'1',3),
(953,'ACH_SurvivalChest','survival_mode',3,0,25,0,50,'1',3),
(954,'ACH_SurvivalChest','survival_mode',4,0,25,0,75,'1',3),
(955,'ACH_SurvivalChest','survival_mode',5,0,50,0,100,'1',3),
(956,'ACH_SurvivalChest','survival_mode',6,0,25,0,150,'1',3),
(957,'ACH_SurvivalChest','survival_mode',7,0,25,0,200,'1',3),
(958,'ACH_SurvivalChest','survival_mode',8,0,25,0,250,'1',3),
(959,'ACH_SurvivalChest','survival_mode',9,0,25,0,375,'1',3),
(960,'ACH_SurvivalChest','survival_mode',10,0,100,0,500,'1',3),
(961,'ACH_ThreatPlayer','explore',1,0,10,0,1,'1',0),
(962,'ACH_ThreatPlayer','explore',2,0,10,0,5,'1',0),
(963,'ACH_ThreatPlayer','explore',3,0,10,0,10,'1',0),
(964,'ACH_ThreatPlayer','explore',4,0,10,0,25,'1',0),
(965,'ACH_ThreatPlayer','explore',5,1,10,0,50,'1',0),
(966,'ACH_ThreatPlayer','explore',6,0,10,0,60,'1',0),
(967,'ACH_ThreatPlayer','explore',7,0,10,0,80,'1',0),
(968,'ACH_ThreatPlayer','explore',8,0,50,0,100,'1',0),
(969,'ACH_ThreatPlayer','explore',9,0,50,0,125,'1',0),
(970,'ACH_ThreatPlayer','explore',10,0,100,0,150,'1',0),
(992,'ACH_RoulletteStandard','commercial',10,0,100,0,200,'1',0),
(993,'ACH_RoulletteStandard','commercial',9,0,50,0,175,'1',0),
(994,'ACH_RoulletteStandard','commercial',8,0,50,0,150,'1',0),
(995,'ACH_RoulletteStandard','commercial',7,0,10,0,125,'1',0),
(996,'ACH_RoulletteStandard','commercial',6,0,10,0,100,'1',0),
(997,'ACH_RoulletteStandard','commercial',5,0,10,0,75,'1',0),
(998,'ACH_RoulletteStandard','commercial',4,0,10,0,50,'1',0),
(999,'ACH_RoulletteStandard','commercial',3,0,10,0,25,'1',0),
(1000,'ACH_RoulletteStandard','commercial',2,0,10,0,10,'1',0),
(1001,'ACH_RoulletteStandard','commercial',1,0,10,0,1,'1',0),
(1002,'ACH_RoulletteRow','commercial',5,0,100,0,100,'1',0),
(1003,'ACH_RoulletteRow','commercial',4,0,50,0,75,'1',0),
(1004,'ACH_RoulletteRow','commercial',3,0,50,0,50,'1',0),
(1005,'ACH_RoulletteRow','commercial',2,0,10,0,25,'1',0),
(1006,'ACH_RoulletteRow','commercial',1,0,10,0,1,'1',0),
(1007,'ACH_RoulletteZero','commercial',1,0,10,0,1,'1',0),
(1008,'ACH_RoulletteZero','commercial',2,0,10,0,25,'1',0),
(1009,'ACH_RoulletteZero','commercial',3,0,10,0,50,'1',0),
(1010,'ACH_RoulletteZero','commercial',4,0,10,0,75,'1',0),
(1011,'ACH_RoulletteZero','commercial',5,0,10,0,100,'1',0),
(1012,'ACH_RoulletteFree','commercial',5,0,100,0,100,'1',0),
(1013,'ACH_RoulletteFree','commercial',4,0,50,0,75,'1',0),
(1014,'ACH_RoulletteFree','commercial',3,0,50,0,50,'1',0),
(1015,'ACH_RoulletteFree','commercial',2,0,10,0,25,'1',0),
(1016,'ACH_RoulletteFree','commercial',1,0,10,0,1,'1',0),
(1017,'ACH_RoulletteColor','commercial',5,0,10,0,100,'1',0),
(1018,'ACH_RoulletteColor','commercial',4,0,10,0,75,'1',0),
(1019,'ACH_RoulletteColor','commercial',3,0,10,0,50,'1',0),
(1020,'ACH_RoulletteColor','commercial',2,0,10,0,25,'1',0),
(1021,'ACH_RoulletteColor','commercial',1,0,10,0,1,'1',0),
(1022,'ACH_RoulletteBig','commercial',5,0,10,0,100,'1',0),
(1023,'ACH_RoulletteBig','commercial',4,0,10,0,75,'1',0),
(1024,'ACH_RoulletteBig','commercial',3,0,10,0,50,'1',0),
(1025,'ACH_RoulletteBig','commercial',2,0,10,0,25,'1',0),
(1026,'ACH_RoulletteBig','commercial',1,0,10,0,1,'1',0),
(1027,'ACH_Spr','explore',1,50,10,0,1,'1',0),
(1028,'ACH_Spr','explore',2,100,10,0,2,'1',0),
(1029,'ACH_Spr','explore',3,250,10,0,3,'1',0),
(1030,'ACH_Spr','explore',4,500,10,0,4,'1',0),
(1031,'ACH_Spr','explore',5,750,10,0,5,'1',0),
(1032,'ACH_Spr','explore',6,1000,10,0,6,'1',0),
(1033,'ACH_Spr','explore',7,1500,25,0,7,'1',0),
(1034,'ACH_Spr','explore',8,2000,25,0,8,'1',0),
(1035,'ACH_Spr','explore',9,2500,25,0,9,'1',0),
(1036,'ACH_Spr','explore',10,5000,100,0,10,'1',0),
(1079,'ACH_SurvivalWinner','survival_mode',1,10,25,0,1,'1',3),
(1080,'ACH_SurvivalWinner','survival_mode',2,10,25,0,25,'1',3),
(1081,'ACH_SurvivalWinner','survival_mode',3,10,25,0,50,'1',3),
(1082,'ACH_SurvivalWinner','survival_mode',4,10,25,0,75,'1',3),
(1083,'ACH_SurvivalWinner','survival_mode',5,10,50,0,100,'1',3),
(1084,'ACH_SurvivalWinner','survival_mode',6,10,25,0,150,'1',3),
(1085,'ACH_SurvivalWinner','survival_mode',7,10,25,0,200,'1',3),
(1086,'ACH_SurvivalWinner','survival_mode',8,10,25,0,250,'1',3),
(1087,'ACH_SurvivalWinner','survival_mode',9,20,25,0,375,'1',3),
(1088,'ACH_SurvivalWinner','survival_mode',10,25,100,0,500,'1',3),
(1089,'ACH_RPS','games',10,25,100,0,500,'1',1),
(1090,'ACH_RPS','games',9,20,25,0,375,'1',1),
(1091,'ACH_RPS','games',8,10,25,0,250,'1',1),
(1092,'ACH_RPS','games',7,10,25,0,200,'1',1),
(1093,'ACH_RPS','games',6,10,25,0,150,'1',1),
(1094,'ACH_RPS','games',5,10,50,0,100,'1',1),
(1095,'ACH_RPS','games',4,10,25,0,75,'1',1),
(1096,'ACH_RPS','games',3,10,25,0,50,'1',1),
(1097,'ACH_RPS','games',2,10,25,0,25,'1',1),
(1098,'ACH_RPS','games',1,10,25,0,1,'1',1),
(1099,'ACH_Hweensummon','explore',1,10,10,0,1,'1',0),
(1100,'ACH_Hweensummon','explore',2,10,10,0,4,'1',0),
(1101,'ACH_Hweensummon','explore',3,10,10,0,6,'1',0),
(1102,'ACH_Hweensummon','explore',4,10,10,0,8,'1',0),
(1103,'ACH_Hweensummon','explore',5,10,10,0,10,'1',0),
(1104,'ACH_Hweensummon','explore',6,10,10,0,12,'1',0),
(1105,'ACH_Hweensummon','explore',7,10,10,0,14,'1',0),
(1106,'ACH_Hweensummon','explore',8,10,10,0,16,'1',0),
(1107,'ACH_Hweensummon','explore',9,10,10,0,18,'1',0),
(1108,'ACH_Hweensummon','explore',10,10,10,0,20,'1',0),
(1109,'ACH_Xmascrystal','explore',10,0,200,0,75,'1',0),
(1110,'ACH_Xmascrystal','explore',9,0,100,0,50,'1',0),
(1111,'ACH_Xmascrystal','explore',8,0,40,0,40,'1',0),
(1112,'ACH_Xmascrystal','explore',7,0,30,0,30,'1',0),
(1113,'ACH_Xmascrystal','explore',6,0,20,0,20,'1',0),
(1114,'ACH_Xmascrystal','explore',5,0,20,0,16,'1',0),
(1115,'ACH_Xmascrystal','explore',4,0,20,0,12,'1',0),
(1116,'ACH_Xmascrystal','explore',3,0,15,0,8,'1',0),
(1117,'ACH_Xmascrystal','explore',2,0,10,0,4,'1',0),
(1118,'ACH_Xmascrystal','explore',1,0,5,0,1,'1',0),
(1119,'ACH_CrossTrainer','games',3,250,10,0,120,'1',0),
(1120,'ACH_CrossTrainer','games',2,100,10,0,60,'1',0),
(1121,'ACH_CrossTrainer','games',1,50,10,0,5,'1',0),
(1122,'ACH_Trampolinist','games',10,2000,50,0,15360,'1',0),
(1123,'ACH_Trampolinist','games',9,1750,25,0,7680,'1',0),
(1124,'ACH_Trampolinist','games',8,1500,25,0,3840,'1',0),
(1125,'ACH_Trampolinist','games',7,1250,25,0,1920,'1',0),
(1126,'ACH_Trampolinist','games',6,1000,25,0,960,'1',0),
(1127,'ACH_Trampolinist','games',5,750,10,0,480,'1',0),
(1128,'ACH_Trampolinist','games',4,500,10,0,240,'1',0),
(1129,'ACH_Trampolinist','games',3,250,10,0,120,'1',0),
(1130,'ACH_Trampolinist','games',2,100,10,0,60,'1',0),
(1131,'ACH_Trampolinist','games',1,50,10,0,5,'1',0),
(1132,'ACH_CrossTrainer','games',4,500,10,0,240,'1',0),
(1133,'ACH_CrossTrainer','games',5,750,10,0,480,'1',0),
(1134,'ACH_CrossTrainer','games',6,1000,25,0,960,'1',0),
(1135,'ACH_CrossTrainer','games',7,1250,25,0,1920,'1',0),
(1136,'ACH_CrossTrainer','games',8,1500,25,0,3840,'1',0),
(1137,'ACH_CrossTrainer','games',9,1750,25,0,7680,'1',0),
(1138,'ACH_CrossTrainer','games',10,2000,50,0,15360,'1',0),
(1139,'ACH_FootballGoalScoredInRoom','games',1,5,10,0,1,'1',0),
(1140,'ACH_FootballGoalScoredInRoom','games',2,10,10,0,10,'1',0),
(1141,'ACH_FootballGoalScoredInRoom','games',3,25,10,0,100,'1',0),
(1142,'ACH_FootballGoalScoredInRoom','games',4,50,25,0,1000,'1',0),
(1143,'ACH_TagA','room_builder',1,5,10,0,1,'1',0),
(1144,'ACH_TagA','room_builder',2,10,10,0,5,'1',0),
(1145,'ACH_TagA','room_builder',3,25,10,0,10,'1',0),
(1146,'ACH_TagA','room_builder',4,50,10,0,20,'1',0),
(1147,'ACH_TagA','room_builder',5,75,10,0,30,'1',0),
(1148,'ACH_TagA','room_builder',6,100,10,0,40,'1',0),
(1149,'ACH_TagA','room_builder',7,150,10,0,50,'1',0),
(1150,'ACH_TagA','room_builder',8,200,10,0,60,'1',0),
(1151,'ACH_TagA','room_builder',9,250,10,0,70,'1',0),
(1152,'ACH_TagA','room_builder',10,300,10,0,80,'1',0),
(1153,'ACH_RbTagA','room_builder',1,5,10,0,5,'1',0),
(1154,'ACH_RbTagA','room_builder',2,10,10,0,10,'1',0),
(1155,'ACH_RbTagA','room_builder',3,25,10,0,50,'1',0),
(1156,'ACH_RbTagA','room_builder',4,50,10,0,100,'1',0),
(1157,'ACH_RbTagA','room_builder',5,75,10,0,150,'1',0),
(1158,'ACH_RbTagA','room_builder',6,100,10,0,200,'1',0),
(1159,'ACH_RbTagA','room_builder',7,150,10,0,250,'1',0),
(1160,'ACH_RbTagA','room_builder',8,200,10,0,300,'1',0),
(1161,'ACH_RbTagA','room_builder',9,250,10,0,350,'1',0),
(1162,'ACH_RbTagA','room_builder',10,300,25,0,400,'1',0),
(1163,'ACH_BotsCount','room_builder',2,100,10,0,5,'1',0),
(1164,'ACH_BotsCount','room_builder',1,100,10,0,1,'1',0),
(1165,'ACH_BotsCount','room_builder',3,100,10,0,10,'1',0),
(1166,'ACH_BotsCount','room_builder',4,100,10,0,15,'1',0),
(1167,'ACH_BotsCount','room_builder',5,100,10,0,20,'1',0),
(1168,'ACH_BotsCount','room_builder',6,100,10,0,25,'1',0),
(1169,'ACH_BotsCount','room_builder',7,100,10,0,30,'1',0),
(1170,'ACH_BotsCount','room_builder',8,100,10,0,35,'1',0),
(1171,'ACH_BotsCount','room_builder',9,100,10,0,40,'1',0),
(1172,'ACH_BotsCount','room_builder',10,100,10,0,45,'1',0),
(1176,'ACH_Jogger','games',1,50,10,0,5,'1',0),
(1182,'ACH_TagC','games',1,5,10,0,5,'1',0),
(1183,'ACH_Jogger','games',3,250,10,0,120,'1',0),
(1184,'ACH_Jogger','games',4,500,10,0,240,'1',0),
(1185,'ACH_Jogger','games',5,750,10,0,480,'1',0),
(1186,'ACH_Jogger','games',6,1000,25,0,960,'1',0),
(1187,'ACH_Jogger','games',7,1250,25,0,1920,'1',0),
(1188,'ACH_Jogger','games',8,1500,25,0,3840,'1',0),
(1189,'ACH_Jogger','games',9,1750,25,0,7680,'1',0),
(1190,'ACH_Jogger','games',10,2000,50,0,15360,'1',0),
(1191,'ACH_Jogger','games',2,100,10,0,60,'1',0),
(1192,'ACH_TagC','games',2,10,10,0,10,'1',0),
(1193,'ACH_TagC','games',3,25,10,0,30,'1',0),
(1194,'ACH_TagC','games',4,50,10,0,60,'1',0),
(1195,'ACH_TagC','games',5,75,10,0,120,'1',0),
(1196,'ACH_TagC','games',6,100,10,0,240,'1',0),
(1197,'ACH_TagC','games',7,150,10,0,360,'1',0),
(1198,'ACH_TagC','games',8,200,10,0,480,'1',0),
(1199,'ACH_TagC','games',9,250,10,0,600,'1',0),
(1200,'ACH_TagC','games',10,300,25,0,750,'1',0),
(1201,'ACH_RbTagC','games',1,5,10,0,5,'1',0),
(1202,'ACH_RbTagC','games',2,10,10,0,10,'1',0),
(1203,'ACH_RbTagC','games',3,25,10,0,30,'1',0),
(1204,'ACH_RbTagC','games',4,50,10,0,60,'1',0),
(1205,'ACH_RbTagC','games',5,75,10,0,120,'1',0),
(1206,'ACH_RbTagC','games',6,100,10,0,240,'1',0),
(1207,'ACH_RbTagC','games',7,150,10,0,360,'1',0),
(1208,'ACH_RbTagC','games',8,200,10,0,480,'1',0),
(1209,'ACH_RbTagC','games',9,250,10,0,600,'1',0),
(1210,'ACH_RbTagC','games',10,300,10,0,750,'1',0),
(1211,'ACH_SkateBoardJump','games',1,50,10,0,10,'1',0),
(1212,'ACH_SkateBoardJump','games',2,100,10,0,50,'1',0),
(1213,'ACH_SkateBoardJump','games',3,150,10,0,250,'1',0),
(1214,'ACH_SkateBoardJump','games',4,200,10,0,500,'1',0),
(1215,'ACH_SkateBoardJump','games',5,300,10,0,1000,'1',0),
(1216,'ACH_SkateBoardJump','games',6,400,10,0,2500,'1',0),
(1217,'ACH_SkateBoardJump','games',7,500,10,0,5000,'1',0),
(1218,'ACH_SkateBoardJump','games',8,600,10,0,10000,'1',0),
(1219,'ACH_SkateBoardJump','games',9,700,10,0,15000,'1',0),
(1220,'ACH_SkateBoardJump','games',10,800,25,0,20000,'1',0),
(1221,'ACH_SkateBoardSlide','games',1,50,10,0,10,'1',0),
(1222,'ACH_SkateBoardSlide','games',2,100,10,0,50,'1',0),
(1223,'ACH_SkateBoardSlide','games',3,150,10,0,250,'1',0),
(1224,'ACH_SkateBoardSlide','games',4,200,10,0,500,'1',0),
(1225,'ACH_SkateBoardSlide','games',5,300,10,0,1000,'1',0),
(1226,'ACH_SkateBoardSlide','games',6,400,10,0,2500,'1',0),
(1227,'ACH_SkateBoardSlide','games',7,500,10,0,5000,'1',0),
(1228,'ACH_SkateBoardSlide','games',8,600,10,0,10000,'1',0),
(1229,'ACH_SkateBoardSlide','games',9,700,10,0,15000,'1',0),
(1230,'ACH_SkateBoardSlide','games',10,800,25,0,20000,'1',0),
(1251,'ACH_FootballGoalScoredInRoom','games',5,100,50,0,10000,'1',0),
(1255,'ACH_TagA','room_builder',11,350,25,0,90,'1',0),
(1256,'ACH_TagA','room_builder',12,400,25,0,100,'1',0),
(1257,'ACH_TagA','room_builder',13,450,25,0,110,'1',0),
(1258,'ACH_TagA','room_builder',14,500,25,0,120,'1',0),
(1259,'ACH_TagA','room_builder',15,750,25,0,130,'1',0),
(1260,'ACH_TagA','room_builder',16,1000,50,0,140,'1',0),
(1261,'ACH_TagA','room_builder',17,2000,50,0,150,'1',0),
(1262,'ACH_TagA','room_builder',18,3000,50,0,160,'1',0),
(1263,'ACH_TagA','room_builder',19,4000,50,0,175,'1',0),
(1264,'ACH_TagA','room_builder',20,5000,100,0,200,'1',0),
(1265,'ACH_RbTagA','room_builder',11,350,25,0,500,'1',0),
(1266,'ACH_RbTagA','room_builder',12,400,25,0,600,'1',0),
(1267,'ACH_RbTagA','room_builder',13,500,25,0,700,'1',0),
(1268,'ACH_RbTagA','room_builder',14,600,25,0,800,'1',0),
(1269,'ACH_RbTagA','room_builder',15,700,25,0,900,'1',0),
(1270,'ACH_RbTagA','room_builder',16,800,50,0,1000,'1',0),
(1271,'ACH_RbTagA','room_builder',17,900,50,0,1200,'1',0),
(1272,'ACH_RbTagA','room_builder',18,1000,50,0,1400,'1',0),
(1273,'ACH_RbTagA','room_builder',19,1500,50,0,1600,'1',0),
(1274,'ACH_RbTagA','room_builder',20,2000,100,0,2000,'1',0),
(1294,'ACH_TagC','games',11,350,25,0,900,'1',0),
(1304,'ACH_TagC','games',12,400,25,0,1200,'1',0),
(1305,'ACH_TagC','games',13,450,25,0,1500,'1',0),
(1306,'ACH_TagC','games',14,500,25,0,1800,'1',0),
(1307,'ACH_TagC','games',15,600,25,0,2100,'1',0),
(1308,'ACH_TagC','games',16,700,50,0,2400,'1',0),
(1309,'ACH_TagC','games',17,800,50,0,3000,'1',0),
(1310,'ACH_TagC','games',18,900,50,0,4000,'1',0),
(1311,'ACH_TagC','games',19,1000,50,0,5000,'1',0),
(1312,'ACH_TagC','games',20,1500,100,0,10000,'1',0),
(1323,'ACH_SkateBoardJump','games',11,900,25,0,25000,'1',0),
(1324,'ACH_SkateBoardJump','games',12,1000,25,0,30000,'1',0),
(1325,'ACH_SkateBoardJump','games',13,1500,25,0,35000,'1',0),
(1326,'ACH_SkateBoardJump','games',14,2000,25,0,40000,'1',0),
(1327,'ACH_SkateBoardJump','games',15,2500,25,0,45000,'1',0),
(1328,'ACH_SkateBoardJump','games',16,3000,50,0,50000,'1',0),
(1329,'ACH_SkateBoardJump','games',17,3500,50,0,55000,'1',0),
(1330,'ACH_SkateBoardJump','games',18,4000,50,0,60000,'1',0),
(1331,'ACH_SkateBoardJump','games',19,4500,50,0,80000,'1',0),
(1332,'ACH_SkateBoardJump','games',20,5000,100,0,100000,'1',0),
(1333,'ACH_SkateBoardSlide','games',11,900,25,0,25000,'1',0),
(1334,'ACH_SkateBoardSlide','games',12,1000,25,0,30000,'1',0),
(1335,'ACH_SkateBoardSlide','games',13,1500,25,0,35000,'1',0),
(1336,'ACH_SkateBoardSlide','games',14,2000,25,0,40000,'1',0),
(1337,'ACH_SkateBoardSlide','games',15,2500,25,0,45000,'1',0),
(1338,'ACH_SkateBoardSlide','games',16,3000,50,0,50000,'1',0),
(1339,'ACH_SkateBoardSlide','games',17,3500,50,0,55000,'1',0),
(1340,'ACH_SkateBoardSlide','games',18,4000,50,0,60000,'1',0),
(1341,'ACH_SkateBoardSlide','games',19,4500,50,0,80000,'1',0),
(1342,'ACH_SkateBoardSlide','games',20,5000,100,0,100000,'1',0),
(1343,'ACH_RoomDecoHoleFurniCount','room_builder',1,5,10,0,1,'1',0),
(1344,'ACH_RoomDecoHoleFurniCount','room_builder',2,10,10,0,6,'1',0),
(1345,'ACH_RoomDecoHoleFurniCount','room_builder',3,25,10,0,15,'1',0),
(1346,'ACH_RoomDecoHoleFurniCount','room_builder',4,50,10,0,30,'1',0),
(1347,'ACH_RoomDecoHoleFurniCount','room_builder',5,75,10,0,60,'1',0),
(1348,'ACH_RoomDecoHoleFurniCount','room_builder',6,100,25,0,120,'1',0),
(1349,'ACH_RoomDecoHoleFurniCount','room_builder',7,200,25,0,250,'1',0),
(1350,'ACH_RoomDecoHoleFurniCount','room_builder',8,300,25,0,512,'1',0),
(1351,'ACH_RoomDecoHoleFurniCount','room_builder',9,400,25,0,1024,'1',0),
(1352,'ACH_RoomDecoHoleFurniCount','room_builder',10,500,50,0,2048,'1',0),
(1353,'ACH_HorseJumping','explore',1,5,10,0,5,'1',0),
(1354,'ACH_HorseJumping','explore',2,10,10,0,25,'1',0),
(1355,'ACH_HorseJumping','explore',3,25,10,0,50,'1',0),
(1356,'ACH_HorseJumping','explore',4,50,10,0,100,'1',0),
(1357,'ACH_HorseJumping','explore',5,75,25,0,250,'1',0),
(1358,'ACH_HorseConsecutiveJumpsCount','explore',1,50,10,0,1,'1',0),
(1359,'ACH_HorseConsecutiveJumpsCount','explore',5,400,50,0,250,'1',0),
(1360,'ACH_HorseConsecutiveJumpsCount','explore',6,500,100,0,300,'1',0),
(1361,'ACH_HorseConsecutiveJumpsCount','explore',7,600,100,0,400,'1',0),
(1362,'ACH_HorseConsecutiveJumpsCount','explore',2,100,50,0,25,'1',0),
(1363,'ACH_HorseConsecutiveJumpsCount','explore',3,200,50,0,50,'1',0),
(1364,'ACH_HorseConsecutiveJumpsCount','explore',4,300,50,0,100,'1',0),
(1365,'ACH_HorseConsecutiveJumpsCount','explore',8,700,100,0,500,'1',0),
(1366,'ACH_HorseConsecutiveJumpsCount','explore',9,800,100,0,600,'1',0),
(1367,'ACH_HorseConsecutiveJumpsCount','explore',10,900,250,0,700,'1',0),
(1368,'ACH_HorseConsecutiveJumpsCount','explore',11,1000,250,0,800,'1',0),
(1369,'ACH_HorseConsecutiveJumpsCount','explore',12,1250,250,0,900,'1',0),
(1370,'ACH_HorseConsecutiveJumpsCount','explore',13,1500,250,0,1000,'1',0),
(1371,'ACH_HorseConsecutiveJumpsCount','explore',14,1750,250,0,2000,'1',0),
(1372,'ACH_HorseConsecutiveJumpsCount','explore',15,2000,500,0,3000,'1',0),
(1373,'ACH_HorseConsecutiveJumpsCount','explore',16,2500,500,0,4000,'1',0),
(1374,'ACH_HorseConsecutiveJumpsCount','explore',17,3000,500,0,5000,'1',0),
(1375,'ACH_HorseConsecutiveJumpsCount','explore',18,3500,750,0,6000,'1',0),
(1376,'ACH_HorseConsecutiveJumpsCount','explore',19,4000,1000,0,8000,'1',0),
(1377,'ACH_HorseConsecutiveJumpsCount','explore',20,5000,1500,0,10000,'1',0),
(1378,'ACH_RoomHorseJumpCount','explore',1,5,10,0,1,'1',0),
(1379,'ACH_RoomHorseJumpCount','explore',2,10,10,0,25,'1',0),
(1380,'ACH_RoomHorseJumpCount','explore',3,25,10,0,50,'1',0),
(1381,'ACH_RoomHorseJumpCount','explore',4,50,10,0,100,'1',0),
(1382,'ACH_RoomHorseJumpCount','explore',5,100,25,0,250,'1',0),
(1383,'ACH_HorseRent','room_builder',1,5,10,0,1,'1',0),
(1384,'ACH_HorseRent','room_builder',2,10,10,0,25,'1',0),
(1385,'ACH_HorseRent','room_builder',3,25,10,0,50,'1',0),
(1386,'ACH_HorseRent','room_builder',4,50,10,0,100,'1',0),
(1387,'ACH_HorseRent','room_builder',5,75,10,0,250,'1',0),
(1388,'ACH_HorseRent','room_builder',6,100,25,0,300,'1',0),
(1389,'ACH_HorseRent','room_builder',7,200,25,0,350,'1',0),
(1390,'ACH_HorseRent','room_builder',8,300,25,0,400,'1',0),
(1391,'ACH_HorseRent','room_builder',9,400,25,0,450,'1',0),
(1392,'ACH_HorseRent','room_builder',10,500,50,0,500,'1',0),
(1394,'ACH_KissGiven','explore',1,5,10,0,1,'1',0),
(1395,'ACH_KissGiven','explore',2,10,10,0,25,'1',0),
(1396,'ACH_KissGiven','explore',3,25,10,0,50,'1',0),
(1397,'ACH_KissGiven','explore',4,50,10,0,100,'1',0),
(1398,'ACH_KissGiven','explore',5,75,10,0,250,'1',0),
(1399,'ACH_KissGiven','explore',6,100,25,0,300,'1',0),
(1400,'ACH_KissGiven','explore',7,200,25,0,350,'1',0),
(1401,'ACH_KissGiven','explore',8,300,25,0,400,'1',0),
(1402,'ACH_KissGiven','explore',9,400,25,0,450,'1',0),
(1403,'ACH_KissGiven','explore',10,500,50,0,500,'1',0),
(1404,'ACH_KissEarned','explore',1,5,10,0,1,'1',0),
(1405,'ACH_KissEarned','explore',2,10,10,0,25,'1',0),
(1406,'ACH_KissEarned','explore',3,25,10,0,50,'1',0),
(1407,'ACH_KissEarned','explore',4,50,10,0,100,'1',0),
(1408,'ACH_KissEarned','explore',5,75,10,0,250,'1',0),
(1409,'ACH_KissEarned','explore',6,100,25,0,300,'1',0),
(1410,'ACH_KissEarned','explore',7,200,25,0,350,'1',0),
(1411,'ACH_KissEarned','explore',8,300,25,0,400,'1',0),
(1412,'ACH_KissEarned','explore',9,400,25,0,450,'1',0),
(1413,'ACH_KissEarned','explore',10,500,50,0,500,'1',0),
(1434,'ACH_GamePlayerExperience','games',1,50,10,0,500,'1',0),
(1435,'ACH_GamePlayerExperience','games',2,100,10,0,1000,'1',0),
(1436,'ACH_GamePlayerExperience','games',3,150,10,0,2000,'1',0),
(1437,'ACH_GamePlayerExperience','games',4,200,10,0,3000,'1',0),
(1438,'ACH_GamePlayerExperience','games',5,300,10,0,5000,'1',0),
(1439,'ACH_GamePlayerExperience','games',6,400,10,0,10000,'1',0),
(1440,'ACH_GamePlayerExperience','games',7,500,10,0,15000,'1',0),
(1441,'ACH_GamePlayerExperience','games',8,600,10,0,20000,'1',0),
(1442,'ACH_GamePlayerExperience','games',9,700,10,0,25000,'1',0),
(1443,'ACH_GamePlayerExperience','games',10,800,25,0,30000,'1',0),
(1444,'ACH_GamePlayerExperience','games',11,900,25,0,40000,'1',0),
(1445,'ACH_GamePlayerExperience','games',12,1000,25,0,50000,'1',0),
(1446,'ACH_GamePlayerExperience','games',13,1500,25,0,60000,'1',0),
(1447,'ACH_GamePlayerExperience','games',14,2000,25,0,70000,'1',0),
(1448,'ACH_GamePlayerExperience','games',15,2500,25,0,80000,'1',0),
(1449,'ACH_GamePlayerExperience','games',16,3000,50,0,90000,'1',0),
(1450,'ACH_GamePlayerExperience','games',17,3500,50,0,100000,'1',0),
(1451,'ACH_GamePlayerExperience','games',18,4000,50,0,250000,'1',0),
(1452,'ACH_GamePlayerExperience','games',19,4500,50,0,500000,'1',0),
(1453,'ACH_GamePlayerExperience','games',20,5000,100,0,750000,'1',0),
(1454,'ACH_GameAuthorExperience','games',1,50,10,0,500,'1',0),
(1455,'ACH_GameAuthorExperience','games',2,100,10,0,1000,'1',0),
(1456,'ACH_GameAuthorExperience','games',3,150,10,0,2000,'1',0),
(1457,'ACH_GameAuthorExperience','games',4,200,10,0,5000,'1',0),
(1458,'ACH_GameAuthorExperience','games',5,300,10,0,10000,'1',0),
(1459,'ACH_GameAuthorExperience','games',6,400,10,0,15000,'1',0),
(1460,'ACH_GameAuthorExperience','games',7,500,10,0,20000,'1',0),
(1461,'ACH_GameAuthorExperience','games',8,600,10,0,25000,'1',0),
(1462,'ACH_GameAuthorExperience','games',9,700,10,0,30000,'1',0),
(1463,'ACH_GameAuthorExperience','games',10,800,25,0,40000,'1',0),
(1464,'ACH_GameAuthorExperience','games',11,900,25,0,50000,'1',0),
(1465,'ACH_GameAuthorExperience','games',12,1000,25,0,60000,'1',0),
(1466,'ACH_GameAuthorExperience','games',13,1500,25,0,70000,'1',0),
(1467,'ACH_GameAuthorExperience','games',14,2000,25,0,80000,'1',0),
(1468,'ACH_GameAuthorExperience','games',15,2500,25,0,90000,'1',0),
(1469,'ACH_GameAuthorExperience','games',16,3000,50,0,100000,'1',0),
(1470,'ACH_GameAuthorExperience','games',17,3500,50,0,250000,'1',0),
(1471,'ACH_GameAuthorExperience','games',18,4000,50,0,500000,'1',0),
(1472,'ACH_GameAuthorExperience','games',19,4500,50,0,750000,'1',0),
(1473,'ACH_GameAuthorExperience','games',20,5000,100,0,1000000,'1',0),
(1474,'ACH_SnowStormHit','games',1,25,5,0,5,'1',0),
(1475,'ACH_SnowStormHit','games',2,50,10,0,10,'1',0),
(1476,'ACH_SnowStormHit','games',3,100,25,0,25,'1',0),
(1477,'ACH_SnowStormHit','games',4,250,50,0,50,'1',0),
(1478,'ACH_SnowStormHit','games',5,500,75,0,100,'1',0),
(1479,'ACH_SnowStormHit','games',6,750,100,0,250,'1',0),
(1480,'ACH_SnowStormHit','games',7,1000,150,0,500,'1',0),
(1481,'ACH_SnowStormHit','games',8,1500,200,0,750,'1',0),
(1482,'ACH_SnowStormHit','games',9,2000,250,0,1000,'1',0),
(1483,'ACH_SnowStormHit','games',10,2500,500,0,1500,'1',0),
(1484,'ACH_SnowStormThrow','games',1,25,5,0,5,'1',0),
(1485,'ACH_SnowStormThrow','games',2,50,10,0,10,'1',0),
(1486,'ACH_SnowStormThrow','games',3,100,25,0,25,'1',0),
(1487,'ACH_SnowStormThrow','games',4,250,50,0,50,'1',0),
(1488,'ACH_SnowStormThrow','games',5,500,75,0,100,'1',0),
(1489,'ACH_SnowStormThrow','games',6,750,100,0,250,'1',0),
(1490,'ACH_SnowStormThrow','games',7,1000,150,0,500,'1',0),
(1491,'ACH_SnowStormThrow','games',8,1500,200,0,750,'1',0),
(1492,'ACH_SnowStormThrow','games',9,2000,250,0,1000,'1',0),
(1493,'ACH_SnowStormThrow','games',10,2500,500,0,1500,'1',0),
(1494,'ACH_SnowStormWin','games',1,25,5,0,5,'1',0),
(1495,'ACH_SnowStormWin','games',2,50,10,0,10,'1',0),
(1496,'ACH_SnowStormWin','games',3,100,25,0,25,'1',0),
(1497,'ACH_SnowStormWin','games',4,250,50,0,50,'1',0),
(1498,'ACH_SnowStormWin','games',5,500,75,0,100,'1',0),
(1499,'ACH_SnowStormWin','games',6,750,100,0,250,'1',0),
(1500,'ACH_SnowStormWin','games',7,1000,150,0,500,'1',0),
(1501,'ACH_SnowStormWin','games',8,1500,200,0,750,'1',0),
(1502,'ACH_SnowStormWin','games',9,2000,250,0,1000,'1',0),
(1503,'ACH_SnowStormWin','games',10,2500,500,0,1500,'1',0),
(1504,'ACH_SnowWarTotalScore','games',1,10,5,0,10,'1',0),
(1505,'ACH_SnowWarTotalScore','games',2,25,10,0,25,'1',0),
(1506,'ACH_SnowWarTotalScore','games',3,50,25,0,50,'1',0),
(1507,'ACH_SnowWarTotalScore','games',4,75,50,0,75,'1',0),
(1508,'ACH_SnowWarTotalScore','games',5,100,60,0,100,'1',0),
(1509,'ACH_SnowWarTotalScore','games',6,150,70,0,200,'1',0),
(1510,'ACH_SnowWarTotalScore','games',7,200,80,0,300,'1',0),
(1511,'ACH_SnowWarTotalScore','games',8,250,90,0,400,'1',0),
(1512,'ACH_SnowWarTotalScore','games',9,300,100,0,500,'1',0),
(1513,'ACH_SnowWarTotalScore','games',10,350,150,0,750,'1',0),
(1514,'ACH_SnowWarTotalScore','games',11,400,200,0,1000,'1',0),
(1515,'ACH_SnowWarTotalScore','games',12,450,250,0,1500,'1',0),
(1516,'ACH_SnowWarTotalScore','games',13,500,300,0,2000,'1',0),
(1517,'ACH_SnowWarTotalScore','games',14,550,350,0,2500,'1',0),
(1518,'ACH_SnowWarTotalScore','games',15,600,400,0,3000,'1',0),
(1519,'ACH_SnowWarTotalScore','games',16,650,450,0,4500,'1',0),
(1520,'ACH_SnowWarTotalScore','games',17,700,500,0,6000,'1',0),
(1521,'ACH_SnowWarTotalScore','games',18,750,550,0,7500,'1',0),
(1522,'ACH_SnowWarTotalScore','games',19,800,600,0,10000,'1',0),
(1523,'ACH_SnowWarTotalScore','games',20,850,650,0,15000,'1',0),
(1524,'ACH_SnowWarTotalScore','games',21,900,700,0,20000,'1',0),
(1525,'ACH_SnowWarTotalScore','games',22,950,750,0,25000,'1',0),
(1526,'ACH_SnowWarTotalScore','games',23,1000,800,0,30000,'1',0),
(1527,'ACH_SnowWarTotalScore','games',24,1500,850,0,40000,'1',0),
(1528,'ACH_SnowWarTotalScore','games',25,2000,900,0,50000,'1',0),
(1529,'ACH_SnowWarTotalScore','games',26,2500,950,0,60000,'1',0),
(1530,'ACH_SnowWarTotalScore','games',27,3000,1000,0,70000,'1',0),
(1531,'ACH_SnowWarTotalScore','games',28,3500,1500,0,80000,'1',0),
(1532,'ACH_SnowWarTotalScore','games',29,4000,2000,0,90000,'1',0),
(1533,'ACH_SnowWarTotalScore','games',30,5000,2500,0,100000,'1',0),
(1535,'ACH_PetLover','social',6,100,25,0,100,'1',0),
(1536,'ACH_PetLover','social',7,150,25,0,150,'1',0),
(1537,'ACH_PetLover','social',8,200,25,0,200,'1',0),
(1538,'ACH_PetLover','social',9,250,25,0,300,'1',0),
(1539,'ACH_PetLover','social',10,500,50,0,500,'1',0),
(1540,'ACH_TagB','games',1,50,10,0,1,'1',0),
(1541,'ACH_TagB','games',2,100,10,0,5,'1',0),
(1542,'ACH_TagB','games',3,150,10,0,10,'1',0),
(1543,'ACH_TagB','games',4,200,10,0,20,'1',0),
(1544,'ACH_TagB','games',5,300,10,0,30,'1',0),
(1545,'ACH_TagB','games',6,400,10,0,40,'1',0),
(1546,'ACH_TagB','games',7,500,10,0,50,'1',0),
(1547,'ACH_TagB','games',8,600,10,0,60,'1',0),
(1548,'ACH_TagB','games',9,700,10,0,70,'1',0),
(1549,'ACH_TagB','games',10,800,25,0,80,'1',0),
(1550,'ACH_TagB','games',11,900,25,0,90,'1',0),
(1551,'ACH_TagB','games',12,1000,25,0,100,'1',0),
(1552,'ACH_TagB','games',13,1500,25,0,110,'1',0),
(1553,'ACH_TagB','games',14,2000,25,0,120,'1',0),
(1554,'ACH_TagB','games',15,2500,25,0,130,'1',0),
(1555,'ACH_TagB','games',16,3000,50,0,140,'1',0),
(1556,'ACH_TagB','games',17,3500,50,0,150,'1',0),
(1557,'ACH_TagB','games',18,4000,50,0,160,'1',0),
(1558,'ACH_TagB','games',19,4500,50,0,175,'1',0),
(1559,'ACH_TagB','games',20,5000,100,0,200,'1',0),
(1560,'ACH_RbTagC','games',11,350,25,0,900,'1',0),
(1561,'ACH_RbTagC','games',12,400,25,0,1200,'1',0),
(1562,'ACH_RbTagC','games',13,450,25,0,1500,'1',0),
(1563,'ACH_RbTagC','games',14,500,25,0,1800,'1',0),
(1564,'ACH_RbTagC','games',15,600,25,0,2100,'1',0),
(1565,'ACH_RbTagC','games',16,700,50,0,2400,'1',0),
(1566,'ACH_RbTagC','games',17,800,50,0,3000,'1',0),
(1567,'ACH_RbTagC','games',18,900,50,0,4000,'1',0),
(1568,'ACH_RbTagC','games',19,1000,50,0,5000,'1',0),
(1569,'ACH_RbTagC','games',20,1500,100,0,10000,'1',0),
(1570,'ACH_StaffOnlineTime','identity',1,0,10,0,60,'1',0),
(1571,'ACH_StaffOnlineTime','identity',2,0,25,0,180,'1',0),
(1572,'ACH_StaffOnlineTime','identity',3,0,50,0,360,'1',0),
(1573,'ACH_StaffOnlineTime','identity',4,0,75,0,720,'1',0),
(1574,'ACH_StaffOnlineTime','identity',5,0,100,0,1440,'1',0),
(1575,'ACH_StaffOnlineTime','identity',6,0,150,0,2880,'1',0),
(1576,'ACH_StaffOnlineTime','identity',7,0,200,0,5760,'1',0),
(1577,'ACH_StaffOnlineTime','identity',8,0,250,0,11520,'1',0),
(1578,'ACH_StaffOnlineTime','identity',9,0,500,0,23040,'1',0),
(1579,'ACH_StaffOnlineTime','identity',10,0,1000,0,46080,'1',0);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `achievements_talents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements_talents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('citizenship','helper') NOT NULL DEFAULT 'citizenship',
  `level` int(11) NOT NULL DEFAULT 0,
  `achievement_ids` varchar(100) NOT NULL DEFAULT '',
  `achievement_levels` varchar(100) NOT NULL DEFAULT '',
  `reward_furni` varchar(100) NOT NULL DEFAULT '',
  `reward_perks` varchar(100) NOT NULL DEFAULT '',
  `reward_badges` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `achievements_talents` WRITE;
/*!40000 ALTER TABLE `achievements_talents` DISABLE KEYS */;
INSERT INTO `achievements_talents` VALUES
(1,'citizenship',0,'305','0','','',''),
(2,'citizenship',1,'1,2,14','1','','walldeco',''),
(3,'citizenship',2,'4,285','2','','','');
/*!40000 ALTER TABLE `achievements_talents` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `activities_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities_calendar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `room_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rewards` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `visible_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `activities_calendar` WRITE;
/*!40000 ALTER TABLE `activities_calendar` DISABLE KEYS */;
INSERT INTO `activities_calendar` VALUES
(4,5948,3016,1,'2023-08-18 05:37:02','test','test','[{\"type\":\"furni\",\"data\":\"xmas_c19_box1\",\"furni_name\":\"Caixa de Natal\"}]','2023-01-17 19:00:00','2022-12-22 17:21:18','2023-01-18 17:48:10');
/*!40000 ALTER TABLE `activities_calendar` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `activity_calendar_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_calendar_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `background_color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `activity_calendar_categories` WRITE;
/*!40000 ALTER TABLE `activity_calendar_categories` DISABLE KEYS */;
INSERT INTO `activity_calendar_categories` VALUES
(1,'Games','#0093ad'),
(2,'Exchanges','#ff4444');
/*!40000 ALTER TABLE `activity_calendar_categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `activity_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `activity_notifications` WRITE;
/*!40000 ALTER TABLE `activity_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_notifications` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `advertences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `valid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `advertences` WRITE;
/*!40000 ALTER TABLE `advertences` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertences` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('ip','machine','user') DEFAULT NULL,
  `expire` int(11) DEFAULT 0 COMMENT '0 = perminent',
  `data` varchar(100) DEFAULT '',
  `user_banned` varchar(100) DEFAULT '',
  `user_id` bigint(20) unsigned DEFAULT 0,
  `reason` varchar(100) DEFAULT '',
  `added_by` int(11) DEFAULT 0,
  `user_addedban` varchar(100) DEFAULT '',
  `ip` varchar(120) DEFAULT NULL,
  `ban_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT 0,
  `owner` varchar(100) DEFAULT '',
  `room_id` int(11) DEFAULT 0,
  `name` varchar(100) DEFAULT 'Placeholder',
  `figure` varchar(255) DEFAULT '',
  `gender` enum('m','f') DEFAULT 'm',
  `motto` varchar(100) DEFAULT NULL,
  `x` int(11) DEFAULT 0,
  `y` int(11) DEFAULT 0,
  `z` double DEFAULT 0,
  `messages` text DEFAULT NULL,
  `automatic_chat` enum('0','1') DEFAULT '1',
  `chat_delay` int(11) DEFAULT 7,
  `mode` enum('default','relaxed') DEFAULT 'default',
  `type` enum('generic','waiter','spy','test') DEFAULT 'generic',
  `data` text DEFAULT NULL,
  `chat_random` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `bots` WRITE;
/*!40000 ALTER TABLE `bots` DISABLE KEYS */;
/*!40000 ALTER TABLE `bots` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_clothing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `clothing_items` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_name` (`item_name`)
) ENGINE=InnoDB AUTO_INCREMENT=942 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_clothing` WRITE;
/*!40000 ALTER TABLE `catalog_clothing` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_clothing` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_club_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_club_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `name` varchar(35) NOT NULL,
  `days` int(11) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 10,
  `points` int(11) NOT NULL DEFAULT 0,
  `points_type` int(11) NOT NULL DEFAULT 0,
  `type` enum('HC','VIP') NOT NULL DEFAULT 'HC',
  `deal` enum('0','1') NOT NULL DEFAULT '0',
  `giftable` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_club_offers` WRITE;
/*!40000 ALTER TABLE `catalog_club_offers` DISABLE KEYS */;
INSERT INTO `catalog_club_offers` VALUES
(1,'1','HABBO_CLUB_1_MONTH',31,60,70,105,'VIP','0','0'),
(2,'1','HABBO_CLUB_3_MONTHS',93,120,120,105,'VIP','0','0');
/*!40000 ALTER TABLE `catalog_club_offers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_featured_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_featured_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `page_link` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_featured_pages` WRITE;
/*!40000 ALTER TABLE `catalog_featured_pages` DISABLE KEYS */;
INSERT INTO `catalog_featured_pages` VALUES
(1,'','catalogue/feature_cata/vip.png','start',-1);
/*!40000 ALTER TABLE `catalog_featured_pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_gift_wrapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_gift_wrapping` (
  `type` enum('new','old') DEFAULT 'new',
  `sprite_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_gift_wrapping` WRITE;
/*!40000 ALTER TABLE `catalog_gift_wrapping` DISABLE KEYS */;
INSERT INTO `catalog_gift_wrapping` VALUES
('new',332),
('new',334),
('new',335),
('new',336),
('new',337),
('new',340),
('new',341),
('new',338),
('new',339),
('old',342),
('old',343),
('old',344),
('old',345),
('old',346),
('old',347),
('old',348),
('new',333);
/*!40000 ALTER TABLE `catalog_gift_wrapping` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `item_ids` varchar(255) NOT NULL,
  `catalog_name` varchar(100) NOT NULL,
  `cost_credits` int(11) NOT NULL DEFAULT 1,
  `cost_pixels` int(11) NOT NULL DEFAULT 0,
  `cost_diamonds` int(11) NOT NULL DEFAULT 0,
  `cost_seasonal` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 1,
  `limited_sells` int(11) NOT NULL DEFAULT 0,
  `limited_stack` int(11) NOT NULL DEFAULT 0,
  `offer_active` enum('0','1') NOT NULL DEFAULT '1',
  `extradata` varchar(255) NOT NULL DEFAULT '',
  `badge_id` varchar(10) DEFAULT '',
  `vip` enum('0','1') NOT NULL DEFAULT '0',
  `achievement` int(10) unsigned NOT NULL DEFAULT 0,
  `song_id` int(10) unsigned NOT NULL DEFAULT 0,
  `flat_id` int(11) NOT NULL DEFAULT -1,
  `cost_tokens` int(11) NOT NULL DEFAULT 0,
  `order_num` int(11) NOT NULL DEFAULT 0,
  `extra_points` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `item_ids` (`item_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1100007277 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_items` WRITE;
/*!40000 ALTER TABLE `catalog_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 2,
  `caption` varchar(100) NOT NULL,
  `icon_image` int(11) NOT NULL DEFAULT 1,
  `visible` enum('0','1') NOT NULL DEFAULT '1',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `min_rank` int(10) unsigned NOT NULL DEFAULT 1,
  `order_num` int(11) NOT NULL,
  `page_layout` varchar(35) NOT NULL DEFAULT 'default_3x3',
  `club_only` enum('0','1') NOT NULL DEFAULT '1',
  `page_images` text DEFAULT NULL,
  `page_texts` text DEFAULT NULL,
  `min_sub` int(11) NOT NULL DEFAULT 0,
  `vip_only` enum('1','0') NOT NULL DEFAULT '0',
  `link` varchar(100) DEFAULT '',
  `extra_data` varchar(50) DEFAULT NULL,
  `type` enum('RECENT_PURCHASES','DEFAULT','BUNDLE') DEFAULT 'DEFAULT',
  `page_headline` text DEFAULT 'catalog',
  `page_teaser` text DEFAULT NULL,
  `page_special` text DEFAULT NULL,
  `page_text_1` text DEFAULT NULL,
  `page_text_2` text DEFAULT NULL,
  `page_text_details` text DEFAULT NULL,
  `page_text_teaser` text DEFAULT NULL,
  `caption_br` varchar(100) NOT NULL DEFAULT 'BRAZIL',
  `temporary_icon_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `order_num` (`order_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_pages` WRITE;
/*!40000 ALTER TABLE `catalog_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `catalog_target_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_target_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_code` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(2048) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `end_timestamp` int(11) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 10,
  `points` int(11) NOT NULL DEFAULT 10,
  `points_type` int(11) NOT NULL DEFAULT 5,
  `purchase_limit` int(11) NOT NULL DEFAULT 5,
  `catalog_item` int(11) NOT NULL,
  `vars` varchar(1024) NOT NULL DEFAULT '' COMMENT 'List of strings seperated by a ;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `catalog_target_offers` WRITE;
/*!40000 ALTER TABLE `catalog_target_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_target_offers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `command_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `command_notifications` (
  `name` varchar(200) NOT NULL COMMENT 'The command for the player to type in (it does not override normal system commands)',
  `text` varchar(512) NOT NULL COMMENT 'The notification that will be displayed to the user.',
  `type` enum('global','local','room') NOT NULL DEFAULT 'local' COMMENT 'The type of notification this will show, global = to all players, local = to the single player, room = to the room the executor is in.',
  `min_rank` int(11) NOT NULL DEFAULT 1 COMMENT 'The minimum rank that the user must be to execute this command.',
  `cooldown` int(11) DEFAULT 10 COMMENT 'The length of time until the player can execute this command again.',
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `command_notifications` WRITE;
/*!40000 ALTER TABLE `command_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_notifications` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `emojis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emojis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min_rank` int(11) DEFAULT 1,
  `strings` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `emojis` WRITE;
/*!40000 ALTER TABLE `emojis` DISABLE KEYS */;
/*!40000 ALTER TABLE `emojis` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `filter_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_prefix` (
  `value` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `filter_prefix` WRITE;
/*!40000 ALTER TABLE `filter_prefix` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_prefix` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `public_name` varchar(100) NOT NULL,
  `type` enum('s','i','e','h','v','r','') DEFAULT 's',
  `width` int(11) NOT NULL DEFAULT 1,
  `length` int(11) NOT NULL DEFAULT 1,
  `stack_height` varchar(255) NOT NULL DEFAULT '1',
  `can_stack` enum('0','1') NOT NULL DEFAULT '1',
  `can_sit` enum('0','1') NOT NULL DEFAULT '0',
  `can_lay` enum('0','1') NOT NULL DEFAULT '0',
  `is_walkable` enum('0','1') NOT NULL DEFAULT '0',
  `sprite_id` int(11) NOT NULL DEFAULT 0,
  `allow_recycle` enum('0','1') NOT NULL DEFAULT '1',
  `allow_trade` enum('0','1') NOT NULL DEFAULT '1',
  `allow_marketplace_sell` enum('0','1') NOT NULL DEFAULT '0',
  `allow_gift` enum('0','1') NOT NULL DEFAULT '1',
  `allow_inventory_stack` enum('0','1') NOT NULL DEFAULT '1',
  `interaction_type` varchar(50) NOT NULL DEFAULT 'default',
  `interaction_modes_count` int(11) NOT NULL DEFAULT 1,
  `vending_ids` varchar(100) NOT NULL DEFAULT '0',
  `effect_id` int(11) NOT NULL DEFAULT 0,
  `is_arrow` enum('0','1') NOT NULL DEFAULT '0',
  `foot_figure` enum('0','1') NOT NULL DEFAULT '0',
  `stack_multiplier` enum('0','1') NOT NULL DEFAULT '0',
  `subscriber` enum('0','1') NOT NULL DEFAULT '0',
  `variable_heights` varchar(100) NOT NULL DEFAULT '0',
  `flat_id` int(11) NOT NULL DEFAULT -1,
  `revision` int(11) NOT NULL DEFAULT 45554,
  `description` varchar(255) NOT NULL DEFAULT '',
  `specialtype` int(11) NOT NULL DEFAULT 1,
  `canlayon` enum('1','0') NOT NULL DEFAULT '0',
  `requires_rights` enum('1','0') DEFAULT '1',
  `song_id` int(11) NOT NULL DEFAULT 0,
  `colors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colors`)),
  `deleteable` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3509 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `furniture` WRITE;
/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
INSERT INTO `furniture` VALUES
(3508,'fball_ball','Bola Rebug Nitro','s',1,1,'0','1','0','0','1',3508,'1','1','0','1','1','ball',1,'0',0,'0','0','0','0','0',18006,45554,'Bola para testar prioridade e disputa no Nitro Futebol.',1,'0','0',0,NULL,1);
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `furniture_crafting_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture_crafting_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  `machineBaseId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `furniture_crafting_items` WRITE;
/*!40000 ALTER TABLE `furniture_crafting_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `furniture_crafting_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `furniture_crafting_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture_crafting_recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `items` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `result_limit` int(11) NOT NULL,
  `result_crafted` int(11) NOT NULL,
  `machineBaseId` int(11) NOT NULL DEFAULT 1,
  `badge` varchar(255) NOT NULL,
  `achievement` varchar(255) NOT NULL,
  `mode` enum('public','secret') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `furniture_crafting_recipes` WRITE;
/*!40000 ALTER TABLE `furniture_crafting_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `furniture_crafting_recipes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `furniture_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture_music` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(64) NOT NULL,
  `artist` varchar(32) NOT NULL,
  `song_data` text NOT NULL,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `furniture_music` WRITE;
/*!40000 ALTER TABLE `furniture_music` DISABLE KEYS */;
INSERT INTO `furniture_music` VALUES
(1,'firenavy','fire in envy','MC Minor by VG','1:4589,189',189),
(2,'favela dance','favela dance','MC John','2:7337,184',184);
/*!40000 ALTER TABLE `furniture_music` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `gamecenter_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamecenter_list` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(25) NOT NULL DEFAULT '',
  `roomId` int(11) NOT NULL,
  `path` varchar(125) NOT NULL,
  `visible` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gamecenter_list` WRITE;
/*!40000 ALTER TABLE `gamecenter_list` DISABLE KEYS */;
INSERT INTO `gamecenter_list` VALUES
(1,'basejump',1,'','0'),
(2,'snowwar',2,'','0'),
(3,'tntrun',15,'','0'),
(4,'thebomb',19,'','0'),
(5,'floorislava',16,'','0'),
(6,'battleball',1,'','0');
/*!40000 ALTER TABLE `gamecenter_list` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `group_forum_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_forum_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('THREAD','REPLY') DEFAULT 'THREAD',
  `thread_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT '',
  `message` varchar(4000) NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL,
  `author_timestamp` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `locked` enum('1','0') DEFAULT '0',
  `pinned` enum('1','0') DEFAULT '0',
  `moderator_id` int(11) NOT NULL DEFAULT 0,
  `moderator_username` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `thread_id` (`thread_id`),
  KEY `author_id` (`author_id`),
  KEY `type_group_id` (`type`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_forum_messages` WRITE;
/*!40000 ALTER TABLE `group_forum_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_forum_messages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `group_forum_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_forum_settings` (
  `group_id` int(11) NOT NULL DEFAULT 0,
  `read_permission` enum('EVERYBODY','MEMBERS','ADMINISTRATORS') NOT NULL DEFAULT 'EVERYBODY',
  `post_permission` enum('EVERYBODY','MEMBERS','ADMINISTRATORS','OWNER') NOT NULL DEFAULT 'EVERYBODY',
  `thread_permission` enum('EVERYBODY','MEMBERS','ADMINISTRATORS','OWNER') NOT NULL DEFAULT 'EVERYBODY',
  `moderate_permission` enum('ADMINISTRATORS','OWNER') NOT NULL DEFAULT 'ADMINISTRATORS',
  PRIMARY KEY (`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_forum_settings` WRITE;
/*!40000 ALTER TABLE `group_forum_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_forum_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `group_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_items` (
  `id` int(11) NOT NULL,
  `firstvalue` varchar(300) NOT NULL,
  `secondvalue` varchar(300) NOT NULL,
  `type` varchar(50) NOT NULL,
  `enabled` enum('1','0') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_items` WRITE;
/*!40000 ALTER TABLE `group_items` DISABLE KEYS */;
INSERT INTO `group_items` VALUES
(1,'ffd601','','color','1'),
(1,'ffffff','','color2','1'),
(1,'ffffff','','color3','1'),
(2,'ec7600','','color','1'),
(2,'ebebeb','','color2','1'),
(2,'e5e5e5','','color3','1'),
(3,'84de00','','color','1'),
(3,'d4d4d4','','color2','1'),
(3,'bfbfbf','','color3','1'),
(4,'589a00','','color','1'),
(4,'bdbdbd','','color2','1'),
(4,'999999','','color3','1'),
(5,'50c1fb','','color','1'),
(5,'a6a6a6','','color2','1'),
(5,'737373','','color3','1'),
(6,'006fcf','','color','1'),
(6,'8f8f8f','','color2','1'),
(6,'4c4c4c','','color3','1'),
(7,'ff98e3','','color','1'),
(7,'787878','','color2','1'),
(7,'589a00','','color3','1'),
(8,'f334bf','','color','1'),
(8,'616161','','color2','1'),
(8,'4f8a00','','color3','1'),
(9,'ff2d2d','','color','1'),
(9,'4c4c4c','','color2','1'),
(9,'427300','','color3','1'),
(10,'af0a0a','','color','1'),
(10,'589a00','','color2','1'),
(10,'355c00','','color3','1'),
(11,'ffffff','','color','1'),
(11,'518e00','','color2','1'),
(11,'284500','','color3','1'),
(12,'c0c0c0','','color','1'),
(12,'498000','','color2','1'),
(12,'1a2e00','','color3','1'),
(13,'373737','','color','1'),
(13,'417200','','color2','1'),
(13,'84de00','','color3','1'),
(14,'fbe7ac','','color','1'),
(14,'396400','','color2','1'),
(14,'77c700','','color3','1'),
(15,'977641','','color','1'),
(15,'315600','','color2','1'),
(15,'63a600','','color3','1'),
(16,'c2eaff','','color','1'),
(16,'294800','','color2','1'),
(16,'4f8500','','color3','1'),
(17,'fff165','','color','1'),
(17,'213b00','','color2','1'),
(17,'3c6400','','color3','1'),
(18,'aaff7d','','color','1'),
(18,'1a2e00','','color2','1'),
(18,'274200','','color3','1'),
(19,'87e6c8','','color','1'),
(19,'84de00','','color2','1'),
(19,'c2eaff','','color3','1'),
(20,'9844e7','','color','1'),
(20,'7acd00','','color2','1'),
(20,'aed2e5','','color3','1'),
(21,'dea9ff','','color','1'),
(21,'6eb900','','color2','1'),
(21,'91afbf','','color3','1'),
(22,'ffb579','','color','1'),
(22,'62a500','','color2','1'),
(22,'748c99','','color3','1'),
(23,'c3aa6e','','color','1'),
(23,'569100','','color2','1'),
(23,'576a73','','color3','1'),
(24,'7a7a7a','','color','1'),
(24,'4a7c00','','color2','1'),
(24,'3a464c','','color3','1'),
(25,'3e6800','','color2','1'),
(25,'50c1fb','','color3','1'),
(26,'325400','','color2','1'),
(26,'48ade1','','color3','1'),
(27,'274200','','color2','1'),
(27,'3c91bc','','color3','1'),
(28,'c2eaff','','color2','1'),
(28,'307497','','color3','1'),
(29,'b3d8eb','','color2','1'),
(29,'245771','','color3','1'),
(30,'a1c3d4','','color2','1'),
(30,'183a4b','','color3','1'),
(31,'90adbd','','color2','1'),
(31,'006fcf','','color3','1'),
(32,'7e98a6','','color2','1'),
(32,'0064ba','','color3','1'),
(33,'6d838f','','color2','1'),
(33,'00539b','','color3','1'),
(34,'5b6e78','','color2','1'),
(34,'00437c','','color3','1'),
(35,'4a5961','','color2','1'),
(35,'00325d','','color3','1'),
(36,'3a464c','','color2','1'),
(36,'00213e','','color3','1'),
(37,'50c1fb','','color2','1'),
(37,'9844e7','','color3','1'),
(38,'4ab2e7','','color2','1'),
(38,'893dcf','','color3','1'),
(39,'43a0d1','','color2','1'),
(39,'7233ad','','color3','1'),
(40,'3b8fba','','color2','1'),
(40,'5b298b','','color3','1'),
(41,'347ea3','','color2','1'),
(41,'451f68','','color3','1'),
(42,'2d6c8d','','color2','1'),
(42,'2d1445','','color3','1'),
(43,'265b76','','color2','1'),
(43,'dea9ff','','color3','1'),
(44,'1e495f','','color2','1'),
(44,'c798e5','','color3','1'),
(45,'183a4b','','color2','1'),
(45,'a67fbf','','color3','1'),
(46,'006fcf','','color2','1'),
(46,'856599','','color3','1'),
(47,'0066bf','','color2','1'),
(47,'644c73','','color3','1'),
(48,'005cac','','color2','1'),
(48,'42324c','','color3','1'),
(49,'005299','','color2','1'),
(49,'ff98e3','','color3','1'),
(50,'004887','','color2','1'),
(50,'e589cc','','color3','1'),
(51,'003e74','','color2','1'),
(51,'bf72aa','','color3','1'),
(52,'003461','','color2','1'),
(52,'995b88','','color3','1'),
(53,'002a4f','','color2','1'),
(53,'734566','','color3','1'),
(54,'00213e','','color2','1'),
(54,'4c2d44','','color3','1'),
(55,'9844e7','','color2','1'),
(55,'f334bf','','color3','1'),
(56,'8c3fd5','','color2','1'),
(56,'da2fac','','color3','1'),
(57,'7e39c0','','color2','1'),
(57,'b6278f','','color3','1'),
(58,'7132ab','','color2','1'),
(58,'921f73','','color3','1'),
(59,'632c96','','color2','1'),
(59,'6e1756','','color3','1'),
(60,'552682','','color2','1'),
(60,'480f39','','color3','1'),
(61,'48206d','','color2','1'),
(61,'ff2d2d','','color3','1'),
(62,'3a1a58','','color2','1'),
(62,'e52828','','color3','1'),
(63,'2d1445','','color2','1'),
(63,'bf2222','','color3','1'),
(64,'dea9ff','','color2','1'),
(64,'991b1b','','color3','1'),
(65,'cd9ceb','','color2','1'),
(65,'731414','','color3','1'),
(66,'b98dd4','','color2','1'),
(66,'4c0d0d','','color3','1'),
(67,'a57dbd','','color2','1'),
(67,'ffb579','','color3','1'),
(68,'916ea6','','color2','1'),
(68,'e5a36d','','color3','1'),
(69,'7c5f8f','','color2','1'),
(69,'bf885b','','color3','1'),
(70,'685078','','color2','1'),
(70,'996d49','','color3','1'),
(71,'544061','','color2','1'),
(71,'735237','','color3','1'),
(72,'42324c','','color2','1'),
(72,'4c3624','','color3','1'),
(73,'ff98e3','','color2','1'),
(73,'ec7600','','color3','1'),
(74,'eb8cd1','','color2','1'),
(74,'d46a00','','color3','1'),
(75,'d47ebd','','color2','1'),
(75,'b15800','','color3','1'),
(76,'bd71a8','','color2','1'),
(76,'8e4700','','color3','1'),
(77,'a66394','','color2','1'),
(77,'6a3500','','color3','1'),
(78,'8f557f','','color2','1'),
(78,'462300','','color3','1'),
(79,'78486b','','color2','1'),
(79,'ffd601','','color3','1'),
(80,'613a56','','color2','1'),
(80,'e5c001','','color3','1'),
(81,'4c2d44','','color2','1'),
(81,'bfa001','','color3','1'),
(82,'f334bf','','color2','1'),
(82,'998001','','color3','1'),
(83,'e030b0','','color2','1'),
(83,'736100','','color3','1'),
(84,'ca2b9f','','color2','1'),
(84,'4c4000','','color3','1'),
(85,'b4278e','','color2','1'),
(85,'c3aa6e','','color3','1'),
(86,'9e227c','','color2','1'),
(86,'af9963','','color3','1'),
(87,'881d6b','','color2','1'),
(87,'927f52','','color3','1'),
(88,'72185a','','color2','1'),
(88,'756642','','color3','1'),
(89,'5c1449','','color2','1'),
(89,'584d32','','color3','1'),
(90,'480f39','','color2','1'),
(90,'3a3321','','color3','1'),
(91,'ff2d2d','','color2','1'),
(91,'977641','','color3','1'),
(92,'eb2929','','color2','1'),
(92,'886a3a','','color3','1'),
(93,'d42525','','color2','1'),
(93,'715831','','color3','1'),
(94,'bd2121','','color2','1'),
(94,'5b4727','','color3','1'),
(95,'a61d1d','','color2','1'),
(95,'44351d','','color3','1'),
(96,'8f1919','','color2','1'),
(96,'2d2313','','color3','1'),
(97,'781515','','color2','1'),
(97,'c0c0c0','','color3','1'),
(98,'611111','','color2','1'),
(98,'acacac','','color3','1'),
(99,'4c0d0d','','color2','1'),
(99,'909090','','color3','1'),
(100,'ffb579','','color2','1'),
(100,'737373','','color3','1'),
(101,'eba770','','color2','1'),
(101,'575757','','color3','1'),
(102,'d49665','','color2','1'),
(102,'393939','','color3','1'),
(103,'bd865a','','color2','1'),
(103,'7a7a7a','','color3','1'),
(104,'a6764f','','color2','1'),
(104,'6e6e6e','','color3','1'),
(105,'8f6644','','color2','1'),
(105,'5b5b5b','','color3','1'),
(106,'785539','','color2','1'),
(106,'494949','','color3','1'),
(107,'61452e','','color2','1'),
(107,'373737','','color3','1'),
(108,'4c3624','','color2','1'),
(108,'242424','','color3','1'),
(109,'ec7600','','color2','1'),
(110,'d96d00','','color2','1'),
(111,'c46200','','color2','1'),
(112,'af5700','','color2','1'),
(113,'9a4d00','','color2','1'),
(114,'844200','','color2','1'),
(115,'6f3800','','color2','1'),
(116,'5a2d00','','color2','1'),
(117,'462300','','color2','1'),
(118,'ffd601','','color2','1'),
(119,'ebc501','','color2','1'),
(120,'d4b201','','color2','1'),
(121,'bd9f01','','color2','1'),
(122,'a68b01','','color2','1'),
(123,'8f7801','','color2','1'),
(124,'786500','','color2','1'),
(125,'615100','','color2','1'),
(126,'4c4000','','color2','1'),
(127,'c3aa6e','','color2','1'),
(128,'b49d65','','color2','1'),
(129,'a28d5b','','color2','1'),
(130,'917e52','','color2','1'),
(131,'7f6f48','','color2','1'),
(132,'6d5f3e','','color2','1'),
(133,'5c5034','','color2','1'),
(134,'4a412a','','color2','1'),
(135,'3a3321','','color2','1'),
(136,'977641','','color2','1'),
(137,'8b6d3c','','color2','1'),
(138,'7e6236','','color2','1'),
(139,'705730','','color2','1'),
(140,'624d2a','','color2','1'),
(141,'554224','','color2','1'),
(142,'47381f','','color2','1'),
(143,'392d19','','color2','1'),
(144,'2d2313','','color2','1'),
(145,'c0c0c0','','color2','1'),
(146,'b1b1b1','','color2','1'),
(147,'a0a0a0','','color2','1'),
(148,'8e8e8e','','color2','1'),
(149,'7d7d7d','','color2','1'),
(150,'6c6c6c','','color2','1'),
(151,'5a5a5a','','color2','1'),
(152,'494949','','color2','1'),
(153,'393939','','color2','1'),
(154,'7a7a7a','','color2','1'),
(155,'707070','','color2','1'),
(156,'656565','','color2','1'),
(157,'5a5a5a','','color2','1'),
(158,'4f4f4f','','color2','1'),
(159,'444444','','color2','1'),
(160,'393939','','color2','1'),
(161,'2e2e2e','','color2','1'),
(162,'242424','','color2','1'),
(1,'base_basic_1.gif','','base','1'),
(1,'symbol_background_1.gif','','symbol','1'),
(1,'ffd601','','color','1'),
(1,'ffffff','','color2','1'),
(1,'ffffff','','color3','1'),
(2,'base_basic_2.gif','','base','1'),
(2,'symbol_background_2.gif','','symbol','1'),
(2,'ec7600','','color','1'),
(2,'ebebeb','','color2','1'),
(2,'e5e5e5','','color3','1'),
(3,'base_basic_3.gif','','base','1'),
(3,'symbol_background_3_part2.gif','symbol_background_3_part1.gif','symbol','1'),
(3,'84de00','','color','1'),
(3,'d4d4d4','','color2','1'),
(3,'bfbfbf','','color3','1'),
(4,'base_basic_4.gif','','base','1'),
(4,'symbol_ball_1_part2.gif','symbol_ball_1_part1.gif','symbol','1'),
(4,'589a00','','color','1'),
(4,'bdbdbd','','color2','1'),
(4,'999999','','color3','1'),
(5,'base_basic_5.gif','','base','1'),
(5,'symbol_ball_2_part2.gif','symbol_ball_2_part1.gif','symbol','1'),
(5,'50c1fb','','color','1'),
(5,'a6a6a6','','color2','1'),
(5,'737373','','color3','1'),
(6,'base_advanced_1.gif','','base','1'),
(6,'symbol_bobba.gif','','symbol','1'),
(6,'006fcf','','color','1'),
(6,'8f8f8f','','color2','1'),
(6,'4c4c4c','','color3','1'),
(7,'base_advanced_2.gif','','base','1'),
(7,'symbol_bomb_part2.gif','symbol_bomb_part1.gif','symbol','1'),
(7,'ff98e3','','color','1'),
(7,'787878','','color2','1'),
(7,'589a00','','color3','1'),
(8,'base_advanced_3.gif','','base','1'),
(8,'symbol_bow.gif','','symbol','1'),
(8,'f334bf','','color','1'),
(8,'616161','','color2','1'),
(8,'4f8a00','','color3','1'),
(9,'base_advanced_4.gif','','base','1'),
(9,'symbol_box_1.gif','','symbol','1'),
(9,'ff2d2d','','color','1'),
(9,'4c4c4c','','color2','1'),
(9,'427300','','color3','1'),
(10,'base_gold_1_part2.gif','base_gold_1_part1.gif','base','1'),
(10,'symbol_box_2.gif','','symbol','1'),
(10,'af0a0a','','color','1'),
(10,'589a00','','color2','1'),
(10,'355c00','','color3','1'),
(11,'base_gold_2_part2.gif','base_gold_2_part1.gif','base','1'),
(11,'symbol_bunting_1.gif','','symbol','1'),
(11,'ffffff','','color','1'),
(11,'518e00','','color2','1'),
(11,'284500','','color3','1'),
(12,'base_pin_part2.gif','base_pin_part1.gif','base','1'),
(12,'symbol_bunting_2.gif','','symbol','1'),
(12,'c0c0c0','','color','1'),
(12,'498000','','color2','1'),
(12,'1a2e00','','color3','1'),
(13,'base_gradient_1.gif','','base','1'),
(13,'symbol_butterfly_part2.gif','symbol_butterfly_part1.gif','symbol','1'),
(13,'373737','','color','1'),
(13,'417200','','color2','1'),
(13,'84de00','','color3','1'),
(14,'base_gradient_2.gif','','base','1'),
(14,'symbol_cowskull_part2.gif','symbol_cowskull_part1.gif','symbol','1'),
(14,'fbe7ac','','color','1'),
(14,'396400','','color2','1'),
(14,'77c700','','color3','1'),
(15,'base_circles_1.gif','','base','1'),
(15,'symbol_cross.gif','','symbol','1'),
(15,'977641','','color','1'),
(15,'315600','','color2','1'),
(15,'63a600','','color3','1'),
(16,'base_circles_2.gif','','base','1'),
(16,'symbol_diamond.gif','','symbol','1'),
(16,'c2eaff','','color','1'),
(16,'294800','','color2','1'),
(16,'4f8500','','color3','1'),
(17,'base_ornament_1_part2.gif','base_ornament_1_part1.gif','base','1'),
(17,'symbol_diploma_part2.gif','symbol_diploma_part1.gif','symbol','1'),
(17,'fff165','','color','1'),
(17,'213b00','','color2','1'),
(17,'3c6400','','color3','1'),
(18,'base_ornament_2_part2.gif','base_ornament_2_part1.gif','base','1'),
(18,'symbol_eyeball_part2.gif','symbol_eyeball_part1.gif','symbol','1'),
(18,'aaff7d','','color','1'),
(18,'1a2e00','','color2','1'),
(18,'274200','','color3','1'),
(19,'base_misc_1_part2.gif','base_misc_1_part1.gif','base','1'),
(19,'symbol_fist.gif','','symbol','1'),
(19,'87e6c8','','color','1'),
(19,'84de00','','color2','1'),
(19,'c2eaff','','color3','1'),
(20,'base_misc_2.gif','','base','1'),
(20,'symbol_flame_1.gif','','symbol','1'),
(20,'9844e7','','color','1'),
(20,'7acd00','','color2','1'),
(20,'aed2e5','','color3','1'),
(21,'base_beams_part2.gif','base_beams_part1.gif','base','1'),
(21,'symbol_flame_2.gif','','symbol','1'),
(21,'dea9ff','','color','1'),
(21,'6eb900','','color2','1'),
(21,'91afbf','','color3','1'),
(22,'base_ring.gif','','base','1'),
(22,'symbol_flash.gif','','symbol','1'),
(22,'ffb579','','color','1'),
(22,'62a500','','color2','1'),
(22,'748c99','','color3','1'),
(23,'base_simplestar_part2.gif','base_simplestar_part1.gif','base','1'),
(23,'symbol_flower_1_part2.gif','symbol_flower_1_part1.gif','symbol','1'),
(23,'c3aa6e','','color','1'),
(23,'569100','','color2','1'),
(23,'576a73','','color3','1'),
(24,'base_spiral.gif','','base','1'),
(24,'symbol_flower_2.gif','','symbol','1'),
(24,'7a7a7a','','color','1'),
(24,'4a7c00','','color2','1'),
(24,'3a464c','','color3','1'),
(25,'base_book.gif','','base','1'),
(25,'symbol_flower_3.gif','','symbol','1'),
(25,'3e6800','','color2','1'),
(25,'50c1fb','','color3','1'),
(26,'base_egg.gif','','base','1'),
(26,'symbol_flower_4.gif','','symbol','1'),
(26,'325400','','color2','1'),
(26,'48ade1','','color3','1'),
(27,'base_ornament.gif','','base','1'),
(27,'symbol_football.gif','','symbol','1'),
(27,'274200','','color2','1'),
(27,'3c91bc','','color3','1'),
(28,'base_shield_part2.gif','base_shield_part1.gif','base','1'),
(28,'symbol_heart_1_part2.gif','symbol_heart_1_part1.gif','symbol','1'),
(28,'c2eaff','','color2','1'),
(28,'307497','','color3','1'),
(29,'symbol_heart_2_part2.gif','symbol_heart_2_part1.gif','symbol','1'),
(29,'b3d8eb','','color2','1'),
(29,'245771','','color3','1'),
(30,'symbol_jingjang_part2.gif','symbol_jingjang_part1.gif','symbol','1'),
(30,'a1c3d4','','color2','1'),
(30,'183a4b','','color3','1'),
(31,'symbol_lips_part2.gif','symbol_lips_part1.gif','symbol','1'),
(31,'90adbd','','color2','1'),
(31,'006fcf','','color3','1'),
(32,'symbol_note.gif','','symbol','1'),
(32,'7e98a6','','color2','1'),
(32,'0064ba','','color3','1'),
(33,'symbol_peace.gif','','symbol','1'),
(33,'6d838f','','color2','1'),
(33,'00539b','','color3','1'),
(34,'symbol_planet_part2.gif','symbol_planet_part1.gif','symbol','1'),
(34,'5b6e78','','color2','1'),
(34,'00437c','','color3','1'),
(35,'symbol_rainbow_part2.gif','symbol_rainbow_part1.gif','symbol','1'),
(35,'4a5961','','color2','1'),
(35,'00325d','','color3','1'),
(36,'symbol_rosete.gif','','symbol','1'),
(36,'3a464c','','color2','1'),
(36,'00213e','','color3','1'),
(37,'symbol_shape.gif','','symbol','1'),
(37,'50c1fb','','color2','1'),
(37,'9844e7','','color3','1'),
(38,'symbol_star_1.gif','','symbol','1'),
(38,'4ab2e7','','color2','1'),
(38,'893dcf','','color3','1'),
(39,'symbol_star_2.gif','','symbol','1'),
(39,'43a0d1','','color2','1'),
(39,'7233ad','','color3','1'),
(40,'symbol_sword_1_part2.gif','symbol_sword_1_part1.gif','symbol','1'),
(40,'3b8fba','','color2','1'),
(40,'5b298b','','color3','1'),
(41,'symbol_sword_2_part2.gif','symbol_sword_2_part1.gif','symbol','1'),
(41,'347ea3','','color2','1'),
(41,'451f68','','color3','1'),
(42,'symbol_sword_3_part2.gif','symbol_sword_3_part1.gif','symbol','1'),
(42,'2d6c8d','','color2','1'),
(42,'2d1445','','color3','1'),
(43,'symbol_wings_1.gif','','symbol','1'),
(43,'265b76','','color2','1'),
(43,'dea9ff','','color3','1'),
(44,'symbol_wings_2.gif','','symbol','1'),
(44,'1e495f','','color2','1'),
(44,'c798e5','','color3','1'),
(45,'symbol_arrow_down.gif','','symbol','1'),
(45,'183a4b','','color2','1'),
(45,'a67fbf','','color3','1'),
(46,'006fcf','','color2','1'),
(46,'856599','','color3','1'),
(47,'symbol_arrow_right.gif','','symbol','1'),
(47,'0066bf','','color2','1'),
(47,'644c73','','color3','1'),
(48,'symbol_arrow_up.gif','','symbol','1'),
(48,'005cac','','color2','1'),
(48,'42324c','','color3','1'),
(49,'symbol_arrowbig_up.gif','','symbol','1'),
(49,'005299','','color2','1'),
(49,'ff98e3','','color3','1'),
(50,'symbol_axe_part2.gif','symbol_axe_part1.gif','symbol','1'),
(50,'004887','','color2','1'),
(50,'e589cc','','color3','1'),
(51,'symbol_bug_part2.gif','symbol_bug_part1.gif','symbol','1'),
(51,'003e74','','color2','1'),
(51,'bf72aa','','color3','1'),
(52,'symbol_capsbig_part2.gif','symbol_capsbig_part1.gif','symbol','1'),
(52,'003461','','color2','1'),
(52,'995b88','','color3','1'),
(53,'symbol_capssmall_part2.gif','symbol_capssmall_part1.gif','symbol','1'),
(53,'002a4f','','color2','1'),
(53,'734566','','color3','1'),
(54,'symbol_cloud.gif','','symbol','1'),
(54,'00213e','','color2','1'),
(54,'4c2d44','','color3','1'),
(55,'symbol_crown_part2.gif','symbol_crown_part1.gif','symbol','1'),
(55,'9844e7','','color2','1'),
(55,'f334bf','','color3','1'),
(56,'symbol_diamsmall2.gif','','symbol','1'),
(56,'8c3fd5','','color2','1'),
(56,'da2fac','','color3','1'),
(57,'symbol_diamsmall.gif','','symbol','1'),
(57,'7e39c0','','color2','1'),
(57,'b6278f','','color3','1'),
(58,'symbol_drop.gif','','symbol','1'),
(58,'7132ab','','color2','1'),
(58,'921f73','','color3','1'),
(59,'symbol_fingersheavy.gif','','symbol','1'),
(59,'632c96','','color2','1'),
(59,'6e1756','','color3','1'),
(60,'symbol_fingersv.gif','','symbol','1'),
(60,'552682','','color2','1'),
(60,'480f39','','color3','1'),
(61,'symbol_gtr_part2.gif','symbol_gtr_part1.gif','symbol','1'),
(61,'48206d','','color2','1'),
(61,'ff2d2d','','color3','1'),
(62,'symbol_hat.gif','','symbol','1'),
(62,'3a1a58','','color2','1'),
(62,'e52828','','color3','1'),
(63,'symbol_oval_part2.gif','symbol_oval_part1.gif','symbol','1'),
(63,'2d1445','','color2','1'),
(63,'bf2222','','color3','1'),
(64,'symbol_pawprint.gif','','symbol','1'),
(64,'dea9ff','','color2','1'),
(64,'991b1b','','color3','1'),
(65,'symbol_screw.gif','','symbol','1'),
(65,'cd9ceb','','color2','1'),
(65,'731414','','color3','1'),
(66,'symbol_stickL_part2.gif','symbol_stickL_part1.gif','symbol','1'),
(66,'b98dd4','','color2','1'),
(66,'4c0d0d','','color3','1'),
(67,'symbol_stickR_part2.gif','symbol_stickR_part1.gif','symbol','1'),
(67,'a57dbd','','color2','1'),
(67,'ffb579','','color3','1'),
(68,'916ea6','','color2','1'),
(68,'e5a36d','','color3','1'),
(69,'symbol_americanfootball_part2.gif','symbol_americanfootball_part1.gif','symbol','1'),
(69,'7c5f8f','','color2','1'),
(69,'bf885b','','color3','1'),
(70,'symbol_award_part2.gif','symbol_award_part1.gif','symbol','1'),
(70,'685078','','color2','1'),
(70,'996d49','','color3','1'),
(71,'symbol_bananapeel.gif','','symbol','1'),
(71,'544061','','color2','1'),
(71,'735237','','color3','1'),
(72,'symbol_battleball.gif','','symbol','1'),
(72,'42324c','','color2','1'),
(72,'4c3624','','color3','1'),
(73,'symbol_biohazard.gif','','symbol','1'),
(73,'ff98e3','','color2','1'),
(73,'ec7600','','color3','1'),
(74,'symbol_bird.gif','','symbol','1'),
(74,'eb8cd1','','color2','1'),
(74,'d46a00','','color3','1'),
(75,'symbol_bishop.gif','','symbol','1'),
(75,'d47ebd','','color2','1'),
(75,'b15800','','color3','1'),
(76,'symbol_coalion.gif','','symbol','1'),
(76,'bd71a8','','color2','1'),
(76,'8e4700','','color3','1'),
(77,'symbol_cocoamug.gif','','symbol','1'),
(77,'a66394','','color2','1'),
(77,'6a3500','','color3','1'),
(78,'symbol_dashflag.gif','','symbol','1'),
(78,'8f557f','','color2','1'),
(78,'462300','','color3','1'),
(79,'symbol_diamondring_part2.gif','symbol_diamondring_part1.gif','symbol','1'),
(79,'78486b','','color2','1'),
(79,'ffd601','','color3','1'),
(80,'symbol_discoball_part2.gif','symbol_discoball_part1.gif','symbol','1'),
(80,'613a56','','color2','1'),
(80,'e5c001','','color3','1'),
(81,'symbol_dog.gif','','symbol','1'),
(81,'4c2d44','','color2','1'),
(81,'bfa001','','color3','1'),
(82,'symbol_electricguitarh_part2.gif','symbol_electricguitarh_part1.gif','symbol','1'),
(82,'f334bf','','color2','1'),
(82,'998001','','color3','1'),
(83,'symbol_electricguitarv_part2.gif','symbol_electricguitarv_part1.gif','symbol','1'),
(83,'e030b0','','color2','1'),
(83,'736100','','color3','1'),
(84,'symbol_film.gif','','symbol','1'),
(84,'ca2b9f','','color2','1'),
(84,'4c4000','','color3','1'),
(85,'symbol_flame_part2.gif','symbol_flame_part1.gif','symbol','1'),
(85,'b4278e','','color2','1'),
(85,'c3aa6e','','color3','1'),
(86,'symbol_gamepad.gif','','symbol','1'),
(86,'9e227c','','color2','1'),
(86,'af9963','','color3','1'),
(87,'symbol_gem1_part2.gif','symbol_gem1_part1.gif','symbol','1'),
(87,'881d6b','','color2','1'),
(87,'927f52','','color3','1'),
(88,'symbol_gem2_part2.gif','symbol_gem2_part1.gif','symbol','1'),
(88,'72185a','','color2','1'),
(88,'756642','','color3','1'),
(89,'symbol_gem3_part2.gif','symbol_gem3_part1.gif','symbol','1'),
(89,'5c1449','','color2','1'),
(89,'584d32','','color3','1'),
(90,'symbol_hawk.gif','','symbol','1'),
(90,'480f39','','color2','1'),
(90,'3a3321','','color3','1'),
(91,'symbol_hearts_down.gif','','symbol','1'),
(91,'ff2d2d','','color2','1'),
(91,'977641','','color3','1'),
(92,'symbol_hearts_up.gif','','symbol','1'),
(92,'eb2929','','color2','1'),
(92,'886a3a','','color3','1'),
(93,'symbol_horseshoe.gif','','symbol','1'),
(93,'d42525','','color2','1'),
(93,'715831','','color3','1'),
(94,'symbol_inksplatter.gif','','symbol','1'),
(94,'bd2121','','color2','1'),
(94,'5b4727','','color3','1'),
(95,'symbol_leaf.gif','','symbol','1'),
(95,'a61d1d','','color2','1'),
(95,'44351d','','color3','1'),
(96,'symbol_micstand.gif','','symbol','1'),
(96,'8f1919','','color2','1'),
(96,'2d2313','','color3','1'),
(97,'symbol_mirror_part2.gif','symbol_mirror_part1.gif','symbol','1'),
(97,'781515','','color2','1'),
(97,'c0c0c0','','color3','1'),
(98,'symbol_monkeywrench.gif','','symbol','1'),
(98,'611111','','color2','1'),
(98,'acacac','','color3','1'),
(99,'symbol_note1.gif','','symbol','1'),
(99,'4c0d0d','','color2','1'),
(99,'909090','','color3','1'),
(100,'ffb579','','color2','1'),
(100,'737373','','color3','1'),
(101,'eba770','','color2','1'),
(101,'575757','','color3','1'),
(102,'d49665','','color2','1'),
(102,'393939','','color3','1'),
(103,'bd865a','','color2','1'),
(103,'7a7a7a','','color3','1'),
(104,'a6764f','','color2','1'),
(104,'6e6e6e','','color3','1'),
(105,'8f6644','','color2','1'),
(105,'5b5b5b','','color3','1'),
(106,'785539','','color2','1'),
(106,'494949','','color3','1'),
(107,'61452e','','color2','1'),
(107,'373737','','color3','1'),
(108,'4c3624','','color2','1'),
(108,'242424','','color3','1'),
(109,'ec7600','','color2','1'),
(110,'d96d00','','color2','1'),
(111,'c46200','','color2','1'),
(112,'af5700','','color2','1'),
(113,'9a4d00','','color2','1'),
(114,'844200','','color2','1'),
(115,'6f3800','','color2','1'),
(116,'5a2d00','','color2','1'),
(117,'462300','','color2','1'),
(118,'ffd601','','color2','1'),
(119,'ebc501','','color2','1'),
(120,'d4b201','','color2','1'),
(121,'bd9f01','','color2','1'),
(122,'a68b01','','color2','1'),
(123,'8f7801','','color2','1'),
(124,'786500','','color2','1'),
(125,'615100','','color2','1'),
(126,'4c4000','','color2','1'),
(127,'c3aa6e','','color2','1'),
(128,'b49d65','','color2','1'),
(129,'a28d5b','','color2','1'),
(130,'917e52','','color2','1'),
(131,'7f6f48','','color2','1'),
(132,'6d5f3e','','color2','1'),
(133,'5c5034','','color2','1'),
(134,'4a412a','','color2','1'),
(135,'3a3321','','color2','1'),
(136,'977641','','color2','1'),
(137,'8b6d3c','','color2','1'),
(138,'7e6236','','color2','1'),
(139,'705730','','color2','1'),
(140,'624d2a','','color2','1'),
(141,'554224','','color2','1'),
(142,'47381f','','color2','1'),
(143,'392d19','','color2','1'),
(144,'2d2313','','color2','1'),
(145,'c0c0c0','','color2','1'),
(146,'b1b1b1','','color2','1'),
(147,'a0a0a0','','color2','1'),
(148,'8e8e8e','','color2','1'),
(149,'7d7d7d','','color2','1'),
(150,'6c6c6c','','color2','1'),
(151,'5a5a5a','','color2','1'),
(152,'494949','','color2','1'),
(153,'393939','','color2','1'),
(154,'7a7a7a','','color2','1'),
(155,'707070','','color2','1'),
(156,'656565','','color2','1'),
(157,'symbol_pencil_part2.gif','symbol_pencil_part1.gif','symbol','0'),
(157,'5a5a5a','','color2','1'),
(158,'4f4f4f','','color2','1'),
(159,'444444','','color2','1'),
(160,'symbol_rook.gif','','symbol','0'),
(160,'393939','','color2','1'),
(161,'symbol_skate.gif','','symbol','0'),
(161,'2e2e2e','','color2','1'),
(162,'symbol_smallring_part2.gif','symbol_smallring_part1.gif','symbol','0'),
(162,'242424','','color2','1'),
(163,'symbol_snowstorm_part2.gif','symbol_snowstorm_part1.gif','symbol','0'),
(164,'symbol_sphere.gif','','symbol','0'),
(165,'symbol_spraycan_part2.gif','symbol_spraycan_part1.gif','symbol','0'),
(166,'symbol_stars1.gif','','symbol','0'),
(167,'symbol_stars2.gif','','symbol','0'),
(168,'symbol_stars3.gif','','symbol','0'),
(169,'symbol_stars4.gif','','symbol','0'),
(170,'symbol_stars5.gif','','symbol','0'),
(171,'symbol_waterdrop_part2.gif','symbol_waterdrop_part1.gif','symbol','0'),
(172,'symbol_wolverine.gif','','symbol','0'),
(173,'symbol_0.gif','','symbol','0'),
(174,'symbol_1.gif','','symbol','0'),
(175,'symbol_2.gif','','symbol','0'),
(176,'symbol_3.gif','','symbol','0'),
(177,'symbol_4.gif','','symbol','0'),
(178,'symbol_5.gif','','symbol','0'),
(179,'symbol_6.gif','','symbol','0'),
(180,'symbol_7.gif','','symbol','0'),
(181,'symbol_8.gif','','symbol','0'),
(182,'symbol_9.gif','','symbol','0'),
(183,'symbol_a.gif','','symbol','0'),
(184,'symbol_b.gif','','symbol','0'),
(185,'symbol_c.gif','','symbol','0'),
(186,'symbol_d.gif','','symbol','0'),
(187,'symbol_e.gif','','symbol','0'),
(188,'symbol_f.gif','','symbol','0'),
(189,'symbol_g.gif','','symbol','0'),
(190,'symbol_h.gif','','symbol','0'),
(191,'symbol_i.gif','','symbol','0'),
(192,'symbol_j.gif','','symbol','0'),
(193,'symbol_k.gif','','symbol','0'),
(194,'symbol_l.gif','','symbol','0'),
(195,'symbol_m.gif','','symbol','0'),
(196,'symbol_n.gif','','symbol','0'),
(197,'symbol_o.gif','','symbol','0'),
(198,'symbol_p.gif','','symbol','0'),
(199,'symbol_q.gif','','symbol','0'),
(200,'symbol_r.gif','','symbol','0'),
(201,'symbol_s.gif','','symbol','0'),
(202,'symbol_t.gif','','symbol','0'),
(203,'symbol_u.gif','','symbol','0'),
(204,'symbol_v.gif','','symbol','0'),
(205,'symbol_w.gif','','symbol','0'),
(206,'symbol_x.gif','','symbol','0'),
(207,'symbol_y.gif','','symbol','0'),
(208,'symbol_z.gif','','symbol','0'),
(209,'symbol_pixel_part2.gif','symbol_pixel_part1.gif','symbol','0'),
(210,'symbol_credit_part2.gif','symbol_credit_part1.gif','symbol','0'),
(211,'symbol_hc_part2.gif','symbol_hc_part1.gif','symbol','0'),
(212,'symbol_vip_part2.gif','symbol_vip_part1.gif','symbol','0'),
(339,'symbol_nursecross.gif','','symbol','0'),
(353,'symbol_note2.gif','','symbol','0'),
(376,'symbol_rock.gif','','symbol','0'),
(382,'symbol_queen.gif','','symbol','0'),
(8250,'symbol_note3.gif','','symbol','0');
/*!40000 ALTER TABLE `group_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `group_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_memberships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `access_level` enum('owner','admin','member') NOT NULL DEFAULT 'member',
  `date_joined` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `groupid` (`group_id`),
  KEY `userid` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_memberships` WRITE;
/*!40000 ALTER TABLE `group_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_memberships` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `group_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_requests` (
  `group_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  KEY `groupid` (`group_id`),
  KEY `userid` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_requests` WRITE;
/*!40000 ALTER TABLE `group_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `badge` varchar(50) NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL,
  `type` enum('regular','exclusive','private') NOT NULL DEFAULT 'regular',
  `colour1` int(11) NOT NULL DEFAULT 242424,
  `colour2` int(11) NOT NULL DEFAULT 242424,
  `members_deco` enum('0','1') DEFAULT '0',
  `has_forum` enum('0','1') DEFAULT '0',
  `notification` int(11) DEFAULT 0,
  `speci_key` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `help_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_question_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `help_question_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `help_question_categories` WRITE;
/*!40000 ALTER TABLE `help_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_question_categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `help_question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_question_category` (
  `help_question_id` bigint(20) unsigned NOT NULL,
  `help_question_category_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `help_question_category` WRITE;
/*!40000 ALTER TABLE `help_question_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_question_category` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `help_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `help_questions_slug_index` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `help_questions` WRITE;
/*!40000 ALTER TABLE `help_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_questions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(10) unsigned NOT NULL DEFAULT 0,
  `base_item` int(10) unsigned NOT NULL,
  `extra_data` text NOT NULL,
  `x` int(11) NOT NULL DEFAULT 0,
  `y` int(11) NOT NULL DEFAULT 0,
  `z` double NOT NULL DEFAULT 0,
  `rot` int(11) NOT NULL DEFAULT 0,
  `wall_pos` varchar(100) NOT NULL,
  `limited_data` varchar(100) NOT NULL DEFAULT '0:0',
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`) USING BTREE,
  KEY `roomid` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES
(73,1,2,3508,'0',11,6,0,1,'','0:0'),
(74,3,0,3508,'0',0,0,0,0,'','0:0'),
(75,3,0,3508,'0',0,0,0,0,'','0:0'),
(76,3,0,3508,'0',0,0,0,0,'','0:0'),
(77,3,0,3508,'0',0,0,0,0,'','0:0'),
(78,3,0,3508,'0',0,0,0,0,'','0:0'),
(79,3,3,3508,'-22',8,17,0,7,'','0:0'),
(80,3,0,3508,'0',0,0,0,0,'','0:0'),
(81,3,0,3508,'0',0,0,0,0,'','0:0'),
(82,3,0,3508,'0',0,0,0,0,'','0:0'),
(83,3,0,3508,'0',0,0,0,0,'','0:0'),
(89,2,0,3508,'0',0,0,0,0,'','0:0'),
(90,2,0,3508,'0',0,0,0,0,'','0:0'),
(91,2,0,3508,'0',0,0,0,0,'','0:0'),
(92,2,0,3508,'0',0,0,0,0,'','0:0'),
(93,2,0,3508,'0',0,0,0,0,'','0:0'),
(94,2,0,3508,'0',0,0,0,0,'','0:0'),
(95,2,0,3508,'0',0,0,0,0,'','0:0'),
(96,2,0,3508,'0',0,0,0,0,'','0:0'),
(97,2,0,3508,'0',0,0,0,0,'','0:0'),
(98,2,0,3508,'0',0,0,0,0,'','0:0');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items_crackable_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_crackable_rewards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `hit_requirement` int(11) NOT NULL,
  `crackable_type` enum('CLICK','STEPON') DEFAULT 'CLICK',
  `reward_type` enum('ITEM','COINS','VIP_POINTS','ACTIVITY_POINTS','EFFECT') DEFAULT 'ITEM',
  `reward_data` varchar(250) DEFAULT NULL,
  `required_effect` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items_crackable_rewards` WRITE;
/*!40000 ALTER TABLE `items_crackable_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_crackable_rewards` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items_limited_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_limited_edition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `limited_id` int(11) NOT NULL DEFAULT 0,
  `limited_total` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items_limited_edition` WRITE;
/*!40000 ALTER TABLE `items_limited_edition` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_limited_edition` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items_moodlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_moodlight` (
  `item_id` int(11) NOT NULL,
  `enabled` enum('1','0') NOT NULL DEFAULT '1',
  `active_preset` enum('1','2','3') NOT NULL DEFAULT '1',
  `preset_1` tinytext NOT NULL,
  `preset_2` tinytext NOT NULL,
  `preset_3` tinytext NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items_moodlight` WRITE;
/*!40000 ALTER TABLE `items_moodlight` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_moodlight` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items_presents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_presents` (
  `item_id` int(11) NOT NULL,
  `base_item_reward` int(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items_presents` WRITE;
/*!40000 ALTER TABLE `items_presents` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_presents` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items_teles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_teles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_one` bigint(20) DEFAULT NULL,
  `id_two` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items_teles` WRITE;
/*!40000 ALTER TABLE `items_teles` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_teles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `items_wired_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_wired_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `reward_data` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items_wired_rewards` WRITE;
/*!40000 ALTER TABLE `items_wired_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_wired_rewards` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `auth_header` varchar(255) NOT NULL,
  `login_header` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `primary_color` varchar(50) NOT NULL,
  `second_color` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('ROOM_VISIT','FURNI_PURCHASE','ROOM_CHATLOG','MESSENGER_CHATLOG','COMMAND') DEFAULT 'ROOM_CHATLOG',
  `room_id` int(11) DEFAULT -1,
  `user_id` int(11) DEFAULT -1,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `timestamp` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=642 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `logs_exchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_exchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `base_item` int(11) DEFAULT NULL,
  `currency_change` varchar(256) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `logs_namechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_namechange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `new_name` varchar(256) DEFAULT NULL,
  `old_name` varchar(256) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketplace_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `sold_timestamp` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `itemdata` (`item_id`,`user_id`) USING BTREE,
  KEY `price` (`price`) USING BTREE,
  KEY `time` (`timestamp`,`sold_timestamp`) USING BTREE,
  KEY `status` (`state`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `marketplace_items` WRITE;
/*!40000 ALTER TABLE `marketplace_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `messenger_friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_friendships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_one_id` int(10) unsigned NOT NULL,
  `user_two_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `1` (`user_one_id`) USING BTREE,
  KEY `2` (`user_two_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `messenger_friendships` WRITE;
/*!40000 ALTER TABLE `messenger_friendships` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_friendships` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `messenger_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_requests` (
  `from_id` int(10) unsigned NOT NULL,
  `to_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`) USING BTREE,
  KEY `to_id` (`to_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `messenger_requests` WRITE;
/*!40000 ALTER TABLE `messenger_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `moderation_action_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderation_action_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `moderation_action_categories` WRITE;
/*!40000 ALTER TABLE `moderation_action_categories` DISABLE KEYS */;
INSERT INTO `moderation_action_categories` VALUES
(1,'Personal Data'),
(2,'Sexually explicit');
/*!40000 ALTER TABLE `moderation_action_categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `moderation_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderation_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `message` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ban_hours` int(11) DEFAULT NULL,
  `avatar_ban_hours` int(11) DEFAULT NULL,
  `mute_hours` int(11) DEFAULT NULL,
  `trade_lock_hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `moderation_actions` WRITE;
/*!40000 ALTER TABLE `moderation_actions` DISABLE KEYS */;
INSERT INTO `moderation_actions` VALUES
(1,1,'Mute','Silenced for 24 hours.','',0,0,24,0),
(2,1,'Ban','Banned for 1 day.','',24,24,0,0),
(3,2,'Mute','Silenced for 2 hours.','',0,0,2,0),
(4,2,'Notice','If you keep acting like an asshole, you\'ll get banned!','It then sends a generic alert stating that if they continue they will be banned.',0,0,0,0);
/*!40000 ALTER TABLE `moderation_actions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `moderation_help_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderation_help_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` enum('CLOSED','IN_PROGRESS','OPEN','INVALID','ABUSIVE') NOT NULL DEFAULT 'OPEN',
  `submitter_id` int(11) NOT NULL DEFAULT 0,
  `reported_id` int(11) NOT NULL DEFAULT 0,
  `moderator_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `message` varchar(255) NOT NULL DEFAULT '',
  `chat_messages` text DEFAULT NULL,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `timestamp_opened` int(11) NOT NULL DEFAULT 0,
  `timestamp_closed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `moderation_help_tickets` WRITE;
/*!40000 ALTER TABLE `moderation_help_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderation_help_tickets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `moderation_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderation_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('user','room') NOT NULL DEFAULT 'user',
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `moderation_presets` WRITE;
/*!40000 ALTER TABLE `moderation_presets` DISABLE KEYS */;
INSERT INTO `moderation_presets` VALUES
(1,'user','Your behavior is unacceptable.'),
(2,'room','This room is inappropriate in the hotel.'),
(3,'user','Your language is inappropriate.'),
(4,'room','Behavior in the bedroom is not accepted.');
/*!40000 ALTER TABLE `moderation_presets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `name_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `name_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `min_rank` int(11) DEFAULT 1,
  `color_code` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `name_colors` WRITE;
/*!40000 ALTER TABLE `name_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `name_colors` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT 0,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `navigation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
INSERT INTO `navigations` VALUES
(1,'Start','/assets/images/navigation/start.gif','/',0,1,NULL),
(2,'Community','/assets/images/navigation/community.gif','/community',1,1,NULL),
(3,'Forum','/assets/images/navigation/forum.gif','/forum',2,0,NULL),
(4,'Store','/assets/images/navigation/store.gif','/shop',3,1,NULL),
(5,'Radio','/assets/images/navigation/radio.gif','/radio',4,0,NULL);
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `navigator_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigator_categories` (
  `id` int(11) NOT NULL,
  `category` enum('official_view','hotel_view','myworld_view','roomads_view','query') NOT NULL DEFAULT 'hotel_view',
  `category_identifier` varchar(35) NOT NULL DEFAULT '',
  `public_name` varchar(35) NOT NULL DEFAULT '',
  `view_mode` enum('REGULAR','THUMBNAIL') NOT NULL DEFAULT 'REGULAR',
  `required_rank` int(11) NOT NULL DEFAULT 1,
  `category_type` varchar(25) NOT NULL DEFAULT 'category',
  `search_allowance` enum('NOTHING','SHOW_MORE') NOT NULL DEFAULT 'SHOW_MORE',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `visible` enum('0','1') NOT NULL DEFAULT '1',
  `order_id` int(11) NOT NULL DEFAULT 0,
  `room_count` int(11) NOT NULL DEFAULT 15,
  `room_count_expanded` int(11) NOT NULL DEFAULT 50,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `navigator_categories` WRITE;
/*!40000 ALTER TABLE `navigator_categories` DISABLE KEYS */;
INSERT INTO `navigator_categories` VALUES
(0,'query','query','','REGULAR',1,'query','NOTHING','1','1',0,12,50),
(1,'official_view','official-root','Public rooms','THUMBNAIL',1,'public','NOTHING','1','1',0,12,50),
(2,'hotel_view','popular','Most popular rooms','REGULAR',1,'popular','SHOW_MORE','1','1',1,50,50),
(4,'myworld_view','my','My rooms','REGULAR',1,'my_rooms','SHOW_MORE','1','1',0,12,50),
(5,'myworld_view','favorites','My favorite rooms','REGULAR',1,'my_favorites','SHOW_MORE','1','1',0,12,50),
(6,'myworld_view','my_groups','My Group Rooms','REGULAR',1,'my_groups','SHOW_MORE','1','1',1,12,50),
(7,'myworld_view','history','Quartos visitados','REGULAR',1,'my_history','SHOW_MORE','0','1',0,12,50),
(8,'myworld_view','friends_rooms','Rooms visited','REGULAR',1,'my_friends_rooms','SHOW_MORE','1','1',3,12,50),
(9,'myworld_view','history_freq','Frequently visited rooms','REGULAR',1,'my_history_freq','SHOW_MORE','0','0',0,12,50),
(10,'roomads_view','top_promotions','Featured promotions','REGULAR',1,'top_promotions','SHOW_MORE','1','1',0,12,50),
(19,'roomads_view','promotion_parties_music','Parties and Music','REGULAR',1,'promotion_category','SHOW_MORE','0','0',2,12,50),
(20,'roomads_view','promotion_roleplay','Roleplay','REGULAR',1,'promotion_category','SHOW_MORE','0','0',3,12,50),
(21,'roomads_view','promotion_trading','Negotiations','REGULAR',1,'promotion_category','SHOW_MORE','0','0',4,12,50),
(22,'roomads_view','promotion_games','Games','REGULAR',1,'promotion_category','SHOW_MORE','0','0',5,12,50),
(23,'roomads_view','promotion_debates_discussion','Chat','REGULAR',1,'promotion_category','SHOW_MORE','0','0',6,12,50),
(24,'roomads_view','promotion_grand_openings','Openings','REGULAR',1,'promotion_category','SHOW_MORE','0','0',7,12,50),
(25,'roomads_view','promotion_friending','Making friends','REGULAR',1,'promotion_category','SHOW_MORE','0','0',8,12,50),
(26,'roomads_view','promotion_jobs','Works','REGULAR',1,'promotion_category','SHOW_MORE','0','0',9,12,50),
(27,'roomads_view','promotion_group_events','Group Events','REGULAR',1,'promotion_category','SHOW_MORE','0','0',10,12,50),
(28,'hotel_view','staff_rooms','Staff rooms','REGULAR',5,'category','SHOW_MORE','0','1',0,12,50),
(29,'hotel_view','chat_chill_discussion','Chat, Relax and Discuss','REGULAR',1,'category','SHOW_MORE','1','1',2,12,50),
(30,'hotel_view','trading_casinos','Exchanges and Bets','REGULAR',1,'category','SHOW_MORE','1','1',4,12,50),
(31,'hotel_view','games_events','Games and Events','REGULAR',1,'category','SHOW_MORE','1','1',3,12,50),
(32,'hotel_view','parties_clubs','Parties and Club','REGULAR',1,'category','SHOW_MORE','1','1',5,12,50),
(33,'hotel_view','role_playing','Roleplay','REGULAR',1,'category','SHOW_MORE','1','1',6,12,50),
(34,'hotel_view','help_centers','Help Center','REGULAR',1,'category','SHOW_MORE','1','1',7,12,50),
(35,'hotel_view','agencies','Agencies','REGULAR',1,'category','SHOW_MORE','1','1',8,12,50),
(36,'hotel_view','all_other_rooms','All other rooms','REGULAR',1,'category','SHOW_MORE','1','0',9,12,50),
(37,'myworld_view','with_rights','Rooms where I have rights','REGULAR',1,'with_rights','SHOW_MORE','0','1',4,12,50),
(38,'official_view','official','Official Rooms','REGULAR',1,'staff_picks','NOTHING','1','1',2,12,50),
(39,'official_view','activities','Activities','REGULAR',1,'public','SHOW_MORE','1','1',3,12,50),
(40,'official_view','games','Official Games','REGULAR',1,'public','SHOW_MORE','1','1',4,12,50);
/*!40000 ALTER TABLE `navigator_categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `navigator_publics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigator_publics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `caption` varchar(64) NOT NULL,
  `description` varchar(150) NOT NULL,
  `image_url` text DEFAULT NULL,
  `order_num` int(11) NOT NULL DEFAULT 1,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `category` varchar(255) DEFAULT 'official-root',
  PRIMARY KEY (`id`),
  KEY `ordernum` (`order_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `navigator_publics` WRITE;
/*!40000 ALTER TABLE `navigator_publics` DISABLE KEYS */;
INSERT INTO `navigator_publics` VALUES
(1,9,'Reception','Meet new people and make new friends!','navigator-thumbnail/recepcao.png',1,'1','official-root'),
(2,436,'Theater','Meet the hotel announcements and meetings stage!','navigator-thumbnail/teatro.png',2,'1','official-root'),
(3,566,'Picnic','Chat in a calm and peaceful environment.','navigator-thumbnail/picnic.png',3,'1','official-root'),
(4,567,'Infobus Square','','navigator-thumbnail/praca.png',4,'0','official-root'),
(5,568,'Infobus','','navigator-thumbnail/infobus.png',5,'0','official-root'),
(6,569,'Cafeteria','','navigator-thumbnail/cafeteria.png',6,'0','official-root');
/*!40000 ALTER TABLE `navigator_publics` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `navigator_staff_picks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigator_staff_picks` (
  `room_id` int(11) NOT NULL DEFAULT 0,
  `featured_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `navigator_staff_picks` WRITE;
/*!40000 ALTER TABLE `navigator_staff_picks` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigator_staff_picks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_chat_bubbles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_chat_bubbles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bubble_id` int(11) NOT NULL,
  `minimum_rank` int(11) NOT NULL DEFAULT 1,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_chat_bubbles` WRITE;
/*!40000 ALTER TABLE `permission_chat_bubbles` DISABLE KEYS */;
INSERT INTO `permission_chat_bubbles` VALUES
(1,0,7,''),
(2,1,7,''),
(3,2,7,''),
(4,3,1,''),
(5,4,1,''),
(6,5,1,''),
(7,6,1,''),
(8,7,1,''),
(9,8,1,''),
(10,9,1,''),
(11,10,1,''),
(12,11,1,''),
(13,12,1,''),
(14,13,1,''),
(15,14,1,''),
(16,15,1,''),
(17,16,1,''),
(18,17,1,''),
(19,19,1,''),
(20,20,1,''),
(21,21,1,''),
(22,22,1,''),
(23,23,7,'Staff'),
(24,24,1,''),
(25,25,1,''),
(26,26,1,''),
(27,27,1,''),
(28,28,1,''),
(29,29,1,''),
(30,30,7,''),
(31,31,7,''),
(32,32,1,''),
(33,33,7,''),
(34,34,7,''),
(35,35,1,''),
(36,36,1,''),
(37,37,7,''),
(38,38,1,''),
(40,42,7,''),
(41,43,7,''),
(42,44,2,''),
(43,45,2,'');
/*!40000 ALTER TABLE `permission_chat_bubbles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_command_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_command_overrides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command_id` varchar(255) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `enabled` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_command_overrides` WRITE;
/*!40000 ALTER TABLE `permission_command_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_command_overrides` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_commands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `command_id` varchar(500) DEFAULT NULL,
  `minimum_rank` int(11) DEFAULT 1,
  `vip_only` enum('1','0') DEFAULT '0',
  `rights_only` enum('0','1') DEFAULT '0',
  `rights_override` enum('NONE','RIGHTS','OWNER') DEFAULT 'NONE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_commands` WRITE;
/*!40000 ALTER TABLE `permission_commands` DISABLE KEYS */;
INSERT INTO `permission_commands` VALUES
(1,'about_command',1,'0','0','NONE'),
(2,'advban_command',7,'0','0','NONE'),
(3,'alert_command',7,'0','0','NONE'),
(4,'autofloor_command',7,'0','0','NONE'),
(5,'ban_command',7,'0','0','NONE'),
(6,'bell_command',7,'0','0','NONE'),
(7,'botcontrol_command',7,'0','0','NONE'),
(8,'brb_command',1,'0','0','NONE'),
(9,'bubble_command',7,'0','0','NONE'),
(10,'buy_room_command',2,'0','0','NONE'),
(11,'closedice_command',7,'0','0','NONE'),
(12,'colour_command',2,'0','0','NONE'),
(13,'coins_command',7,'0','0','NONE'),
(14,'count_furnis_command',7,'0','0','NONE'),
(15,'commands_command',1,'0','0','NONE'),
(16,'commands_fill',2,'0','0','NONE'),
(17,'dance_command',7,'0','0','NONE'),
(18,'debug',7,'0','0','NONE'),
(19,'delete_all_items_command',1,'0','0','NONE'),
(20,'deletegroup_command',1,'0','0','NONE'),
(21,'disconnect_command',7,'0','0','NONE'),
(22,'disable_mimic_command',7,'0','0','NONE'),
(23,'disablecommand_command',2,'0','0','NONE'),
(24,'disablehotelalert_command',7,'0','0','NONE'),
(25,'disablehotelalertlinks_command',7,'0','0','NONE'),
(26,'disablewhisper_command',7,'0','0','NONE'),
(27,'dj_command',7,'0','0','NONE'),
(28,'duckets_command',7,'0','0','NONE'),
(29,'enable_command',1,'0','0','NONE'),
(30,'empty_command',1,'0','0','NONE'),
(31,'emptybots_command',1,'0','0','NONE'),
(32,'emptyfriends_command',2,'0','0','NONE'),
(33,'emptypets_command',1,'0','0','NONE'),
(34,'eventalert_command',7,'0','0','NONE'),
(35,'eventreward_command',7,'0','0','NONE'),
(36,'eventwon_command',7,'0','0','NONE'),
(37,'fastwalk_command',2,'0','0','NONE'),
(38,'follow_command',7,'0','0','NONE'),
(39,'flagme_command',2,'0','0','NONE'),
(40,'flaguser_command',7,'0','0','NONE'),
(41,'freeze_command',7,'0','0','NONE'),
(42,'givebadge_command',7,'0','0','NONE'),
(43,'giverank_command',7,'0','0','NONE'),
(44,'gotoroom_commad',7,'0','0','NONE'),
(45,'handitem_command',1,'0','0','NONE'),
(46,'hotelalert_command',7,'0','0','NONE'),
(47,'hidewired_command',7,'0','0','NONE'),
(48,'highschore_command',7,'0','0','NONE'),
(49,'home_command',1,'0','0','NONE'),
(50,'hug_command',2,'0','0','NONE'),
(51,'ignoreevents_command',7,'0','0','NONE'),
(52,'invisible_command',7,'0','0','NONE'),
(53,'invite_friends_command',2,'0','0','NONE'),
(54,'ipban_command',7,'0','0','NONE'),
(55,'kick_command',7,'0','0','NONE'),
(56,'kiss_command',1,'0','0','NONE'),
(57,'lay_command',1,'0','0','NONE'),
(58,'listen_command',7,'0','0','NONE'),
(59,'logsclient_command',7,'0','0','NONE'),
(60,'look_command',2,'0','0','NONE'),
(61,'machineban_command',7,'0','0','NONE'),
(62,'maintenance_command',7,'0','0','NONE'),
(63,'makesay-command',7,'0','0','NONE'),
(64,'massbadge_command',7,'0','0','NONE'),
(65,'masscoins_command',7,'0','0','NONE'),
(66,'massduckets_command',7,'0','0','NONE'),
(67,'masseffect_command',7,'0','0','NONE'),
(68,'massfreeze_command',7,'0','0','NONE'),
(69,'masshanditem_command',7,'0','0','NONE'),
(70,'massmotd_command',7,'0','0','NONE'),
(71,'masspoints_command',7,'0','0','NONE'),
(72,'masswarp_command',7,'0','0','NONE'),
(73,'maxfloor_command',2,'0','0','NONE'),
(74,'mentions_command',7,'0','0','NONE'),
(75,'mentionsettings_command',7,'0','0','NONE'),
(76,'mimic_command',2,'0','0','NONE'),
(77,'mimicoff_command',7,'0','0','NONE'),
(78,'moonwalk_command',2,'0','0','NONE'),
(79,'mute_command',7,'0','0','NONE'),
(80,'mutepets_command',2,'0','0','NONE'),
(81,'muteusers_command',7,'0','0','NONE'),
(82,'namecolour_command',2,'0','0','NONE'),
(83,'notification_command',7,'0','0','NONE'),
(84,'noface_command',2,'0','0','NONE'),
(85,'notificationlook_command',7,'0','0','NONE'),
(86,'online_command',7,'0','0','NONE'),
(87,'override_command',7,'0','0','NONE'),
(88,'pickall_command',1,'0','0','NONE'),
(89,'playerinfo_command',7,'0','0','NONE'),
(90,'points_command',7,'0','0','NONE'),
(91,'publicroom_command',7,'0','0','NONE'),
(92,'pull_command',1,'0','0','NONE'),
(93,'push_command',1,'0','0','NONE'),
(94,'pyramid_command',2,'0','0','NONE'),
(95,'quickpoll_command',7,'0','0','NONE'),
(96,'randomize_command',2,'0','0','NONE'),
(97,'removebadge_command',7,'0','0','NONE'),
(98,'roomaction_command',7,'0','0','NONE'),
(99,'roomalert_command',7,'0','0','NONE'),
(100,'roombadge',7,'0','0','NONE'),
(101,'roomban_command',7,'0','0','NONE'),
(102,'roommasspoints_command',7,'0','0','NONE'),
(103,'roomkick_command',7,'0','0','NONE'),
(104,'roomnotification',7,'0','0','NONE'),
(105,'roomoption_command',7,'0','0','NONE'),
(106,'screenshot_command',2,'0','0','NONE'),
(107,'see_height_command',2,'0','0','NONE'),
(108,'setidletimer_command',7,'0','0','NONE'),
(109,'sell_room_command',2,'0','0','NONE'),
(110,'setmax_command',2,'0','0','NONE'),
(111,'setrot_command',2,'0','0','NONE'),
(112,'setstate_command',2,'0','0','NONE'),
(113,'setspeed_command',1,'0','0','NONE'),
(114,'setz_command',2,'0','0','NONE'),
(115,'shutdown_command',7,'0','0','NONE'),
(116,'sit_command',1,'0','0','NONE'),
(117,'slime_command',2,'0','0','NONE'),
(118,'softban_command',7,'0','0','NONE'),
(119,'staffalert_command',7,'0','0','NONE'),
(120,'staffinfo_command',7,'0','0','NONE'),
(121,'stand_command',1,'0','0','NONE'),
(122,'summon_command',7,'0','0','NONE'),
(123,'superban_command',7,'0','0','NONE'),
(124,'superpull_command',7,'0','0','NONE'),
(125,'superpush_command',7,'0','0','NONE'),
(126,'superwired_command',7,'0','0','NONE'),
(127,'tagprofile_command',2,'0','0','NONE'),
(128,'teleport_command',7,'0','0','NONE'),
(129,'teleport_to_me_command',7,'0','0','NONE'),
(130,'toggleshoot_command',2,'0','0','NONE'),
(131,'togglediagonal_command',2,'0','0','NONE'),
(132,'togglefriends_command',2,'0','0','NONE'),
(133,'tradeban_command',7,'0','0','NONE'),
(134,'transform_command',7,'0','0','NONE'),
(135,'twitch_command',7,'0','0','NONE'),
(136,'unban_command',7,'0','0','NONE'),
(137,'unfreeze',7,'0','0','NONE'),
(138,'unload_command',7,'0','0','NONE'),
(139,'unmute_command',7,'0','0','NONE'),
(140,'updatefloor_command',7,'0','0','NONE'),
(141,'viewinventory_commands',7,'0','0','NONE'),
(142,'warpbot_command',7,'0','0','NONE'),
(143,'warp_command',7,'0','0','NONE'),
(144,'youtube_command',7,'0','0','NONE'),
(145,'addfilter_command',7,'0','0','NONE'),
(146,'bundle_command',7,'0','0','NONE'),
(147,'cloneroom_command',7,'0','0','NONE'),
(148,'furnifix_command',7,'0','0','NONE'),
(149,'ignoreinvites_command',7,'0','0','NONE'),
(150,'me_command',2,'0','0','NONE'),
(151,'nospam_command',7,'0','0','NONE'),
(152,'pickallwired_command',2,'0','0','NONE'),
(153,'prefix_command',2,'0','0','NONE'),
(154,'promoteoffer_command',7,'0','0','NONE'),
(155,'reminderevent',7,'0','0','NONE'),
(156,'roll_command',2,'0','0','NONE'),
(157,'senduser_command',7,'0','0','NONE'),
(158,'setbet_command',2,'0','0','NONE'),
(159,'toggletrade_command',2,'0','0','NONE'),
(160,'transfer_room_command',7,'0','0','NONE'),
(161,'welcome_command',7,'0','0','NONE'),
(162,'whisperalert_command',7,'0','0','NONE'),
(203,'clickthrouse_command',1,'0','0','NONE'),
(204,'futnitro_command',1,'0','1','NONE');
/*!40000 ALTER TABLE `permission_commands` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_effects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `effect_id` int(11) NOT NULL,
  `minimum_rank` int(11) DEFAULT 7,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_effects` WRITE;
/*!40000 ALTER TABLE `permission_effects` DISABLE KEYS */;
INSERT INTO `permission_effects` VALUES
(1,102,7),
(2,178,7),
(3,187,7);
/*!40000 ALTER TABLE `permission_effects` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_perks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_perks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) DEFAULT 'FULL_CHAT',
  `data` varchar(255) DEFAULT '',
  `override_rank` enum('1','0') DEFAULT '0',
  `override_default` enum('1','0') DEFAULT '0',
  `min_rank` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_perks` WRITE;
/*!40000 ALTER TABLE `permission_perks` DISABLE KEYS */;
INSERT INTO `permission_perks` VALUES
(1,'SAFE_CHAT','','1','1',1),
(2,'USE_GUIDE_TOOL','','0','0',15),
(3,'GIVE_GUIDE_TOURS','','0','0',15),
(4,'JUDGE_CHAT_REVIEWS','','0','0',15),
(5,'CALL_ON_HELPERS','','1','1',1),
(6,'CITIZEN','','1','1',14),
(7,'FULL_CHAT','','1','1',1),
(8,'TRADE','','1','1',1),
(9,'VOTE_IN_COMPETITIONS','requirement.unfulfilled.helper_level_2','1','1',1),
(10,'NEW_UI','','1','1',1),
(11,'EXPERIMENTAL_CHAT_BETA','','1','1',1),
(12,'HEIGHTMAP_EDITOR_BETA','requirement.unfulfilled.feature_disabled','0','1',1),
(13,'EXPERIMENTAL_TOOLBAR','','1','1',1),
(16,'CAMERA','','1','1',1),
(17,'BUILDER_AT_WORK','','1','1',1),
(18,'MOUSE_ZOOM','','1','1',1),
(19,'NAVIGATOR_PHASE_TWO_2014','','0','0',1),
(20,'NAVIGATOR_ROOM_THUMBNAIL_CAMERA','','0','0',1),
(21,'MOD_TOOL','','0','0',11);
/*!40000 ALTER TABLE `permission_perks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT 'default',
  `hidden_rank` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pet_breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_breeds` (
  `pet_type` int(11) NOT NULL DEFAULT 1,
  `pallet_id` int(11) NOT NULL DEFAULT 0,
  `level` enum('EPIC','RARE','UNCOMMON','COMMON') DEFAULT 'COMMON',
  PRIMARY KEY (`pet_type`,`pallet_id`) USING BTREE,
  KEY `pet_type` (`pet_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_breeds` WRITE;
/*!40000 ALTER TABLE `pet_breeds` DISABLE KEYS */;
INSERT INTO `pet_breeds` VALUES
(24,1,'COMMON'),
(24,2,'COMMON'),
(24,3,'COMMON'),
(24,4,'COMMON'),
(24,5,'COMMON'),
(24,6,'UNCOMMON'),
(24,7,'UNCOMMON'),
(24,8,'UNCOMMON'),
(24,9,'UNCOMMON'),
(24,10,'UNCOMMON'),
(24,11,'UNCOMMON'),
(24,12,'RARE'),
(24,13,'RARE'),
(24,14,'RARE'),
(24,15,'RARE'),
(24,16,'RARE'),
(24,17,'RARE'),
(24,18,'EPIC'),
(24,19,'EPIC'),
(24,20,'EPIC'),
(25,1,'COMMON'),
(25,2,'COMMON'),
(25,3,'COMMON'),
(25,4,'COMMON'),
(25,5,'COMMON'),
(25,6,'UNCOMMON'),
(25,7,'UNCOMMON'),
(25,8,'UNCOMMON'),
(25,9,'UNCOMMON'),
(25,10,'UNCOMMON'),
(25,11,'UNCOMMON'),
(25,12,'RARE'),
(25,13,'RARE'),
(25,14,'RARE'),
(25,15,'RARE'),
(25,16,'RARE'),
(25,17,'RARE'),
(25,18,'EPIC'),
(25,19,'EPIC'),
(25,20,'EPIC'),
(28,1,'COMMON'),
(28,2,'COMMON'),
(28,3,'COMMON'),
(28,4,'COMMON'),
(28,5,'COMMON'),
(28,6,'UNCOMMON'),
(28,7,'UNCOMMON'),
(28,8,'UNCOMMON'),
(28,9,'UNCOMMON'),
(28,10,'UNCOMMON'),
(28,11,'UNCOMMON'),
(28,12,'RARE'),
(28,13,'RARE'),
(28,14,'RARE'),
(28,15,'RARE'),
(28,16,'RARE'),
(28,17,'RARE'),
(28,18,'EPIC'),
(28,19,'EPIC'),
(28,20,'EPIC'),
(29,1,'COMMON'),
(29,2,'COMMON'),
(29,3,'COMMON'),
(29,4,'COMMON'),
(29,5,'COMMON'),
(29,6,'UNCOMMON'),
(29,7,'UNCOMMON'),
(29,8,'UNCOMMON'),
(29,9,'UNCOMMON'),
(29,10,'UNCOMMON'),
(29,11,'UNCOMMON'),
(29,12,'RARE'),
(29,13,'RARE'),
(29,14,'RARE'),
(29,15,'RARE'),
(29,16,'RARE'),
(29,17,'RARE'),
(29,18,'EPIC'),
(29,19,'EPIC'),
(29,20,'EPIC'),
(30,1,'COMMON'),
(30,2,'COMMON'),
(30,3,'COMMON'),
(30,4,'COMMON'),
(30,5,'COMMON'),
(30,6,'UNCOMMON'),
(30,7,'UNCOMMON'),
(30,8,'UNCOMMON'),
(30,9,'UNCOMMON'),
(30,10,'UNCOMMON'),
(30,11,'UNCOMMON'),
(30,12,'RARE'),
(30,13,'RARE'),
(30,14,'RARE'),
(30,15,'RARE'),
(30,16,'RARE'),
(30,17,'RARE'),
(30,18,'EPIC'),
(30,19,'EPIC'),
(30,20,'EPIC');
/*!40000 ALTER TABLE `pet_breeds` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pet_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_commands` (
  `pet_id` int(11) NOT NULL,
  `command_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_commands` WRITE;
/*!40000 ALTER TABLE `pet_commands` DISABLE KEYS */;
INSERT INTO `pet_commands` VALUES
(12,0),
(12,35),
(12,5),
(12,3),
(12,36),
(12,37),
(12,38),
(12,2),
(12,6),
(12,7),
(12,22),
(12,8),
(12,9),
(12,41),
(12,10),
(12,11),
(12,12),
(12,13),
(12,14),
(12,15),
(12,16),
(12,42);
/*!40000 ALTER TABLE `pet_commands` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pet_commands_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_commands_data` (
  `command_id` int(11) NOT NULL,
  `text` varchar(15) NOT NULL,
  `required_level` int(11) NOT NULL,
  `reward_xp` int(11) NOT NULL DEFAULT 5,
  `cost_happyness` int(11) NOT NULL DEFAULT 0,
  `cost_energy` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_commands_data` WRITE;
/*!40000 ALTER TABLE `pet_commands_data` DISABLE KEYS */;
INSERT INTO `pet_commands_data` VALUES
(0,'Free',1,5,0,0),
(1,'Sit',1,5,0,0),
(2,'Down',2,10,0,0),
(3,'Here',2,10,0,0),
(4,'Beg',2,10,0,0),
(5,'Play Dead',3,15,0,0),
(6,'Stay',4,10,0,0),
(7,'Follow',5,15,0,0),
(8,'Stand',6,15,0,0),
(9,'Jump',6,15,0,0),
(10,'Speak',7,10,0,0),
(11,'Play',8,5,0,0),
(12,'Silent',8,5,0,0),
(13,'Nest',5,5,0,0),
(14,'Drink',4,5,0,0),
(15,'Follow left',15,15,0,0),
(16,'Follow right',15,15,0,0),
(17,'Play football',10,5,0,0),
(18,'Come here',9,5,0,0),
(19,'Bounce',9,5,0,0),
(20,'Flat',11,5,0,0),
(21,'Dance',12,5,0,0),
(22,'Spin',10,5,0,0),
(23,'Switch TV',12,5,0,0),
(24,'Move forward',17,5,0,0),
(25,'Turn left',18,5,0,0),
(26,'Turn right',18,5,0,0),
(27,'Relax',13,5,0,0),
(28,'Croak',14,5,0,0),
(29,'Dip',14,5,0,0),
(30,'Wave',5,5,0,0),
(31,'Mambo!',18,5,0,0),
(32,'High jump',18,5,0,0),
(33,'Chicken dance',7,5,0,0),
(34,'Triple jump',9,5,0,0),
(35,'Spread wings',8,5,0,0),
(36,'Breathe fire',10,5,0,0),
(37,'Hang',12,5,0,0),
(38,'Torch',6,5,0,0),
(40,'Swing',13,5,0,0),
(41,'Roll',10,5,0,0),
(42,'Ring of fire',20,5,0,0),
(43,'Eat',4,5,0,0),
(44,'Wag Tail',4,5,0,0),
(45,'Count',6,5,0,0),
(46,'Breed',20,5,0,0);
/*!40000 ALTER TABLE `pet_commands_data` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pet_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) DEFAULT 0,
  `pet_name` varchar(50) DEFAULT NULL,
  `race_id` int(11) DEFAULT 11,
  `type` int(11) DEFAULT NULL,
  `colour` text DEFAULT NULL,
  `scratches` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `happiness` int(11) NOT NULL DEFAULT 0,
  `experience` int(11) NOT NULL DEFAULT 0,
  `energy` int(11) NOT NULL DEFAULT 0,
  `hunger` int(11) NOT NULL DEFAULT 0,
  `x` int(11) DEFAULT 0,
  `y` int(11) DEFAULT 0,
  `saddled` enum('true','false') DEFAULT 'false',
  `any_rider` enum('true','false') DEFAULT 'false',
  `hair_style` int(11) DEFAULT -1,
  `hair_colour` int(11) DEFAULT 0,
  `birthday` int(11) DEFAULT 0,
  `extra_data` varchar(500) DEFAULT '',
  `z` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner_id` (`owner_id`) USING BTREE,
  KEY `room_id` (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_data` WRITE;
/*!40000 ALTER TABLE `pet_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_data` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pet_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_type` int(11) NOT NULL DEFAULT 0,
  `message_type` enum('GENERIC','SCRATCHED','WELCOME_HOME','HUNGRY','TIRED','SLEEPING') NOT NULL DEFAULT 'GENERIC',
  `message_string` varchar(100) NOT NULL DEFAULT 'Hiya %username%!!!',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_messages` WRITE;
/*!40000 ALTER TABLE `pet_messages` DISABLE KEYS */;
INSERT INTO `pet_messages` VALUES
(1,2,'WELCOME_HOME','oiiiiii %ownerName%!!!'),
(2,2,'WELCOME_HOME','bem vindo em casa %ownerName%, saudadessss!!!!!'),
(3,2,'GENERIC','snap snap'),
(4,2,'GENERIC','miau, eu sou um crocodilo'),
(5,2,'HUNGRY','traga sua bunda aqui para que eu possa mastigar'),
(6,2,'HUNGRY','ESTOU COM FOME.. ME ALIMENTE'),
(7,2,'TIRED','snap snap estou tão cansado'),
(8,2,'SCRATCHED','eu te amoooo'),
(9,2,'SCRATCHED','eu ia te comer, mas então eu fui arranhado'),
(10,9,'GENERIC','snap snap sou uma tartaruga furiosa'),
(11,9,'WELCOME_HOME','bem vindo em casa mano!'),
(12,9,'HUNGRY','estou com fome'),
(13,9,'TIRED','estou cansado'),
(14,9,'SCRATCHED','obrigado por me acariciar!'),
(15,-1,'SLEEPING','* Zzzzz zzzzzzzZ *'),
(16,-1,'HUNGRY','* estômago ronca *'),
(17,-1,'HUNGRY','* Gggrrrrrrrr * estou com muita fome!'),
(18,-1,'TIRED','Aahh estou exausto!');
/*!40000 ALTER TABLE `pet_messages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pet_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_races` (
  `race_id` int(11) DEFAULT NULL,
  `colour1` int(11) DEFAULT NULL,
  `colour2` int(11) DEFAULT NULL,
  `has1colour` enum('1','0') DEFAULT NULL,
  `has2colour` enum('1','0') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_races` WRITE;
/*!40000 ALTER TABLE `pet_races` DISABLE KEYS */;
INSERT INTO `pet_races` VALUES
(12,0,0,'1','0'),
(12,1,1,'1','0'),
(12,2,2,'1','0'),
(12,3,3,'1','0'),
(12,4,4,'1','0'),
(12,5,5,'1','0'),
(15,1,2,'1','0'),
(15,2,3,'1','0'),
(15,3,4,'1','0'),
(15,4,5,'1','0'),
(15,1,6,'1','0'),
(15,2,7,'1','0'),
(15,3,8,'1','0'),
(15,4,9,'1','0'),
(15,1,10,'1','0'),
(15,2,11,'1','0'),
(15,3,12,'1','0'),
(15,4,13,'1','0'),
(15,1,14,'1','0'),
(15,2,15,'1','0'),
(15,3,16,'1','0'),
(15,4,17,'1','0'),
(15,1,18,'1','0'),
(15,2,19,'1','0'),
(15,3,20,'1','0'),
(15,4,21,'1','0'),
(15,1,22,'1','0'),
(15,2,23,'1','0'),
(15,3,24,'1','0'),
(15,4,25,'1','0'),
(15,1,26,'1','0'),
(15,2,27,'1','0'),
(15,3,28,'1','0'),
(15,4,29,'1','0'),
(15,1,30,'1','0'),
(15,2,31,'1','0'),
(15,3,32,'1','0'),
(15,4,33,'1','0'),
(15,1,34,'1','0'),
(15,2,35,'1','0'),
(15,3,36,'1','0'),
(15,4,37,'1','0'),
(15,1,38,'1','0'),
(15,2,39,'1','0'),
(15,3,40,'1','0'),
(15,4,41,'1','0'),
(15,1,42,'1','0'),
(15,2,43,'1','0'),
(15,3,44,'1','0'),
(15,4,45,'1','0'),
(15,1,46,'1','0'),
(15,2,47,'1','0'),
(15,3,48,'1','0'),
(15,4,49,'1','0'),
(0,0,0,'1','0'),
(0,1,1,'1','0'),
(0,2,2,'1','0'),
(0,3,3,'1','0'),
(0,4,4,'1','0'),
(0,5,5,'1','0'),
(0,6,6,'1','0'),
(0,7,7,'1','0'),
(0,8,8,'1','0'),
(0,9,9,'1','0'),
(0,10,10,'1','0'),
(0,11,11,'1','0'),
(0,12,12,'1','0'),
(0,13,13,'1','0'),
(0,14,14,'1','0'),
(0,15,15,'1','0'),
(0,16,16,'1','0'),
(0,17,17,'1','0'),
(0,18,18,'1','0'),
(0,19,19,'1','0'),
(0,20,20,'1','0'),
(0,21,21,'1','0'),
(0,22,22,'1','0'),
(0,23,23,'1','0'),
(0,24,24,'1','0'),
(1,0,0,'1','0'),
(1,1,1,'1','0'),
(1,2,2,'1','0'),
(1,3,3,'1','0'),
(1,4,4,'1','0'),
(1,5,5,'1','0'),
(1,6,6,'1','0'),
(1,7,7,'1','0'),
(1,8,8,'1','0'),
(1,9,9,'1','0'),
(1,10,10,'1','0'),
(1,11,11,'1','0'),
(1,12,12,'1','0'),
(1,13,13,'1','0'),
(1,14,14,'1','0'),
(1,15,15,'1','0'),
(1,16,16,'1','0'),
(1,17,17,'1','0'),
(1,18,18,'1','0'),
(1,19,19,'1','0'),
(1,20,20,'1','0'),
(1,21,21,'1','0'),
(1,22,22,'1','0'),
(1,23,23,'1','0'),
(1,24,24,'1','0'),
(10,4,4,'1','0'),
(9,0,0,'1','0'),
(9,1,1,'1','0'),
(9,2,2,'1','0'),
(9,3,3,'1','0'),
(9,4,4,'1','0'),
(9,5,5,'1','0'),
(9,6,6,'1','0'),
(9,7,7,'1','0'),
(9,8,8,'1','0'),
(11,1,1,'1','0'),
(11,2,2,'1','0'),
(11,3,3,'1','0'),
(11,4,4,'1','0'),
(11,5,5,'1','0'),
(11,6,6,'1','0'),
(11,8,8,'1','0'),
(11,9,9,'1','0'),
(11,10,10,'1','0'),
(11,11,11,'1','0'),
(11,12,12,'1','0'),
(11,13,13,'1','0'),
(11,15,15,'1','0'),
(11,18,18,'1','0'),
(8,0,0,'1','0'),
(8,1,1,'1','0'),
(8,2,2,'1','0'),
(8,3,3,'1','0'),
(8,4,4,'1','0'),
(8,5,5,'1','0'),
(8,6,6,'1','0'),
(8,7,7,'1','0'),
(8,8,8,'1','0'),
(8,9,9,'1','0'),
(8,10,10,'1','0'),
(8,11,11,'1','0'),
(8,14,14,'1','0'),
(3,7,7,'0','1'),
(3,8,8,'0','1'),
(3,9,9,'0','1'),
(3,10,10,'0','1'),
(3,11,11,'0','1'),
(5,9,9,'0','1'),
(8,12,12,'1','0'),
(8,13,13,'1','0'),
(7,0,0,'1','0'),
(7,1,1,'1','0'),
(7,2,2,'1','0'),
(7,3,3,'1','0'),
(7,4,4,'1','0'),
(7,5,5,'1','0'),
(7,6,6,'1','0'),
(7,7,7,'1','0'),
(5,0,0,'1','0'),
(5,1,1,'1','0'),
(5,2,2,'1','0'),
(5,3,3,'1','0'),
(5,5,5,'1','0'),
(5,7,7,'1','0'),
(5,8,8,'1','0'),
(3,0,0,'1','0'),
(3,1,1,'1','0'),
(3,2,2,'1','0'),
(3,3,3,'1','0'),
(3,4,4,'1','0'),
(3,5,5,'1','0'),
(3,6,6,'1','0'),
(4,0,0,'1','0'),
(4,1,1,'1','0'),
(4,2,2,'1','0'),
(4,3,3,'1','0'),
(2,0,0,'1','0'),
(2,1,1,'1','0'),
(2,2,2,'1','0'),
(2,3,3,'1','0'),
(2,4,4,'1','0'),
(2,5,5,'1','0'),
(2,6,6,'1','0'),
(2,7,7,'1','0'),
(2,8,8,'1','0'),
(2,9,9,'1','0'),
(2,10,10,'1','0'),
(2,11,11,'1','0'),
(6,0,0,'1','0'),
(6,1,1,'1','0'),
(6,2,2,'1','0'),
(6,3,3,'1','0'),
(6,4,4,'1','0'),
(6,5,5,'1','0'),
(6,6,6,'1','0'),
(6,7,7,'1','0'),
(6,8,8,'1','0'),
(6,9,9,'1','0'),
(6,10,10,'1','0'),
(6,11,11,'1','0'),
(6,12,12,'1','0'),
(10,3,3,'1','0'),
(10,2,2,'1','0'),
(10,1,1,'1','0'),
(10,0,0,'1','0'),
(22,0,0,'1','0'),
(21,0,0,'1','0'),
(17,1,1,'1','0'),
(17,0,0,'1','0'),
(17,2,2,'1','0'),
(17,3,3,'1','0'),
(17,4,4,'1','0'),
(18,0,0,'1','0'),
(19,0,0,'1','0'),
(20,0,0,'1','0'),
(26,0,0,'1','0'),
(26,1,1,'1','0'),
(26,2,2,'1','0'),
(26,3,3,'1','0'),
(26,4,4,'1','0'),
(26,5,5,'1','0'),
(26,6,6,'1','0'),
(5,4,4,'0','1'),
(5,6,6,'0','1'),
(27,0,0,'1','0'),
(5,10,10,'0','1'),
(5,11,11,'0','1'),
(8,15,15,'1','0'),
(8,16,16,'1','0'),
(8,17,17,'1','0'),
(9,9,9,'1','0'),
(9,10,10,'1','0'),
(9,11,11,'1','0'),
(11,7,7,'1','0'),
(11,14,14,'1','0'),
(11,16,16,'1','0'),
(11,17,17,'1','0'),
(12,6,6,'1','0'),
(12,7,7,'1','0'),
(12,8,8,'1','0'),
(12,9,9,'1','0'),
(12,10,10,'1','0'),
(14,0,0,'1','0'),
(14,1,1,'1','0'),
(14,2,2,'1','0'),
(14,3,3,'1','0'),
(14,4,4,'1','0'),
(14,5,5,'1','0'),
(14,6,6,'1','0'),
(14,7,7,'1','0'),
(14,8,8,'1','0'),
(14,9,9,'1','0'),
(14,10,10,'1','0'),
(14,11,11,'1','0'),
(14,12,12,'1','0'),
(14,13,13,'1','0'),
(14,14,14,'1','0'),
(24,0,0,'1','0'),
(24,1,1,'1','0'),
(24,2,2,'1','0'),
(24,3,3,'1','0'),
(24,4,4,'1','0'),
(24,5,5,'1','0'),
(24,6,6,'1','0'),
(24,7,7,'1','0'),
(24,8,8,'1','0'),
(24,9,9,'1','0'),
(24,10,10,'1','0'),
(24,11,11,'1','0'),
(24,12,12,'1','0'),
(24,13,13,'1','0'),
(24,14,14,'1','0'),
(24,15,15,'1','0'),
(24,16,16,'1','0'),
(24,17,17,'1','0'),
(24,18,18,'1','0'),
(24,19,19,'1','0'),
(25,0,0,'1','0'),
(25,1,1,'1','0'),
(25,2,2,'1','0'),
(25,3,3,'1','0'),
(25,4,4,'1','0'),
(25,5,5,'1','0'),
(25,6,6,'1','0'),
(25,7,7,'1','0'),
(25,8,8,'1','0'),
(25,9,9,'1','0'),
(25,10,10,'1','0'),
(25,11,11,'1','0'),
(25,12,12,'1','0'),
(25,13,13,'1','0'),
(25,14,14,'1','0'),
(25,15,15,'1','0'),
(25,16,16,'1','0'),
(25,17,17,'1','0'),
(25,18,18,'1','0'),
(25,19,19,'1','0'),
(28,1,1,'1','0'),
(28,2,2,'1','0'),
(28,3,3,'1','0'),
(28,4,4,'1','0'),
(28,5,5,'1','0'),
(28,6,6,'1','0'),
(28,7,7,'1','0'),
(28,8,8,'1','0'),
(28,9,9,'1','0'),
(28,10,10,'1','0'),
(28,11,11,'1','0'),
(28,12,12,'1','0'),
(28,13,13,'1','0'),
(28,14,14,'1','0'),
(28,15,15,'1','0'),
(28,16,16,'1','0'),
(28,17,17,'1','0'),
(28,18,18,'1','0'),
(28,19,19,'1','0'),
(28,20,20,'1','0'),
(29,1,1,'1','0'),
(29,2,2,'1','0'),
(29,3,3,'1','0'),
(29,4,4,'1','0'),
(29,5,5,'1','0'),
(29,6,6,'1','0'),
(29,7,7,'1','0'),
(29,8,8,'1','0'),
(29,9,9,'1','0'),
(29,10,10,'1','0'),
(29,11,11,'1','0'),
(29,12,12,'1','0'),
(29,13,13,'1','0'),
(29,14,14,'1','0'),
(29,15,15,'1','0'),
(29,16,16,'1','0'),
(29,17,17,'1','0'),
(29,18,18,'1','0'),
(29,19,19,'1','0'),
(29,20,20,'1','0'),
(30,1,1,'1','0'),
(30,2,2,'1','0'),
(30,3,3,'1','0'),
(30,4,4,'1','0'),
(30,5,5,'1','0'),
(30,6,6,'1','0'),
(30,7,7,'1','0'),
(30,8,8,'1','0'),
(30,9,9,'1','0'),
(30,10,10,'1','0'),
(30,11,11,'1','0'),
(30,12,12,'1','0'),
(30,13,13,'1','0'),
(30,14,14,'1','0'),
(30,15,15,'1','0'),
(30,16,16,'1','0'),
(30,17,17,'1','0'),
(30,18,18,'1','0'),
(30,19,19,'1','0'),
(30,20,20,'1','0'),
(31,0,0,'1','0'),
(31,1,1,'1','0'),
(31,2,2,'1','0'),
(31,3,3,'1','0'),
(31,4,4,'1','0'),
(31,5,5,'1','0'),
(31,6,6,'1','0'),
(31,7,7,'1','0'),
(31,8,8,'1','0'),
(31,9,9,'1','0'),
(33,0,0,'1','0'),
(33,1,1,'1','0'),
(33,2,2,'1','0'),
(33,3,3,'1','0'),
(33,4,4,'1','0'),
(33,5,5,'1','0'),
(33,6,6,'1','0'),
(33,7,7,'1','0'),
(33,8,8,'1','0'),
(33,9,9,'1','0'),
(33,10,10,'1','0'),
(33,11,11,'1','0'),
(33,12,12,'1','0'),
(33,13,13,'1','0'),
(33,14,14,'1','0'),
(33,15,15,'1','0'),
(33,16,16,'1','0'),
(33,17,17,'1','0'),
(33,18,18,'1','0'),
(33,19,19,'1','0'),
(33,20,20,'1','0'),
(34,0,0,'1','0'),
(34,1,1,'1','0'),
(34,2,2,'1','0'),
(34,3,3,'1','0'),
(34,4,4,'1','0'),
(34,5,5,'1','0'),
(34,6,6,'1','0'),
(34,7,7,'1','0'),
(34,8,8,'1','0'),
(34,9,9,'1','0'),
(34,10,10,'1','0'),
(34,11,11,'1','0'),
(34,12,12,'1','0'),
(34,13,13,'1','0'),
(34,14,14,'1','0'),
(34,15,15,'1','0'),
(34,16,16,'1','0'),
(34,17,17,'1','0'),
(34,18,18,'1','0'),
(34,19,19,'1','0'),
(27,1,1,'1','0'),
(27,2,2,'1','0'),
(27,3,3,'1','0'),
(27,4,4,'1','0'),
(27,5,5,'1','0'),
(27,6,6,'1','0'),
(27,7,7,'1','0'),
(27,8,8,'1','0'),
(27,9,9,'1','0'),
(27,10,10,'1','0'),
(27,11,11,'1','0'),
(27,12,12,'1','0'),
(27,13,13,'1','0'),
(27,14,14,'1','0'),
(27,15,15,'1','0'),
(27,16,16,'1','0'),
(27,17,17,'1','0'),
(27,18,18,'1','0'),
(27,19,19,'1','0'),
(35,1,1,'1','1'),
(36,1,1,'1','1'),
(37,1,1,'1','1'),
(38,1,1,'1','1'),
(39,40,40,'1','1'),
(40,1,1,'1','1'),
(41,40,40,'1','1'),
(42,1,1,'1','1'),
(43,1,1,'1','1'),
(44,1,1,'1','1'),
(45,1,1,'1','1'),
(46,1,1,'1','1'),
(47,2,2,'1','0'),
(47,4,4,'1','0'),
(47,5,5,'1','0'),
(47,6,6,'1','0'),
(47,7,7,'1','0'),
(47,8,8,'1','0'),
(47,9,9,'1','0'),
(47,10,10,'1','0'),
(47,11,11,'1','0'),
(47,12,12,'1','0'),
(47,13,13,'1','0'),
(47,14,14,'1','0'),
(47,15,15,'1','0'),
(47,16,16,'1','0'),
(47,17,17,'1','0'),
(47,18,18,'1','0'),
(48,1,1,'1','1'),
(49,1,1,'1','1'),
(50,1,1,'1','1'),
(51,1,1,'1','1'),
(52,1,1,'1','1'),
(53,1,1,'1','1'),
(54,1,1,'1','1'),
(55,1,1,'1','1'),
(56,1,1,'1','1'),
(57,1,1,'1','1'),
(58,1,1,'1','1'),
(59,1,1,'1','1'),
(60,1,1,'1','1'),
(61,1,1,'1','1'),
(62,1,1,'1','1'),
(63,1,1,'1','1'),
(35,2,2,'1','0'),
(35,4,4,'1','0'),
(35,5,5,'1','0'),
(35,6,6,'1','0'),
(35,7,7,'1','0'),
(35,8,8,'1','0'),
(35,9,9,'1','0'),
(35,10,10,'1','0'),
(35,11,11,'1','0'),
(35,12,12,'1','0'),
(35,13,13,'1','0'),
(35,14,14,'1','0'),
(35,15,15,'1','0'),
(35,16,16,'1','0'),
(35,17,17,'1','0'),
(35,18,18,'1','1');
/*!40000 ALTER TABLE `pet_races` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pet_transformable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_transformable` (
  `name` varchar(50) NOT NULL,
  `data` varchar(50) NOT NULL COMMENT 'The first number is the pet ID, the rest is what determine the colours, hair etc.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pet_transformable` WRITE;
/*!40000 ALTER TABLE `pet_transformable` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_transformable` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `hardware_id` varchar(255) NOT NULL DEFAULT '0',
  `ip_address` varchar(50) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `player_id_hardware_id_ip_address` (`player_id`,`hardware_id`,`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_access` WRITE;
/*!40000 ALTER TABLE `player_access` DISABLE KEYS */;
INSERT INTO `player_access` VALUES
(27,1,'','0.0.0.0',1789409923),
(28,1,'','0.0.0.0',1789410148),
(29,2,'','0.0.0.0',1789410387),
(30,3,'','0.0.0.0',1789411318),
(31,3,'','0.0.0.0',1789412082),
(32,3,'','0.0.0.0',1789412697),
(33,3,'','0.0.0.0',1789412984),
(34,3,'','0.0.0.0',1789413100),
(35,3,'','0.0.0.0',1789413229),
(36,2,'','131.161.229.157',1789415810),
(37,3,'','0.0.0.0',1789415872),
(38,2,'','131.161.229.157',1789415931),
(39,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789416055),
(40,3,'','0.0.0.0',1789416152),
(41,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789416193),
(42,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789416230),
(43,3,'','0.0.0.0',1789417681),
(44,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789417728),
(45,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789417742),
(46,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789417927),
(47,3,'','0.0.0.0',1789418240),
(48,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789418273),
(49,3,'','0.0.0.0',1789418309),
(50,3,'','0.0.0.0',1789418372),
(51,3,'','0.0.0.0',1789418376),
(52,3,'','0.0.0.0',1789418396),
(53,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789418503),
(54,3,'','0.0.0.0',1789418605),
(55,3,'','0.0.0.0',1789419166),
(56,3,'','0.0.0.0',1789419567),
(57,3,'','0.0.0.0',1789419614),
(58,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789419728),
(59,3,'','0.0.0.0',1789420109),
(60,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789420169),
(61,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789420183),
(62,3,'','0.0.0.0',1789420772),
(63,3,'','0.0.0.0',1789420780),
(64,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789420835),
(65,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789420847),
(66,3,'','0.0.0.0',1789421496),
(67,3,'','0.0.0.0',1789421502),
(68,3,'','0.0.0.0',1789421585),
(69,2,'','2804:6a84:1047:9b00:5cf:6944:7d8e:bf57',1789421704),
(70,3,'','0.0.0.0',1789421902),
(71,3,'','0.0.0.0',1789421954),
(72,1,'','0.0.0.0',1789422040),
(73,2,'','131.161.229.157',1789502867),
(74,3,'','0.0.0.0',1789503025),
(75,3,'','0.0.0.0',1789503623),
(76,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789503798),
(77,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789504070),
(78,3,'','0.0.0.0',1789504126),
(79,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789504150),
(80,3,'','0.0.0.0',1789504266),
(81,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789504270),
(82,3,'','0.0.0.0',1789504398),
(83,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789505982),
(84,2,'','179.160.223.214',1789506028),
(85,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789506326),
(86,3,'','0.0.0.0',1789510227),
(87,2,'','200.169.48.9',1789510360),
(88,3,'','0.0.0.0',1789512605),
(89,2,'','200.169.48.9',1789512712),
(90,2,'','200.169.48.9',1789512753),
(91,3,'','0.0.0.0',1789512805),
(92,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789512905),
(93,2,'','200.169.48.9',1789512932),
(94,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789512935),
(95,2,'','200.169.48.9',1789512950),
(96,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789513037),
(97,2,'','200.169.48.9',1789513054),
(98,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789513057),
(99,2,'','200.169.48.9',1789513072),
(100,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789513074),
(101,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789513535),
(102,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789513543),
(103,3,'','0.0.0.0',1789513544),
(104,3,'','0.0.0.0',1789513838),
(105,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789513870),
(106,3,'','0.0.0.0',1789514412),
(107,3,'','0.0.0.0',1789514565),
(108,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789514666),
(109,3,'','0.0.0.0',1789514858),
(110,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789514861),
(111,3,'','0.0.0.0',1789515148),
(112,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789515176),
(113,2,'','2804:328:d01c:3500:e428:68a7:e370:d591',1789515459),
(114,2,'','200.169.48.9',1789515482),
(115,2,'','2804:328:d01c:3500:e428:68a7:e370:d591',1789515486),
(116,3,'','0.0.0.0',1789516288),
(117,2,'','2804:328:d01c:3500:e428:68a7:e370:d591',1789516313),
(118,3,'','0.0.0.0',1789520779),
(119,2,'','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9',1789520835);
/*!40000 ALTER TABLE `player_access` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_achievements` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `group` varchar(50) NOT NULL DEFAULT '',
  `level` tinyint(4) NOT NULL DEFAULT 1,
  `progress` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `player_id_group` (`player_id`,`group`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_achievements` WRITE;
/*!40000 ALTER TABLE `player_achievements` DISABLE KEYS */;
INSERT INTO `player_achievements` VALUES
(1,'ACH_AllTimeHotelPresence',2,99),
(1,'ACH_FriendListSize',1,0),
(1,'ACH_RegistrationDuration',1,0),
(2,'ACH_AllTimeHotelPresence',3,277),
(2,'ACH_AvatarLooks',1,1),
(2,'ACH_FriendListSize',1,0),
(2,'ACH_RegistrationDuration',2,1),
(2,'ACH_RoomEntry',5,38),
(3,'ACH_AllTimeHotelPresence',5,645),
(3,'ACH_AvatarLooks',1,1),
(3,'ACH_FriendListSize',1,0),
(3,'ACH_Motto',1,1),
(3,'ACH_RegistrationDuration',2,1),
(3,'ACH_RoomEntry',6,49),
(5,'ACH_AllTimeHotelPresence',1,29),
(5,'ACH_FriendListSize',1,0),
(5,'ACH_RegistrationDuration',1,0),
(5,'ACH_RoomEntry',2,8),
(6,'ACH_AllTimeHotelPresence',1,17),
(6,'ACH_FriendListSize',1,0),
(6,'ACH_RegistrationDuration',1,0),
(6,'ACH_RoomEntry',1,1);
/*!40000 ALTER TABLE `player_achievements` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `badge_code` varchar(50) DEFAULT '',
  `slot` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `player_id_badge_code` (`player_id`,`badge_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_badges` WRITE;
/*!40000 ALTER TABLE `player_badges` DISABLE KEYS */;
INSERT INTO `player_badges` VALUES
(1,5,'ACH_RoomEntry1',0),
(2,3,'ACH_AllTimeHotelPresence4',0),
(3,3,'ACH_RoomEntry5',0),
(4,3,'ACH_RegistrationDuration1',0),
(5,3,'ACH_AvatarLooks1',0),
(6,3,'ACH_Motto1',0),
(7,2,'ACH_AvatarLooks1',0),
(8,2,'ACH_RoomEntry4',0),
(9,2,'ACH_AllTimeHotelPresence2',0),
(10,1,'ACH_AllTimeHotelPresence1',0),
(11,2,'ACH_RegistrationDuration1',0);
/*!40000 ALTER TABLE `player_badges` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(256) DEFAULT 'default',
  `player_id` int(11) DEFAULT NULL,
  `status` enum('1','0') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_banner` WRITE;
/*!40000 ALTER TABLE `player_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_banner` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `day` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_calendar` WRITE;
/*!40000 ALTER TABLE `player_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_calendar` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_clothing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_clothing` WRITE;
/*!40000 ALTER TABLE `player_clothing` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_clothing` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_effects` (
  `player_id` int(11) NOT NULL,
  `effect_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`effect_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_effects` WRITE;
/*!40000 ALTER TABLE `player_effects` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_effects` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_favourite_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_favourite_rooms` (
  `player_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_favourite_rooms` WRITE;
/*!40000 ALTER TABLE `player_favourite_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_favourite_rooms` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_mistery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_mistery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `mistery_key` varchar(50) DEFAULT '',
  `mistery_box` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `player_id_badge_code` (`player_id`,`mistery_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_mistery` WRITE;
/*!40000 ALTER TABLE `player_mistery` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_mistery` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_navigator_view_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_navigator_view_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `view_mode` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `player_id_category` (`player_id`,`category`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_navigator_view_modes` WRITE;
/*!40000 ALTER TABLE `player_navigator_view_modes` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_navigator_view_modes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo` (`photo`),
  KEY `player_id` (`player_id`),
  KEY `room_id` (`room_id`),
  KEY `player_id_room_id` (`player_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_photos` WRITE;
/*!40000 ALTER TABLE `player_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_photos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_quest_progression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_quest_progression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT 0,
  `quest_id` int(11) DEFAULT 0,
  `progress` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `quest_id` (`quest_id`),
  KEY `playerId_questId` (`player_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_quest_progression` WRITE;
/*!40000 ALTER TABLE `player_quest_progression` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_quest_progression` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_recent_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_recent_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0,
  `delivred_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_recent_gift` WRITE;
/*!40000 ALTER TABLE `player_recent_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_recent_gift` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_recent_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_recent_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `catalog_item` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `data` varchar(255) NOT NULL DEFAULT '',
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_recent_purchases` WRITE;
/*!40000 ALTER TABLE `player_recent_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_recent_purchases` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `level` enum('bobba','smile','heart','poop') DEFAULT 'smile',
  `partner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_relationships` WRITE;
/*!40000 ALTER TABLE `player_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_relationships` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_room_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_room_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `time_enter` int(11) NOT NULL DEFAULT 0,
  `time_exit` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_room_visits` WRITE;
/*!40000 ALTER TABLE `player_room_visits` DISABLE KEYS */;
INSERT INTO `player_room_visits` VALUES
(1,2,2,1789410458,0),
(2,3,2,1789411445,1789411873),
(3,3,3,1789411873,1789411892),
(4,3,3,1789411892,1789411895),
(5,3,2,1789411895,0),
(6,3,3,1789412139,1789412141),
(7,3,2,1789412155,0),
(8,3,2,1789412736,0),
(9,3,2,1789413000,0),
(10,3,2,1789413116,0),
(11,3,2,1789413250,1789413995),
(12,3,3,1789416172,1789416242),
(13,2,3,1789416197,1789416229),
(14,2,3,1789416234,1789416264),
(15,3,3,1789416242,1789416256),
(16,3,2,1789416256,1789417681),
(17,2,2,1789416264,1789417617),
(18,3,3,1789417685,1789417807),
(19,2,3,1789417748,1789417798),
(20,2,3,1789417799,1789417802),
(21,2,3,1789417803,1789417927),
(22,3,3,1789417807,1789417991),
(23,2,3,1789417932,1789418271),
(24,3,3,1789417991,1789418240),
(25,3,3,1789418259,0),
(26,3,3,1789418314,1789418372),
(27,3,3,1789418380,1789418396),
(28,3,3,1789418431,1789418538),
(29,2,3,1789418508,1789418739),
(30,3,3,1789418623,0),
(31,3,3,1789419171,0),
(32,3,3,1789419573,1789419614),
(33,3,3,1789419658,1789419855),
(34,2,3,1789419734,0),
(35,3,3,1789419855,0),
(36,3,3,1789420112,1789420136),
(37,3,3,1789420136,1789420198),
(38,2,3,1789420173,1789420182),
(39,2,3,1789420188,1789420454),
(40,3,3,1789420198,1789420267),
(41,3,3,1789420267,0),
(42,2,3,1789420454,1789420759),
(43,3,3,1789420808,0),
(44,2,3,1789421016,1789421482),
(45,3,3,1789421507,1789421585),
(46,3,3,1789421615,1789421715),
(47,2,3,1789421711,1789421887),
(48,3,3,1789421726,1789421729),
(49,3,3,1789421766,0),
(50,3,3,1789421909,1789421954),
(51,3,3,1789422018,1789427625),
(52,2,2,1789503005,0),
(53,3,2,1789503093,0),
(54,3,3,1789503647,1789504058),
(55,2,3,1789503803,0),
(56,3,3,1789504058,0),
(57,2,3,1789504083,1789504149),
(58,3,3,1789504148,0),
(59,2,3,1789504154,0),
(60,3,3,1789504269,1789504273),
(61,3,3,1789504273,1789504395),
(62,2,3,1789504273,1789505982),
(63,3,3,1789504402,1789509510),
(64,2,3,1789505985,1789506013),
(65,2,3,1789506033,1789506326),
(66,2,3,1789506330,1789509433),
(67,3,3,1789510234,1789510315),
(68,3,3,1789510317,1789510689),
(69,2,3,1789510366,1789510689),
(70,3,3,1789510689,0),
(71,2,3,1789510689,0),
(72,3,3,1789512608,1789512662),
(73,3,3,1789512662,1789512679),
(74,3,3,1789512679,1789512688),
(75,3,3,1789512688,1789512735),
(76,2,3,1789512720,1789512736),
(77,3,3,1789512735,0),
(78,2,3,1789512736,0),
(79,3,3,1789512808,1789512811),
(80,3,3,1789512811,1789513346),
(81,2,3,1789512825,1789512905),
(82,2,3,1789512913,1789512932),
(83,2,3,1789512939,1789512950),
(84,2,3,1789512982,1789513037),
(85,2,3,1789513041,1789513054),
(86,2,3,1789513061,1789513072),
(87,2,3,1789513079,0),
(88,3,3,1789513346,0),
(89,3,3,1789513550,1789513557),
(90,2,3,1789513553,1789513557),
(91,3,3,1789513557,0),
(92,2,3,1789513557,0),
(93,3,3,1789513880,1789513883),
(94,3,3,1789513883,0),
(95,2,3,1789513895,0),
(96,3,3,1789514570,1789514675),
(97,2,3,1789514671,1789514675),
(98,3,3,1789514675,0),
(99,2,3,1789514675,0),
(100,3,3,1789514862,1789514870),
(101,2,3,1789514866,1789514870),
(102,3,3,1789514870,0),
(103,2,3,1789514870,0),
(104,3,3,1789515155,1789515861),
(105,2,3,1789515221,1789515432),
(106,2,3,1789515469,1789515482),
(107,2,3,1789515490,1789515861),
(108,3,3,1789515861,0),
(109,2,3,1789515861,0),
(110,3,3,1789516291,1789516294),
(111,3,3,1789516294,0),
(112,2,3,1789516317,1789517267),
(113,3,3,1789520783,1789520787),
(114,3,3,1789520787,1789520949),
(115,2,3,1789520839,1789520949),
(116,3,3,1789520949,0),
(117,2,3,1789520949,0);
/*!40000 ALTER TABLE `player_room_visits` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_saved_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_saved_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT 0,
  `view` varchar(50) DEFAULT 'myworld_view',
  `search_query` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_saved_searches` WRITE;
/*!40000 ALTER TABLE `player_saved_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_saved_searches` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `allow_follow` enum('1','0') NOT NULL DEFAULT '1',
  `volume` text DEFAULT '{"systemVolume":3,"furniVolume":3,"traxVolume":3}',
  `personal_pin` varchar(50) NOT NULL DEFAULT '2503',
  `hide_online` enum('1','0') DEFAULT '0',
  `hide_inroom` enum('1','0') DEFAULT '0',
  `allow_friend_requests` enum('1','0') DEFAULT '1',
  `allow_trade` enum('1','0') DEFAULT '1',
  `home_room` int(11) DEFAULT 9,
  `wardrobe` text DEFAULT NULL,
  `playlist` text DEFAULT NULL,
  `chat_oldstyle` enum('1','0') DEFAULT '0',
  `follow_friend_mode` enum('EVERYBODY','FRIENDS','NOBODY') DEFAULT 'EVERYBODY',
  `ignore_invites` enum('1','0') DEFAULT '0',
  `allow_mimic` enum('1','0') DEFAULT '1',
  `navigator_x` int(11) DEFAULT 68,
  `navigator_y` int(11) DEFAULT 42,
  `navigator_width` int(11) DEFAULT 425,
  `navigator_height` int(11) DEFAULT 592,
  `navigator_show_searches` enum('1','0') DEFAULT '1',
  `ignore_events` enum('1','0') DEFAULT '0',
  `disable_whisper` enum('1','0') DEFAULT '0',
  `send_login_notif` enum('1','0') DEFAULT '0',
  `mention_type` enum('ALL','FRIENDS','NONE') NOT NULL DEFAULT 'FRIENDS',
  `personalstaff` enum('0','1') DEFAULT '0',
  `claimed_goal` enum('1','0') NOT NULL DEFAULT '0',
  `nux` int(11) NOT NULL DEFAULT 0,
  `camera_follow` enum('1','0') DEFAULT '1',
  `bubble_id` int(11) DEFAULT 0,
  `hc_gifts_claimed` int(11) NOT NULL DEFAULT 0,
  `feed_only_friends_can_mark` tinyint(1) NOT NULL DEFAULT 0,
  `feed_only_friends_can_comment` tinyint(1) NOT NULL DEFAULT 0,
  `citizen_level` int(11) NOT NULL DEFAULT 0,
  `helper_level` int(11) NOT NULL DEFAULT 0,
  `join_type` enum('flash24','flash60','nitro24','nitro60') DEFAULT NULL,
  `disable_hotel_alerts` enum('1','0') DEFAULT '0',
  `disable_hotel_alerts_links` enum('1','0') DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `avatar_setting` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_settings` WRITE;
/*!40000 ALTER TABLE `player_settings` DISABLE KEYS */;
INSERT INTO `player_settings` VALUES
(1,1,'1','{\"systemVolume\":3,\"furniVolume\":3,\"traxVolume\":3}','2503','0','0','1','1',9,NULL,NULL,'0','EVERYBODY','0','1',68,42,425,592,'1','0','0','0','FRIENDS','0','0',0,'1',0,0,0,0,0,0,NULL,'0','0'),
(2,2,'1','{\"systemVolume\":3,\"furniVolume\":3,\"traxVolume\":3}','2503','0','0','1','1',9,NULL,NULL,'0','EVERYBODY','0','1',68,42,425,592,'1','0','0','0','FRIENDS','0','0',0,'1',-1,0,0,0,0,0,NULL,'0','0'),
(3,3,'1','{\"systemVolume\":3,\"furniVolume\":3,\"traxVolume\":3}','2503','0','0','1','1',9,NULL,NULL,'0','EVERYBODY','0','1',68,42,425,592,'1','0','0','0','FRIENDS','0','0',0,'1',-1,0,0,0,0,0,NULL,'0','0');
/*!40000 ALTER TABLE `player_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_songs` WRITE;
/*!40000 ALTER TABLE `player_songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_songs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_spec` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `birthday_1` varchar(2) NOT NULL,
  `birthday_2` varchar(2) NOT NULL,
  `birthday_3` varchar(4) NOT NULL,
  `happyB` int(11) NOT NULL DEFAULT 0,
  `happyBY` int(11) NOT NULL DEFAULT 0,
  `activated1` enum('0','1') NOT NULL DEFAULT '0',
  `username` varchar(250) NOT NULL,
  `userpo_referidos` int(11) NOT NULL DEFAULT 0,
  `country` text DEFAULT NULL,
  `radio` varchar(100) NOT NULL DEFAULT 'autoplay',
  `publi` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `guia` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `tarea` varchar(50) NOT NULL DEFAULT '0',
  `croupier` enum('0','1') NOT NULL DEFAULT '0',
  `mastertrade` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `cms_signature` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `redes` enum('0','1','2') NOT NULL DEFAULT '1',
  `diamantes` enum('0','1','2') NOT NULL DEFAULT '1',
  `duckets` enum('0','1','2') NOT NULL DEFAULT '1',
  `puntoshonor` enum('0','1','2') NOT NULL DEFAULT '1',
  `placasperfil` enum('0','1','2') NOT NULL DEFAULT '1',
  `amigos` enum('0','1','2') NOT NULL DEFAULT '1',
  `salas` enum('0','1','2') NOT NULL DEFAULT '1',
  `libro` enum('0','1','2') NOT NULL DEFAULT '1',
  `perfil` enum('0','1','2') NOT NULL DEFAULT '1',
  `color` varchar(500) NOT NULL DEFAULT '#e6c873',
  `colorcinta` varchar(500) NOT NULL DEFAULT '#806f40',
  `cde` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `pre` enum('0','1','2','3') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_spec` WRITE;
/*!40000 ALTER TABLE `player_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spec` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `achievement_score` int(11) DEFAULT 0,
  `total_respect_points` int(11) DEFAULT 0,
  `daily_respects` int(11) DEFAULT 3,
  `daily_scratches` int(11) DEFAULT 3,
  `help_tickets` int(11) DEFAULT 0,
  `cautions` int(11) DEFAULT 0,
  `help_tickets_abusive` int(11) DEFAULT 0,
  `bans` int(11) DEFAULT 0,
  `last_daily_update` int(11) DEFAULT 0,
  `trade_lock` int(11) DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `kisses_amount` int(11) NOT NULL DEFAULT 0,
  `total_kisses_received` int(11) NOT NULL DEFAULT 0,
  `total_kisses_sent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_stats` WRITE;
/*!40000 ALTER TABLE `player_stats` DISABLE KEYS */;
INSERT INTO `player_stats` VALUES
(1,5,0,0,3,3,0,0,0,0,0,0,0,0,0,0),
(2,3,0,0,3,3,0,0,0,0,0,0,0,0,0,0),
(3,6,0,0,3,3,0,0,0,0,0,0,0,0,0,0),
(4,1,0,0,3,3,0,0,0,0,0,0,0,0,0,0),
(5,2,0,0,3,3,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `player_stats` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT 'habbo_vip',
  `start` int(11) DEFAULT 0,
  `expire` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `presents` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_subscriptions` WRITE;
/*!40000 ALTER TABLE `player_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `tag` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_tags` WRITE;
/*!40000 ALTER TABLE `player_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_tags` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `player_target_offer_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_target_offer_purchases` (
  `player_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_purchase` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `use_id` (`player_id`,`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `player_target_offer_purchases` WRITE;
/*!40000 ALTER TABLE `player_target_offer_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_target_offer_purchases` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) DEFAULT 'Avatar',
  `figure` varchar(255) DEFAULT 'hr-828-31.ch-255-82.sh-3089-64.hd-180-10.lg-3058-64',
  `motto` varchar(100) DEFAULT '',
  `credits` int(11) DEFAULT 5000,
  `vip_points` int(11) DEFAULT 0,
  `activity_points` int(11) NOT NULL DEFAULT 0,
  `seasonal_points` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) DEFAULT 1,
  `hidden_staff` tinyint(1) NOT NULL DEFAULT 0,
  `auth_ticket` varchar(100) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `reg_timestamp` int(11) NOT NULL DEFAULT 0,
  `reg_date` varchar(12) DEFAULT '18/11/2021',
  `last_online` int(11) DEFAULT 0,
  `online` enum('1','0') DEFAULT '0',
  `password` varchar(72) DEFAULT '',
  `email` varchar(72) DEFAULT '',
  `last_ip` varchar(120) DEFAULT NULL,
  `reg_ip` varchar(120) DEFAULT NULL,
  `vip` enum('1','0') DEFAULT '0',
  `achievement_points` int(11) DEFAULT 0,
  `favourite_group` int(11) DEFAULT 0,
  `quest_id` int(11) DEFAULT 0,
  `time_muted` int(11) DEFAULT 0,
  `name_colour` varchar(256) DEFAULT '000000',
  `pin` varchar(8) DEFAULT NULL,
  `emoji_enabled` enum('0','1') DEFAULT '0',
  `bonus_points` int(11) NOT NULL DEFAULT 0,
  `snow_xp` int(11) NOT NULL DEFAULT 0,
  `tag_colour` varchar(256) DEFAULT '000000',
  `tag` varchar(256) DEFAULT '',
  `games_win` int(11) DEFAULT 0,
  `xp_points` int(11) NOT NULL DEFAULT 0,
  `kisses` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `endvip_timestamp` int(11) DEFAULT NULL,
  `xp` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `is_beta` tinyint(1) NOT NULL DEFAULT 0,
  `beta_code` varchar(64) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `banner` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES
(1,'Eu','hr-828-31.ch-255-82.sh-3089-64.hd-180-10.lg-3058-64','Teste local',51800,0,95,0,7,0,'localtest','M',1789408878,'14/09/2026',1789422040,'0','','','0.0.0.0','127.0.0.1','0',10,0,0,0,'000000',NULL,'0',0,0,'000000','',0,0,0,NULL,0,0,0,0,NULL,NULL,''),
(2,'Amigo','hr-110-61.hd-3094-30.lg-3058-64.ch-876-82-1408.sh-3089-64','Teste local',52800,0,300,0,1,0,'localfriend','M',1789408878,'14/09/2026',1789520835,'1','','','2804:6a84:1047:9b00:3c81:dc92:b395:e3c9','127.0.0.1','0',125,0,0,0,'000000',NULL,'0',0,0,'000000','',0,0,0,NULL,0,0,0,0,NULL,NULL,''),
(3,'Jogador1','hd-209-10.lg-3058-64.ch-215-92.sh-3089-64','aa',57000,0,695,0,1,0,'localplayer1','M',1789411203,'14/09/2026',1789520779,'1','','','0.0.0.0','127.0.0.1','0',205,0,0,0,'000000',NULL,'0',0,0,'000000','',0,0,0,NULL,0,0,0,0,NULL,NULL,'');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` enum('promos','events','radio') NOT NULL DEFAULT 'events',
  `points` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_points` WRITE;
/*!40000 ALTER TABLE `players_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_points` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `media_attributes` text DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `room_id` bigint(20) unsigned DEFAULT NULL,
  `sharedPost_id` bigint(20) unsigned NOT NULL,
  `fixed` tinyint(1) NOT NULL DEFAULT 0,
  `likeCount` int(11) NOT NULL DEFAULT 0,
  `sharedCount` int(11) NOT NULL DEFAULT 0,
  `commentCount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_for_all` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_posts` WRITE;
/*!40000 ALTER TABLE `players_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_posts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_posts_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_posts_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `likeCount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_posts_comments` WRITE;
/*!40000 ALTER TABLE `players_posts_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_posts_comments` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_posts_comments_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_posts_comments_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_posts_comments_likes` WRITE;
/*!40000 ALTER TABLE `players_posts_comments_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_posts_comments_likes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_posts_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_posts_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_posts_likes` WRITE;
/*!40000 ALTER TABLE `players_posts_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_posts_likes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_posts_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_posts_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_posts_questions` WRITE;
/*!40000 ALTER TABLE `players_posts_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_posts_questions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_posts_questions_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_posts_questions_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `players_posts_questions_replies` WRITE;
/*!40000 ALTER TABLE `players_posts_questions_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_posts_questions_replies` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `players_session_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_session_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `ip` varchar(100) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `browser` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT 'Untitled Poll',
  `thanks_message` varchar(100) NOT NULL DEFAULT 'Thanks!',
  `reward_badge` varchar(100) NOT NULL DEFAULT 'US8',
  `reward_credits` int(11) NOT NULL DEFAULT 0,
  `reward_vip_points` int(11) NOT NULL DEFAULT 0,
  `reward_activity_points` int(11) NOT NULL DEFAULT 0,
  `reward_achievement_points` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `polls_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) DEFAULT 0,
  `question_id` int(11) DEFAULT 0,
  `player_id` int(11) DEFAULT 0,
  `answer` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `poll_id_question_id_player_id` (`poll_id`,`question_id`,`player_id`),
  KEY `player_id` (`player_id`),
  KEY `poll_id` (`poll_id`),
  KEY `poll_id_question_id` (`poll_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `polls_answers` WRITE;
/*!40000 ALTER TABLE `polls_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_answers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `polls_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `question_type` enum('WORDED','MULTIPLE_CHOICE','SINGLE_CHOICE') NOT NULL DEFAULT 'WORDED',
  `question` varchar(100) NOT NULL DEFAULT 'What do you think of Comet Server?',
  `options` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `polls_questions` WRITE;
/*!40000 ALTER TABLE `polls_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_questions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL DEFAULT '',
  `series_number` int(11) NOT NULL DEFAULT 0,
  `goal_type` int(11) NOT NULL DEFAULT 0,
  `goal_data` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `reward` varchar(50) NOT NULL DEFAULT '10',
  `badge_id` varchar(50) NOT NULL DEFAULT '',
  `reward_type` enum('ACHIEVEMENT_POINTS','VIP_POINTS','ACTIVITY_POINTS','CREDITS','BADGE') NOT NULL DEFAULT 'ACTIVITY_POINTS',
  `data_bit` varchar(2) NOT NULL DEFAULT '',
  `enabled` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nameUnique` (`name`),
  KEY `nameKey` (`name`),
  KEY `categoryKey` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `quests` WRITE;
/*!40000 ALTER TABLE `quests` DISABLE KEYS */;
INSERT INTO `quests` VALUES
(1,'room_builder',1,0,3,'MOVEITEM','10','','ACTIVITY_POINTS','_2','1'),
(2,'social',1,8,1,'ENTEROTHERSROOM','10','','ACTIVITY_POINTS','_2','1'),
(3,'identity',1,14,1,'CHANGEFIGURE','10','','ACTIVITY_POINTS','_2','1'),
(4,'explore',1,17,904,'FINDLIFEGUARDTOWER','10','','ACTIVITY_POINTS','_2','1'),
(5,'room_builder',2,1,3,'ROTATEITEM','10','','ACTIVITY_POINTS','','1'),
(6,'room_builder',3,2,1,'PLACEITEM','10','','ACTIVITY_POINTS','','1'),
(7,'room_builder',4,3,1,'PICKUPITEM','10','','ACTIVITY_POINTS','','1'),
(8,'room_builder',5,4,2,'SWITCHSTATE','10','','ACTIVITY_POINTS','','1'),
(9,'room_builder',6,5,1,'STACKITEM','10','','ACTIVITY_POINTS','','1'),
(10,'room_builder',7,6,1,'PLACEFLOOR','10','','ACTIVITY_POINTS','','1'),
(11,'room_builder',8,7,1,'PLACEWALLPAPER','10','','ACTIVITY_POINTS','_1','1'),
(12,'identity',2,15,1,'CHANGEMOTTO','10','','ACTIVITY_POINTS','','1'),
(13,'identity',3,16,1,'WEARBADGE','10','','ACTIVITY_POINTS','','1'),
(14,'social',2,9,1,'CHATWITHSOMEONE','10','','ACTIVITY_POINTS','','1'),
(15,'social',3,10,1,'REQUESTFRIEND','10','','ACTIVITY_POINTS','','1'),
(16,'social',4,11,1,'GIVERESPECT','10','','ACTIVITY_POINTS','','1'),
(17,'social',5,12,1,'DANCE','10','','ACTIVITY_POINTS','','1'),
(18,'social',6,13,1,'WAVE','10','','ACTIVITY_POINTS','','1'),
(19,'explore',2,17,898,'SWIM','10','','ACTIVITY_POINTS','','1'),
(20,'explore',3,17,896,'FINDSURFBOARD','10','','ACTIVITY_POINTS','','1'),
(21,'explore',4,17,923,'FINDBEETLE','10','','ACTIVITY_POINTS','','1'),
(22,'explore',5,17,5679,'FINDNEONFLOOR','10','','ACTIVITY_POINTS','','1'),
(23,'explore',6,17,5685,'FINDDISCOBALL','10','','ACTIVITY_POINTS','','1'),
(24,'explore',7,17,5770,'FINDJUKEBOX','10','','ACTIVITY_POINTS','','1'),
(25,'explore',8,17,1808,'FINDBBGATE','10','','ACTIVITY_POINTS','','1'),
(26,'explore',9,17,1783,'FINDBBTILE','10','','ACTIVITY_POINTS','','1'),
(27,'explore',10,17,1781,'FINDBBTELEPORT','10','','ACTIVITY_POINTS','','1'),
(28,'explore',11,17,1766,'FINDFREEZEGATE','10','','ACTIVITY_POINTS','','1'),
(29,'explore',12,17,1770,'FINDFREEZESCOREBOARD','10','','ACTIVITY_POINTS','','1'),
(30,'explore',13,17,1761,'FINDFREEZEEXITTILE','10','','ACTIVITY_POINTS','','1'),
(31,'explore',14,18,1776,'ICESKATE','10','','ACTIVITY_POINTS','','1'),
(32,'explore',15,17,1780,'FINDTAGPOLE','10','','ACTIVITY_POINTS','','1'),
(33,'explore',16,18,1772,'ROLLERSKATE','10','','ACTIVITY_POINTS','','1');
/*!40000 ALTER TABLE `quests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `recycler_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recycler_prizes` (
  `rarity` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `recycler_prizes` WRITE;
/*!40000 ALTER TABLE `recycler_prizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recycler_prizes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `room_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `expire_timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `room_id_expire_timestamp` (`room_id`,`expire_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `room_bans` WRITE;
/*!40000 ALTER TABLE `room_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_bans` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `room_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_bundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` enum('1','0') NOT NULL DEFAULT '1',
  `alias` varchar(255) DEFAULT 'roombundle',
  `room_id` int(11) DEFAULT NULL,
  `model_data` text DEFAULT NULL,
  `bundle_data` text DEFAULT NULL,
  `cost_credits` int(11) DEFAULT 20,
  `cost_seasonal` int(11) DEFAULT 0,
  `cost_vip` int(11) DEFAULT 0,
  `room_config` text DEFAULT NULL,
  `cost_activity_points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `room_bundles` WRITE;
/*!40000 ALTER TABLE `room_bundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_bundles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `room_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_models` (
  `id` varchar(100) NOT NULL,
  `door_x` int(11) NOT NULL,
  `door_y` int(11) NOT NULL,
  `door_z` double NOT NULL,
  `door_dir` int(11) NOT NULL DEFAULT 2,
  `heightmap` text NOT NULL,
  `public_items` text NOT NULL,
  `club_only` enum('0','1') NOT NULL DEFAULT '0',
  `poolmap` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `room_models` WRITE;
/*!40000 ALTER TABLE `room_models` DISABLE KEYS */;
INSERT INTO `room_models` VALUES
('cinema_a',20,27,1,0,'xxxxxxx1xx11111111xxxxxx\r\nxxx1111111111111111xxxxx\r\nxxx111xxxx1111111111xxxx\r\nxxxx2xxxxxxxxxxxxxxxxxxx\r\nxx3x3x333311xxxxxxxxxx11\r\nxx3333333311111111111111\r\nxx3333333311111111111111\r\nxx3333333311111111122111\r\nxx3333333311x22222222111\r\nxx3333333311x22222222111\r\nxx3333333311xxxxxxxxx111\r\nxx3333333311111111111111\r\nxx3333333311111111111111\r\nxx3333333311111111111111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\n333333332111111xxxx11111\r\n333333332111111111111111\r\n333333332111111111111111\r\n333333332111111111111111\r\nxx3333332111111111111111\r\nxxxxxxxxxxxxxxxxxxx11111\r\nxxxxxxxxxxxxxxxxxxx11111\r\nxxxxxxxxxxxxxxxxxxx11111','PUHC42orangeJPAKHHA47loungey_chairSAPAKJHV48loungey_tablebigbPBPAKHHA49loungey_chairQBPAKRAHA52loungey_chairJQAKPAHA57loungey_chairSAQAKJHU58loungey_tablebigaPBQAKHHA59loungey_chairQBQAKRAHB62loungey_tableJRAKHHA72loungey_chairJSAKHHh713theater_chairQCSAIHHh714theater_chairRCSAIHHh715theater_chairSCSAIHHh716theater_chairPDSAIHHh717theater_chairQDSAIHHh718theater_chairRDSAIHHz721stairQESAIHHL89lightpoleQBPBKHHq813pomomaskiQCPBJJHq814pomomaskiRCPBJHHq815pomomaskiSCPBJHHq816pomomaskiPDPBJHHq817pomomaskiQDPBJHHq818pomomaskiRDPBJHHq819pomomaskiSDPBJIHz821stairQEPBIHHC92orangeJQBKHHh913theater_chairQCQBJHHh914theater_chairRCQBJHHh915theater_chairSCQBJHHh916theater_chairPDQBJHHh917theater_chairQDQBJHHh918theater_chairRDQBJHHh919theater_chairSDQBJHHh920theater_chairPEQBJHHz921stairQEQBIHHA102loungey_chairJRBKPAHA109loungey_chairQBRBKPAHB112loungey_tableJSBKHHB119loungey_tableQBSBKHHA122loungey_chairJPCKHHA129loungey_chairQBPCKHHd1217cubicb_chairQDPCIRAHc1219cubico_chairSDPCIJHd1315cubicb_chairSCQCIJHL1319lightpoleSDQCIHHd1320cubicb_chairPEQCIRAHL149lightpoleQBRCKHHA152loungey_chairJSCKPAHd1514cubicb_chairRCSCIPAHc1519cubico_chairSDSCIPAHB162loungey_tableJPDKHHA167loungey_chairSAPDKJHB168loungey_tablePBPDKJHA169loungey_chairQBPDKRAHd1613cubicb_chairQCPDIJHd1614cubicb_chairRCPDIRAHC1619orangeSDPDIHHA172loungey_chairJQDKHHA177loungey_chairSAQDKJHB178loungey_tablePBQDKJHA179loungey_chairQBQDKRAHd1719cubicb_chairSDQDIJHC182orangeJRDKHHd1814cubicb_chairRCRDIPAHK192bardesqueJSDKHHK202bardesqueJPEKIHb203bar_chairKPEKRAHL209lightpoleQBPEKHHd2014cubicb_chairRCPEIHHd2019cubicb_chairSDPEIJHc2020cubico_chairPEPEIRAHK212bardesqueJQEKIHb213bar_chairKQEKRAHd2119cubicb_chairSDQEIHHK222bardesqueJREKIHb223bar_chairKREKRAHL2216lightpolePDREIHHc2218cubico_chairRDREIHHK232bardesqueJSEKIHb233bar_chairKSEKRAHK242bardesqueJPFKIHb243bar_chairKPFKRAHK252bardesqueJQFKJ','0',NULL),
('custom_model',0,0,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx0000000000000xxxx\r\nxxxxxxxxxxx000000000000000xxx\r\nxxxxxxxxxx00000000000000000xx\r\nxxxxxxxxxx00000000000000000xx\r\nxxxxxxxxxx00000000000000000xx\r\nxxxxxxxxxx11111111111111111xx\r\nxxxxxxxxxx22222222222222222xx\r\nxxxxxxxxxx22222222222222222xx\r\nxxxxxxxxxx22222222222222222xx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('dusty_lounge',14,1,2,4,'xxxxxxxxxxxxxx22xxxxxxxxxxxxx\r\nxxxxxxxxxx222x222x2xxxxxxxxxx\r\nxxxxxxx33322222222223xxxxxxx3\r\nxxxxxxx33322222222223xxxxxxx3\r\nxxxxxxx33322222222223x33333x3\r\nxxxxxxx33322222222223x33333x3\r\nxx111xx33322222222223xxxxxxx3\r\nxx111xxx332222222222333333333\r\nxx111xxxx32222222222333333333\r\nxx111xxxxxx222222222333333333\r\nxx111xxxxxxx1111111x333333333\r\nxx111xxxxxxx1111111x222222222\r\nxx111xxxxxx111111111111111111\r\nxx111xxxxxx111111111111111111\r\n11111xxxxxx111111111111111111\r\n11111xxxxxx111111111111111111\r\n11x11xxxxxx111111111111111111\r\n11xxxxxxxxx11111111111111111x\r\nx11xxxxxxxxx1111111x1111111xx\r\nxx11xxxxxxx111111111111111xxx\r\nxxx11xxxxxx11111111111111xxxx\r\nxxxx11111111111111111111xxxxx\r\nxxxxx11111111111111xxxxxxxxxx\r\nxxxxxxxxxxx11111111xxxxxxxxxx\r\nxxxxxxxxxxx11111111xxxxxxxxxx','QHHc48greenchair2PBPAKPAHd49greenchair1QBPAKPAHc68greenchair2PBRAKHHd69greenchair1QBRAKHHa620dustylampPERAKJHa628dustylampPGRAKJHc73greenchair2KSAIPAHd74greenchair1PASAIPAHc93greenchair2KQBIHHd94greenchair1PAQBIHHb1021yellowchairQERBKJHb1023yellowchairSERBKRAHb1026yellowchairRFRBKJHb1028yellowchairPGRBKRAHc1211greenchair2SBPCIJHc133greenchair2KQCIPAHd134greenchair1PAQCIPAHd1311greenchair1SBQCIJHa1411dustylampSBRCIJHc153greenchair2KSCIHHd154greenchair1PASCIHHc1511greenchair2SBSCIJHb1524yellowchairPFSCIPAHd1611greenchair1SBPDIJHb1722yellowchairREQDIJHa1724dustylampPFQDIJHb1726yellowchairRFQDIRAHa1911dustylampSBSDIJHb1924yellowchairPFSDIHHc2312greenchair2PCSEIJHc2314greenchair2RCSEIRAHd2412greenchair1PCPFIJHd2414greenchair1RCPFIRA','0',NULL),
('model_0',0,4,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000\r\n000000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx00000000xx00000000xx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_2',0,15,14,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxjjjjjjjjjjjjjx0000xxxxxxxxxx\r\nxxxxxxxxxxxxiix0000xxxxxxxxxx\r\nxxxxxxxxxxxxhhx0000xxxxxxxxxx\r\nxxxxxxxxxxxxggx0000xxxxxxxxxx\r\nxxxxxxxxxxxxffx0000xxxxxxxxxx\r\nxxxxxxxxxxxxeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\neeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxeeeeeeeeeeeeex0000xxxxxxxxxx\r\nxxxxxxxxxxxxddx00000000000000\r\nxxxxxxxxxxxxccx00000000000000\r\nxxxxxxxxxxxxbbx00000000000000\r\nxxxxxxxxxxxxaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxaaaaaaaaaaaaax00000000000000\r\nxxxxxxxxxxxx99x0000xxxxxxxxxx\r\nxxxxxxxxxxxx88x0000xxxxxxxxxx\r\nxxxxxxxxxxxx77x0000xxxxxxxxxx\r\nxxxxxxxxxxxx66x0000xxxxxxxxxx\r\nxxxxxxxxxxxx55x0000xxxxxxxxxx\r\nxxxxxxxxxxxx44x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nx4444444444444x0000xxxxxxxxxx\r\nxxxxxxxxxxxx33x0000xxxxxxxxxx\r\nxxxxxxxxxxxx22x0000xxxxxxxxxx\r\nxxxxxxxxxxxx11x0000xxxxxxxxxx\r\nxxxxxxxxxxxx00x0000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',''),
('model_3',0,10,0,2,'xxxxxxxxxxxxxxxxx\r\nxxx0000000000000x\r\nxxx0000000000000x\r\nxxx0000000000000x\r\nxxx0000000000000x\r\nxxx0000000000000x\r\nxxx0000000000000x\r\nx000000000000000x\r\nx000000000000000x\r\nx000000000000000x\r\n0000000000000000x\r\nx000000000000000x\r\nx000000000000000x\r\nx000000000000000x\r\nxxxxxxxxxxxxxxxxx','','0',''),
('model_4',0,10,0,2,'xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxaaaaaaaaaaax\r\nxxxxxxxxxaaaaaaaaaaax\r\nxxxxxxxxxaaaaaaaaaaax\r\nxxxxxxxxxaaaaaaaaaaax\r\nx00000000xxxxxaaaaaax\r\nx00000000xxxxxaaaaaax\r\nx00000000xxxxxaaaaaax\r\nx00000000xxxxxaaaaaax\r\nx0000000000000aaaaaax\r\n00000000000000aaaaaax\r\nx0000000000000aaaaaax\r\nx0000000000000aaaaaax\r\nx0000000000000xxxxxxx\r\nx0000000000000xxxxxxx\r\nx0000000000000xxxxxxx\r\nx0000000000000xxxxxxx\r\nx0000000000000xxxxxxx\r\nx0000000000000xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx','','0',''),
('model_5',0,10,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\n000000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nx00000000000000000000000000000000x\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',''),
('model_6',0,15,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x000000000000000000000000xxxx\r\nx222222222x00000000xxxxxxxx00000000xxxx\r\nx11xxxxxxxx00000000xxxxxxxx00000000xxxx\r\nx00x000000000000000xxxxxxxx00000000xxxx\r\nx00x000000000000000xxxxxxxx00000000xxxx\r\nx000000000000000000xxxxxxxx00000000xxxx\r\nx000000000000000000xxxxxxxx00000000xxxx\r\n0000000000000000000xxxxxxxx00000000xxxx\r\nx000000000000000000xxxxxxxx00000000xxxx\r\nx00x000000000000000xxxxxxxx00000000xxxx\r\nx00x000000000000000xxxxxxxx00000000xxxx\r\nx00xxxxxxxxxxxxxxxxxxxxxxxx00000000xxxx\r\nx00xxxxxxxxxxxxxxxxxxxxxxxx00000000xxxx\r\nx00x0000000000000000000000000000000xxxx\r\nx00x0000000000000000000000000000000xxxx\r\nx0000000000000000000000000000000000xxxx\r\nx0000000000000000000000000000000000xxxx\r\nx0000000000000000000000000000000000xxxx\r\nx0000000000000000000000000000000000xxxx\r\nx00x0000000000000000000000000000000xxxx\r\nx00x0000000000000000000000000000000xxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',''),
('model_7',0,17,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxx\r\nx222222xx00000000xxxxxxxx\r\nx222222xx00000000xxxxxxxx\r\nx2222221000000000xxxxxxxx\r\nx2222221000000000xxxxxxxx\r\nx222222xx00000000xxxxxxxx\r\nx222222xx00000000xxxxxxxx\r\nx222222xxxxxxxxxxxxxxxxxx\r\nx222222xkkkkkkxxiiiiiiiix\r\nx222222xkkkkkkxxiiiiiiiix\r\nx222222xkkkkkkjiiiiiiiiix\r\nx222222xkkkkkkjiiiiiiiiix\r\nx222222xkkkkkkxxiiiiiiiix\r\nxxx11xxxkkkkkkxxiiiiiiiix\r\nxxx00xxxkkkkkkxxxxxxxxxxx\r\nx000000xkkkkkkxxxxxxxxxxx\r\nx000000xkkkkkkxxxxxxxxxxx\r\n0000000xkkkkkkxxxxxxxxxxx\r\nx000000xkkkkkkxxxxxxxxxxx\r\nx000000xkkkkkkxxxxxxxxxxx\r\nx000000xxxjjxxxxxxxxxxxxx\r\nx000000xxxiixxxxxxxxxxxxx\r\nx000000xiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx\r\nxxxxxxxxiiiiiixxxxxxxxxxx','','0',''),
('model_8',0,15,5,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx5555555555555555555555555xxxxxxxxx\r\nx5555555555555555555555555xxxxxxxxx\r\nx5555555555555555555555555xxxxxxxxx\r\nx5555555555555555555555555xxxxxxxxx\r\nx5555555555555555555555555xxxxxxxxx\r\nx5555555555555555555555555xxxxxxxxx\r\nx5555555555xxxxxxxxxxxxxxxxxxxxxxxx\r\nx55555555554321000000000000000000xx\r\nx55555555554321000000000000000000xx\r\nx5555555555xxxxx00000000000000000xx\r\nx555555x44x0000000000000000000000xx\r\nx555555x33x0000000000000000000000xx\r\nx555555x22x0000000000000000000000xx\r\nx555555x11x0000000000000000000000xx\r\n5555555x00x0000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nx555555x0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxx0000000000000000000000000xx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',''),
('model_9',0,17,0,2,'xxxxxxxxxxxxxxxxxxxxxxxx\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\n00000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nx0000000000000000000000x\r\nxxxxxxxxxxxxxxxxxxxxxxxx','','0',''),
('model_a',3,5,0,2,'xxxxxxxxxxxx\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxx00000000\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_b',0,5,0,2,'xxxxxxxxxxxx\r\nxxxxx0000000\r\nxxxxx0000000\r\nxxxxx0000000\r\nxxxxx0000000\r\nx00000000000\r\nx00000000000\r\nx00000000000\r\nx00000000000\r\nx00000000000\r\nx00000000000\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_b2g',0,0,0,2,'xxxxxxxxxxxxxx\r\nx00000x000000x\r\nx000000000000x\r\nx00000x000000x\r\nx00000x000000x\r\nx00000x000000x\r\nx00000x000000x\r\nxxx0xxx000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx000000000000x\r\nx00000xx00000x\r\nxxxxxxxxxxxxxx','','0',NULL),
('model_c',4,7,0,2,'xxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_d',4,7,0,2,'xxxxxxxxxxxx\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxxxxxxxxxxx','','0',NULL),
('model_e',1,5,0,2,'xxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxx0000000000\r\nxx0000000000\r\nxx0000000000\r\nxx0000000000\r\nxx0000000000\r\nxx0000000000\r\nxx0000000000\r\nxx0000000000\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_f',2,5,0,2,'xxxxxxxxxxxx\r\nxxxxxxx0000x\r\nxxxxxxx0000x\r\nxxx00000000x\r\nxxx00000000x\r\nxxx00000000x\r\nxxx00000000x\r\nx0000000000x\r\nx0000000000x\r\nx0000000000x\r\nx0000000000x\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_g',1,7,1,2,'xxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxx00000\r\nxxxxxxx00000\r\nxxxxxxx00000\r\nxx1111000000\r\nxx1111000000\r\nxx1111000000\r\nxx1111000000\r\nxx1111000000\r\nxxxxxxx00000\r\nxxxxxxx00000\r\nxxxxxxx00000\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_h',4,4,1,2,'xxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxx111111x\r\nxxxxx111111x\r\nxxxxx111111x\r\nxxxxx111111x\r\nxxxxx111111x\r\nxxxxx000000x\r\nxxxxx000000x\r\nxxx00000000x\r\nxxx00000000x\r\nxxx00000000x\r\nxxx00000000x\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx\r\nxxxxxxxxxxxx','','0',NULL),
('model_i',0,10,0,2,'xxxxxxxxxxxxxxxxx\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nx0000000000000000\r\nxxxxxxxxxxxxxxxxx','','0',NULL),
('model_j',0,10,0,2,'xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxx0000000000\r\nxxxxxxxxxxx0000000000\r\nxxxxxxxxxxx0000000000\r\nxxxxxxxxxxx0000000000\r\nxxxxxxxxxxx0000000000\r\nxxxxxxxxxxx0000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx0000000000xxxxxxxxxx\r\nx0000000000xxxxxxxxxx\r\nx0000000000xxxxxxxxxx\r\nx0000000000xxxxxxxxxx\r\nx0000000000xxxxxxxxxx\r\nx0000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_k',0,13,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_l',0,16,0,2,'xxxxxxxxxxxxxxxxxxxxx\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nx00000000xxxx00000000\r\nxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_m',0,15,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nx0000000000000000000000000000\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxx00000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_n',0,16,0,2,'xxxxxxxxxxxxxxxxxxxxx\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx000000xxxxxxxx000000\r\nx000000x000000x000000\r\nx000000x000000x000000\r\nx000000x000000x000000\r\nx000000x000000x000000\r\nx000000x000000x000000\r\nx000000x000000x000000\r\nx000000xxxxxxxx000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nx00000000000000000000\r\nxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_o',0,18,1,2,'xxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx11111111xxxx\r\nxxxxxxxxxxxxx00000000xxxx\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nx111111100000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_opening',0,23,2,2,'xxxxxxxxxxxxxxxxxxx\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx2222xx111111111111\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\n22222xx000000000000\r\nx2222xx000000000000\r\nxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_oscar',0,15,1,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx11111111xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx11xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111x11111111x00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111x11111111x00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111x11111111x00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111111111111100000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111111111111100000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111x11111111x00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111x11111111x00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111111x11111111x00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx11xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_p',0,23,2,2,'xxxxxxxxxxxxxxxxxxx\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx22222222xxxx\r\nxxxxxxx11111111xxxx\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx2222xx11111111xxxx\r\nx2222xx00000000xxxx\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\n22222xx000000000000\r\nx2222xx000000000000\r\nxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_q',10,4,2,2,'xxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxx22222222\r\nxxxxxxxxxxx22222222\r\nxxxxxxxxxxx22222222\r\nxxxxxxxxxxx22222222\r\nxxxxxxxxxxx22222222\r\nxxxxxxxxxxx22222222\r\nx222222222222222222\r\nx222222222222222222\r\nx222222222222222222\r\nx222222222222222222\r\nx222222222222222222\r\nx222222222222222222\r\nx2222xxxxxxxxxxxxxx\r\nx2222xxxxxxxxxxxxxx\r\nx2222211111xx000000\r\nx222221111110000000\r\nx222221111110000000\r\nx2222211111xx000000\r\nxx22xxx1111xxxxxxxx\r\nxx11xxx1111xxxxxxxx\r\nx1111xx1111xx000000\r\nx1111xx111110000000\r\nx1111xx111110000000\r\nx1111xx1111xx000000\r\nxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_r',10,4,3,2,'xxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxx33333333333333\r\nxxxxxxxxxxx33333333333333\r\nxxxxxxxxxxx33333333333333\r\nxxxxxxxxxx333333333333333\r\nxxxxxxxxxxx33333333333333\r\nxxxxxxxxxxx33333333333333\r\nxxxxxxx333333333333333333\r\nxxxxxxx333333333333333333\r\nxxxxxxx333333333333333333\r\nxxxxxxx333333333333333333\r\nxxxxxxx333333333333333333\r\nxxxxxxx333333333333333333\r\nx4444433333xxxxxxxxxxxxxx\r\nx4444433333xxxxxxxxxxxxxx\r\nx44444333333222xx000000xx\r\nx44444333333222xx000000xx\r\nxxx44xxxxxxxx22xx000000xx\r\nxxx33xxxxxxxx11xx000000xx\r\nxxx33322222211110000000xx\r\nxxx33322222211110000000xx\r\nxxxxxxxxxxxxxxxxx000000xx\r\nxxxxxxxxxxxxxxxxx000000xx\r\nxxxxxxxxxxxxxxxxx000000xx\r\nxxxxxxxxxxxxxxxxx000000xx\r\nxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_s',0,3,0,2,'xxxxxx\r\nx00000\r\nx00000\r\n000000\r\nx00000\r\nx00000\r\nx00000\r\nx00000','','0',NULL),
('model_t',0,3,2,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx222222222222222222222222222x\r\nx222222222222222222222222222x\r\n2222222222222222222222222222x\r\nx222222222222222222222222222x\r\nx2222xxxxxx222222xxxxxxx2222x\r\nx2222xxxxxx111111xxxxxxx2222x\r\nx2222xx111111111111111xx2222x\r\nx2222xx111111111111111xx2222x\r\nx2222xx11xxx1111xxxx11xx2222x\r\nx2222xx11xxx0000xxxx11xx2222x\r\nx22222111x00000000xx11xx2222x\r\nx22222111x00000000xx11xx2222x\r\nx22222111x00000000xx11xx2222x\r\nx22222111x00000000xx11xx2222x\r\nx22222111x00000000xx11xx2222x\r\nx22222111x00000000xx11xx2222x\r\nx2222xx11xxxxxxxxxxx11xx2222x\r\nx2222xx11xxxxxxxxxxx11xx2222x\r\nx2222xx111111111111111xx2222x\r\nx2222xx111111111111111xx2222x\r\nx2222xxxxxxxxxxxxxxxxxxx2222x\r\nx2222xxxxxxxxxxxxxxxxxxx2222x\r\nx222222222222222222222222222x\r\nx222222222222222222222222222x\r\nx222222222222222222222222222x\r\nx222222222222222222222222222x\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_u',0,17,1,2,'xxxxxxxxxxxxxxxxxxxxxxxx\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\n11111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nx1111100000000000000000x\r\nxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_v',0,3,2,2,'xxxxxxxxxxxxxxxxxxxx\r\nx222221111111111111x\r\nx222221111111111111x\r\n2222221111111111111x\r\nx222221111111111111x\r\nx222221111111111111x\r\nx222221111111111111x\r\nxxxxxxxx1111xxxxxxxx\r\nxxxxxxxx0000xxxxxxxx\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx00000000000x000000x\r\nx00000000000x000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nxxxxxxxx00000000000x\r\nx000000x00000000000x\r\nx000000x0000xxxxxxxx\r\nx00000000000x000000x\r\nx00000000000x000000x\r\nx00000000000x000000x\r\nx00000000000x000000x\r\nxxxxxxxx0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_w',0,3,2,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx2222xx1111111111xx11111111\r\nx2222xx1111111111xx11111111\r\n222222111111111111111111111\r\nx22222111111111111111111111\r\nx22222111111111111111111111\r\nx22222111111111111111111111\r\nx2222xx1111111111xx11111111\r\nx2222xx1111111111xx11111111\r\nx2222xx1111111111xxxx1111xx\r\nx2222xx1111111111xxxx0000xx\r\nxxxxxxx1111111111xx00000000\r\nxxxxxxx1111111111xx00000000\r\nx22222111111111111000000000\r\nx22222111111111111000000000\r\nx22222111111111111000000000\r\nx22222111111111111000000000\r\nx2222xx1111111111xx00000000\r\nx2222xx1111111111xx00000000\r\nx2222xxxx1111xxxxxxxxxxxxxx\r\nx2222xxxx0000xxxxxxxxxxxxxx\r\nx2222x0000000000xxxxxxxxxxx\r\nx2222x0000000000xxxxxxxxxxx\r\nx2222x0000000000xxxxxxxxxxx\r\nx2222x0000000000xxxxxxxxxxx\r\nx2222x0000000000xxxxxxxxxxx\r\nx2222x0000000000xxxxxxxxxxx','','0',NULL),
('model_x',0,12,0,2,'xxxxxxxxxxxxxxxxxxxx\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nxxx00xxx0000xxx00xxx\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\n0000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000x0000x000000x\r\nx000000xxxxxx000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nx000000000000000000x\r\nxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_y',0,3,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nx00000000xx0000000000xx0000x\r\nx00000000xx0000000000xx0000x\r\n000000000xx0000000000xx0000x\r\nx00000000xx0000000000xx0000x\r\nx00000000xx0000xx0000xx0000x\r\nx00000000xx0000xx0000xx0000x\r\nx00000000xx0000xx0000000000x\r\nx00000000xx0000xx0000000000x\r\nxxxxx0000xx0000xx0000000000x\r\nxxxxx0000xx0000xx0000000000x\r\nxxxxx0000xx0000xxxxxxxxxxxxx\r\nxxxxx0000xx0000xxxxxxxxxxxxx\r\nx00000000xx0000000000000000x\r\nx00000000xx0000000000000000x\r\nx00000000xx0000000000000000x\r\nx00000000xx0000000000000000x\r\nx0000xxxxxxxxxxxxxxxxxx0000x\r\nx0000xxxxxxxxxxxxxxxxxx0000x\r\nx00000000000000000000000000x\r\nx00000000000000000000000000x\r\nx00000000000000000000000000x\r\nx00000000000000000000000000x\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('model_z',0,9,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxx00000000000000000000\r\nxxxxxxxxxxx00000000000000000000\r\nxxxxxxxxxxx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\n000000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nx00000000xx00000000000000000000\r\nxxxxxxxxxxx00000000000000000000\r\nxxxxxxxxxxx00000000000000000000\r\nxxxxxxxxxxx00000000000000000000\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','','0',NULL),
('netcafe',22,12,0,2,'xxxxx1111xxxxxxxxxxx1xxxx\r\nxxxxx1111111111111111xxxx\r\nxxxxx1111111111111111xxxx\r\nxxxxx1111111111111111xxxx\r\nxxxxxxxx0000000000000xxxx\r\n111111100000000000000xxxx\r\n111111100000000000000xxxx\r\n111111100000000000000xxxx\r\nxxxx11100000000000000xxxx\r\nx1xx11100000000000000xxxx\r\nx1xx11100000000000000xxxx\r\nx1xx111000000000000000000\r\nx1xx111000000000000000000\r\nxxxx111000000000000000000\r\nxxxx11100000000000000xxxx\r\nxxxx1110000000xx11111xxxx\r\nxxxxx111110000x111111xxxx\r\nxxxxxx111100001111111xxxx\r\nxxxxxx111100001111111xxxx\r\nxxxxxx111100001111111xxxx\r\nxxxxxx111100001111111xxxx\r\nxxxxxx111100001111111xxxx\r\nxxxxxx111100001111111xxxx\r\nxxxxx1111100001111111xxxx','RRHi06shift1RAHIPAHj07shift2SAHIPAHm110mRBIIHHl113lQCIIHHk116kPDIIHHk119kSDIIHHh35kukat6QAKIHHg36kukat5RAKIHHc312kukat2PCKIHHb313kukat1QCKIHHc319kukat2SDKIHHb320kukat1PEKIHHi412shift1PCPAHPAHj413shift2QCPAHPAHi419shift1SDPAHPAHj420shift2PEPAHPAHi50shift1HQAIPAHj51shift2IQAIPAHi52shift1JQAIPAHj53shift2KQAIPAHk715kSCSAHJHo716table2PDSAHRAHz717tablecornerQDSAHHHm718mRDSAHRAHl815lSCPBHJHo816table2PDPBHPAHl818lRDPBHRAHm94mPAQBIRAHk99kQBQBHJHp910table3RBQBHRAHz911tablecornerSBQBHHHm912mPCQBHRAHk915kSCQBHJHo916table2PDQBHJHk918kRDQBHRAHk104kPARBIRAHm109mQBRBHJHp1010table3RBRBHPAHm1012mPCRBHRAHm1015mSCRBHJHo1016table2PDRBHHHk1018kRDRBHRAHl114lPASBIRAHl119lQBSBHJHp1110table3RBSBHJHl1112lPCSBHRAHk124kPAPCIRAHl129lQBPCHJHp1210table3RBPCHHHk1212kPCPCHRAHm134mPAQCIRAHc165kukat2QAPDIHHb166kukat1RAPDIHHc167kukat2SAPDIHHb168kukat1PBPDIHHe169kukat3QBPDIHHd1615kukka2SCPDIHHf179kukat4QBQDIHHk186kRARDIRAHe189kukat3QBRDIHHs1820sofabig3PERDIRAHf199kukat4QBSDIHHn1917table1QDSDIPAHz1918tablecornerRDSDIHHr1920sofabig2PESDIRAHn2017table1QDPEIJHr2020sofabig2PEPEIRAHm216mRAQEIRAHn2117table1QDQEIHHq2120sofabig1PEQEIRAHv2316sofalittle3PDSEIHHu2317sofalittle2QDSEIHHt2318sofalittle1RDSEIHHa2320kukkaPESEIH','0',NULL),
('newbie_lobby',2,11,0,2,'xxxxxxxxxxxxxxxx000000\r\nxxxxx0xxxxxxxxxx000000\r\nxxxxx00000000xxx000000\r\nxxxxx000000000xx000000\r\n0000000000000000000000\r\n0000000000000000000000\r\n0000000000000000000000\r\n0000000000000000000000\r\n0000000000000000000000\r\nxxxxx000000000000000xx\r\nxxxxx000000000000000xx\r\nx0000000000000000000xx\r\nx0000000000000000xxxxx\r\nxxxxxx00000000000xxxxx\r\nxxxxxxx0000000000xxxxx\r\nxxxxxxxx000000000xxxxx\r\nxxxxxxxx000000000xxxxx\r\nxxxxxxxx000000000xxxxx\r\nxxxxxxxx000000000xxxxx\r\nxxxxxxxx000000000xxxxx\r\nxxxxxxxx000000000xxxxx\r\nxxxxxx00000000000xxxxx\r\nxxxxxx00000000000xxxxx\r\nxxxxxx00000000000xxxxx\r\nxxxxxx00000000000xxxxx\r\nxxxxxx00000000000xxxxx\r\nxxxxx000000000000xxxxx\r\nxxxxx000000000000xxxxx','SOHa016crl_lampPDHHHHy017crl_sofa2cQDHHPAHw018crl_sofa2bRDHHPAHv019crl_sofa2aSDHHPAHa020crl_lampPEHHHHb116crl_chairPDIHJHa27crl_lampSAJHHHa211crl_lampSBJHHHb216crl_chairPDJHJHc35crl_pillarQAKHHHb37crl_chairSAKHJHu39crl_table1bQBKHHHs311crl_sofa1cSBKHRAHb316crl_chairPDKHJHA319crl_table2bSDKHHHz320crl_table2aPEKHHHa40crl_lampHPAHHHy41crl_sofa2cIPAHPAHw42crl_sofa2bJPAHPAHv43crl_sofa2aKPAHPAHa44crl_lampPAPAHHHt49crl_table1aQBPAHHHr411crl_sofa1bSBPAHRAHh415crl_wall2aSCPAHHHa416crl_lampPDPAHHHb50crl_chairHQAHJHb57crl_chairSAQAHJHq511crl_sofa1aSBQAHRAHA62crl_table2bJRAHHHz63crl_table2aKRAHHHa611crl_lampSBRAHHHb70crl_chairHSAHJHa80crl_lampHPBHHHD81crl_sofa3cIPBHHHC82crl_sofa3bJPBHHHB83crl_sofa3aKPBHHHa84crl_lampPAPBHHHo819crl_barchair2SDPBHHHp820crl_tablebarPEPBHHHo821crl_barchair2QEPBHHHE95crl_pillar2QAQBHHHc99crl_pillarQBQBHHHP158crl_desk1aPBSCHHHO159crl_deskiQBSCHHHN1510crl_deskhRBSCHHHM1610crl_deskgRBPDHHHL1710crl_deskfRBQDHHHK1810crl_deskeRBRDHHHK1910crl_deskeRBSDHHHK2010crl_deskeRBPEHHHK2110crl_deskeRBQEHHHK2210crl_deskeRBREHHHK2310crl_deskeRBSEHHHG247crl_wallbSAPFHHHK2410crl_deskeRBPFHHHF257crl_wallaSAQFHHHH258crl_desk1bPBQFHHHI259crl_desk1cQBQFHHHJ2510crl_desk1dRBQFHHHd2712crl_lamp2PCSFHHHf2713crl_cabinet2QCSFHHHe2714crl_cabinet1RCSFHHHd2715crl_lamp2SCSFHH','0',NULL),
('old_skool',2,1,0,2,'xx0xxxxxxxxxxxxxx\r\n0000000xxx00000xx\r\n0000000x0000000xx\r\n0000000xxxxxxxxxx\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n00000000000000000\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x\r\n0000000000000000x','SLHk49mobiles_chair3QBPAHHHk410mobiles_chair3RBPAHHHk411mobiles_chair3SBPAHHHk412mobiles_chair3PCPAHHHe101mobiles_chair1IRBHPAHe1010mobiles_chair1RBRBHPAHe110mobiles_chair1HSBHJHb111mobiles_table2ISBHHHc112mobiles_table3JSBHHHe113mobiles_chair1KSBHRAHb1110mobiles_table2RBSBHHHc1111mobiles_table3SBSBHHHa121mobiles_table1IPCHHHd122mobiles_table4JPCHHHe129mobiles_chair1QBPCHJHa1210mobiles_table1RBPCHHHd1211mobiles_table4SBPCHHHe1212mobiles_chair1PCPCHRAHe131mobiles_chair1IQCHHHe1311mobiles_chair1SBQCHHHe150mobiles_chair1HSCHPAHe170mobiles_chair1HQDHJHb171mobiles_table2IQDHHHc172mobiles_table3JQDHHHe173mobiles_chair1KQDHRAHa181mobiles_table1IRDHHHd182mobiles_table4JRDHHHe192mobiles_chair1JSDHHHe211mobiles_chair1IQEHPAHb216mobiles_table2RAQEHHHc217mobiles_table3SAQEHHHe2112mobiles_chair1PCQEHPAHe220mobiles_chair1HREHJHb221mobiles_table2IREHHHc222mobiles_table3JREHHHe223mobiles_chair1KREHRAHe225mobiles_chair1QAREHJHa226mobiles_table1RAREHHHd227mobiles_table4SAREHHHe228mobiles_chair1PBREHRAHe2211mobiles_chair1SBREHJHb2212mobiles_table2PCREHHHc2213mobiles_table3QCREHHHe2214mobiles_chair1RCREHRAHa231mobiles_table1ISEHHHd232mobiles_table4JSEHHHa2312mobiles_table1PCSEHHHd2313mobiles_table4QCSEHHHe241mobiles_chair1IPFHHHe247mobiles_chair1SAPFHPAHe2413mobiles_chair1QCPFHH','0',NULL),
('orient',35,22,0,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx00000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxx1xx000x000xx111x111xxx\r\nxxxxxxxxxxxxxx1xx000x000xxxxxx1111xx\r\nxxxxxxxxxxxxxx1xx000x000x111111111xx\r\nxxxxxxxxxxxxxx1xx000x000x111111111xx\r\nxxx111111111111xx000x000x111111111xx\r\nxxx1xxxxxxxxxxxxx000x000x111111111xx\r\nxxx1x1111111111000000000x111111111xx\r\nxxx1x1111111111000000000xx1111111xxx\r\nxxx1x11xxxxxx11000000000xx1111111100\r\nxxx111xxxxxxx11000000000011111111100\r\nxxx111xxxxxxx11000000000011111111100\r\nxxxxx1xxxxxxx11000000000011111111100\r\nxxxxx11xxxxxx11000000000xx1111111100\r\nxxxxx1111111111000000000xx1111111xxx\r\nxxxxx1111111111xx000x000x111111111xx\r\nxxxxxxxxxxxxxxxxx000x000x111111111xx\r\nxxxxxxxxxxxxxxxxx000x000x111111111xx\r\nxxxxxxxxxxxxxxxxx000x000x111111111xx\r\nxxxxxxxxxxxxxxxxx000x000x111111111xx\r\nxxxxxxxxxxxxxxxxx000x00xx11xxxx111xx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxx11111111xx','SOHd1017benchQDRBHJHd1019benchSDRBHRAHd1021benchQERBHJHd1023benchSERBHRAHd1117benchQDSBHJHd1119benchSDSBHRAHd1121benchQESBHJHd1123benchSESBHRAHb1132koc_chairPHSBIPAHd1217benchQDPCHJHd1219benchSDPCHRAHd1221benchQEPCHJHd1223benchSEPCHRAHb1231koc_chairSGPCIJHa1232koc_tablePHPCIHHb1233koc_chairQHPCIRAHd1317benchQDQCHJHd1319benchSDQCHRAHd1321benchQEQCHJHd1323benchSEQCHRAHb1325koc_chairQFQCIPAHb1332koc_chairPHQCIHHd1417benchQDRCHJHd1419benchSDRCHRAHd1421benchQERCHJHd1423benchSERCHRAHa1425koc_tableQFRCIHHb1426koc_chairRFRCIRAHd1517benchQDSCHJHd1519benchSDSCHRAHd1521benchQESCHJHd1523benchSESCHRAHb1525koc_chairQFSCIHHb1529koc_chairQGSCIJHa1530koc_tableRGSCIHHb1531koc_chairSGSCIRAHb1630koc_chairRGPDIHHc2425chairf1QFPFIJHc2433chairf1QHPFIRAHd2517benchQDQFHJHd2519benchSDQFHRAHd2521benchQEQFHJHd2523benchSEQFHRAHc2525chairf1QFQFIJHc2533chairf1QHQFIRAHd2617benchQDRFHJHd2619benchSDRFHRAHd2621benchQERFHJHd2623benchSERFHRAHc2625chairf1QFRFIJHc2633chairf1QHRFIRAHd2717benchQDSFHJHd2719benchSDSFHRAHd2721benchQESFHJHd2723benchSESFHRAHd2817benchQDPGHJHd2819benchSDPGHRAHd2821benchQEPGHJHd2823benchSEPGHRAHd2917benchQDQGHJHd2919benchSDQGHRAHd2921benchQEQGHJHd2923benchSEQG`hFFRA','0',NULL),
('park_a',2,15,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00xxxxxxxxxxxx\r\nxxxxxxxxxxxxx0x00xxxxxxxxxxx0x000xxxxxxxxxxx\r\nxxxxxxxxxxxx0000000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxx000000000000000000000000xxxxxxxxx\r\nxxxxxxxxxxx0000000000000000000000000xxxxxxxx\r\nxxxxxxxxxxx00000000000000000000000000xxxxxxx\r\nxxxxxxxx000000000000000000000000000000xxxxxx\r\nxxxxxxx00000000000000000000000000000000xxxxx\r\nxxxxxxx000000000000000000000000000000000xxxx\r\nxxxxxxx0000000000000000000000000000000000xxx\r\nxxxxxxxxx000000000000000000000000000000000xx\r\n00000000000000000000xx00000000000000000000xx\r\n0000000000000000000xxxx00000000000xxxxxxx0xx\r\n0000000000000000000xxxx00000000000x00000xxxx\r\nxxxxx00x0000000000xxxxx0xxxxxx0000x0000000xx\r\nxxxxx0000000000000xxxxx0xx000x0000x000000xxx\r\nxxxxx0000000000000xxxxx0x000000000x00000xxxx\r\nxxxxx000000x0000000xxxx0x000000000xxx00xxxxx\r\nxxxxxxxx000x0000000xxx00xxx000000x0000xxxxxx\r\nxxxxxxxx000x000000xxxx0x0000000000000xxxxxxx\r\nxxxxxxxx000x000000011100000000000000xxxxxxxx\r\nxxxxxxxx000x00000001110000000000000xxxxxxxxx\r\nxxxxxxxxx00x0000000111x00000000x00xxxxxxxxxx\r\nxxxxxxxxxx0x0000000xxx0000000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx000000xxxx0000000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx000000xxx00xxxxx00xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxx0xx000x00xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxx0x000000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxxxx00000xxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxxxx00xxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxx','RPHN527parkfence2SFQAHHHN529parkfence2QGQAHHHM619parkfence1SDRAHHHO620parkfence3PERAHPAHO621parkfence3QERAHPAHO622parkfence3RERAHPAHN623parkfence2SERAHPAHO624parkfence3PFRAHPAHO625parkfence3QFRAHPAHO626parkfence3RFRAHPAHM627parkfence1SFRAHJHO629parkfence3QGRAHJHN717parkfence2QDSAHHHO719parkfence3SDSAHJHO723parkfence3SESAHJHO727parkfence3SFSAHJHO729parkfence3QGSAHJHO817parkfence3QDPBHJHO819parkfence3SDPBHJHN821parkfence2QEPBHHHO823parkfence3SEPBHJHN825parkfence2QFPBHHHO827parkfence3SFPBHJHO829parkfence3QGPBHJHL98bench2PBQBHPAHK99benchQBQBHPAHO917parkfence3QDQBHJHN919parkfence2SDQBHRAHO921parkfence3QEQBHJHN923parkfence2SEQBHRAHO925parkfence3QFQBHJHN927parkfence2SFQBHRAHO929parkfence3QGQBHJHO1017parkfence3QDRBHJHO1021parkfence3QERBHJHO1025parkfence3QFRBHJHO1029parkfence3QGRBHJHL117bench2SASBHJHM1117parkfence1QDSBHPAHO1118parkfence3RDSBHPAHO1119parkfence3SDSBHPAHO1120parkfence3PESBHPAHN1121parkfence2QESBHJHO1122parkfence3RESBHPAHO1123parkfence3SESBHPAHO1124parkfence3PFSBHPAHN1125parkfence2QFSBHJHO1126parkfence3RFSBHPAHO1127parkfence3SFSBHPAHO1128parkfence3PGSBHPAHM1129parkfence1QGSBHRAHK127benchSAPCHJHL1635bench2SHPDHJHL1637bench2QIPDHPAHK1638benchRIPDHPAHK1735benchSHQDHJHL1827bench2SFRDHPAHK1828benchPGRDHPAHL1835bench2SHRDHJHL1925bench2QFSDHJHK1935benchSHSDHJHK2025benchQFPEHJHL2925bench2QFQGHPAHK2926benchRFQGHPAHL3023bench2SERGHJHK3123benchSESGHJ@`SGSBMRDPBPA0.0I2Mqueue_tile2JMPGRAH0.0I2Mqueue_tile2SAMPFSAJ0.0I2Mqueue_tile2QBMRFSAPA0.0I2Mqueue_tile2SFMSERBJ0.0I2Mqueue_tile2SCMRFPBPA0.0I2Mqueue_tile2REMPGQBH0.0I2Mqueue_tile2PGMPFRBH0.0I2Mqueue_tile2PCMPEPBH0.0I2Mqueue_tile2QGMRFRBJ0.0I2Mqueue_tile2QDMRDQBPA0.0I2Mqueue_tile2RFMRERBJ0.0I2Mqueue_tile2PFMSDRBJ0.0I2Mqueue_tile2PDMPGPBH0.0I2Mqueue_tile2RGMSFRBJ0.0I2Mqueue_tile2RAMRESAPA0.0I2Mqueue_tile2RBMPGSAH0.0I2Mqueue_tile2SDMREQBPA0.0I2Mqueue_tile2QEMRFQBPA0.0I2Mqueue_tile2RCMPFPBH0.0I2Mqueue_tile2KMRDSAPA0.0I2Mqueue_tile2PAMPESAJ0.0I2Mqueue_tile2PBMQFSAJ0.0I2Mqueue_tile2IMPGQAH0.0I2Mqueue_tile2SEMRDRBJ0.0I2Mqueue_tile2QCMREPBPA0.0I2Mqueue_tile2SGMPGRBH0.0I2Mqueue_tile2QAMQESAJ0.0I2Mqueue_tile2QFMPERBH0.0I2Mqueue_tile2RDMPEQBH0.0I2Mqueue_tile2PEMPFQBH0.0I2Mqueue_tile2','0',NULL),
('park_b',11,2,0,6,'0000x0000000\r\n0000xx000000\r\n000000000000\r\n00000000000x\r\n000000000000\r\n00x0000x0000','','0',NULL),
('picnic',16,5,2,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxx22222xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\n22xxxxxxxxxxxxx22xxxxxxxxxxxxxxxxxxxxx\r\n2222222222222222222x222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222xxx222222222222222222222222\r\n2222222222xx33x22222222222222222222222\r\n222222222xx3333x2222222222222222222222\r\n222222222x333333x222222222222222222222\r\n222222222x333333x222222222222222222222\r\n2222222222x3332x2222222222222222222222\r\n22222222222x33x22222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222x22222xxxx22222222222222222222\r\n22222222222222xxxx22222222222222222222\r\n22222222222222xxx222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222\r\n22222222222222222222222222222222222222','PcHh710hedge7RBSAJPAHh711hedge7SBSAJPAHh712hedge7PCSAJPAHh713hedge7QCSAJPAHy714hedge8RCSAJPAHs718hedge2RDSAJPAHh719hedge7SDSAJPAHh720hedge7PESAJPAHh721hedge7QESAJPAHz814hedge9RCPBJPAHz818hedge9RDPBJPAHv93hedge5KQBJPAHz103hedge9KRBJPAHc1112picnic_dummychair1PCSBKPAHc1113picnic_dummychair1QCSBKPAHc1114picnic_dummychair1RCSB`hFFPAHc1310picnic_dummychair1RBQCKJHc1315picnic_dummychair1SCQCKRAHb1321picnic_groundQEQCJPAHb147picnic_groundSARCJPAHc1410picnic_dummychair1RBRCKJHc1415picnic_dummychair1SCRCKRAHb1519picnic_groundSDSCJJHb1523picnic_groundSESCJRAHb165picnic_groundQAPDJJHb169picnic_groundQBPDJRAHL1620picnic_cloth1PEPDJJHL176picnic_cloth1RAQDJJHb1721picnic_groundQEQDJHHb187picnic_groundSARDJHHa190picnic_redbench2HSDJJHA200picnic_redbench1HPEJJHw2011hedge6SBPEJPAHh2012hedge7PCPEJPAHh2013hedge7QCPEJPAHt2014hedge3RCPEJPAHu2017hedge4QDPEJPAHh2018hedge7RDPEJPAHh2019hedge7SDPEJPAHy2020hedge8PEPEJPAHv2111hedge5SBQEJPAHM2112picnic_bench1PCQEJPAHN2113picnic_bench2QCQEJPAHO2114picnic_bench3RCQEJPAHM2117picnic_bench1QDQEJPAHN2118picnic_bench2RDQEJPAHO2119picnic_bench3SDQEJPAHv2120hedge5PEQEJPAHa220picnic_redbench2HREJJHv2211hedge5SBREJPAHv2220hedge5PEREJPAHb2225picnic_groundQFREJPAHA230picnic_redbench1HSEJJHv2311hedge5SBSEJPAHM2312picnic_bench1PCSEJJHM2319picnic_bench1SDSEJRAHv2320hedge5PESEJPAHc246picnic_dummychair1RAPFJPAHd247picnic_dummychair4SAPFJPAHe248picnic_dummychair6PBPFJPAHv2411hedge5SBPFJPAHN2412picnic_bench2PCPFJJHN2419picnic_bench2SDPFJRAHv2420hedge5PEPFJPAHb2423picnic_groundSEPFJJHb2427picnic_groundSFPFJRAHK255picnic_stumpQAQFJJHv2511hedge5SBQFJPAHN2512picnic_bench2PCQFJJHN2519picnic_bench2SDQFJRAHv2520hedge5PEQFJPAHG2524picnic_cloth2PFQFJJHK267picnic_stumpSARFJHHv2611hedge5SBRFJPAHO2612picnic_bench3PCRFJJHH2614picnic_fireplace1RCRFJHHI2616picnic_fireplace2PDRFJJHO2619picnic_bench3SDRFJRAHv2620hedge5PERFJPAHb2625picnic_groundQFRFJHHz2711hedge9SBSFJPAHQ2712picnic_lemonadePCSFJPAHz2720hedge9PESFJPAHE298picnic_firewood2PBQGJHHa300picnic_redbench2HRGJJHD308picnic_firewood1PBRGJHHA310picnic_redbench1HSGJJHD318picnic_firewood1PBSGJHHM3112picnic_bench1PCSGJPAHN3113picnic_bench2QCSGJPAHO3114picnic_bench3RCSGJPAHM3118picnic_bench1RDSGJPAHN3119picnic_bench2SDSGJPAHO3120picnic_bench3PESGJPAHf3127picnic_carrotSFSGJHHf3128picnic_carrotPGSGJHHf3129picnic_carrotQGSGJHHf3130picnic_carrotRGSGJHHf3131picnic_carrotSGSGJHHD328picnic_firewood1PBPHJHHF3212picnic_table2PCPHJJHP3214picnic_tableRCPHJJHF3218picnic_table2RDPHJJHP3220picnic_tablePEPHJJHr333hedge1KQHJPAHD338picnic_firewood1PBQHJHHM3312picnic_bench1PCQHJHHN3313picnic_bench2QCQHJHHO3314picnic_bench3RCQHJHHM3318picnic_bench1RDQHJHHN3319picnic_bench2SDQHJHHO3320picnic_bench3PEQHJHHg3327picnic_cabbageSFQHJHHg3328picnic_cabbagePGQHJHHg3329picnic_cabbageQGQHJHHv343hedge5KRHJPAHD348picnic_firewood1PBRHJHHv353hedge5KSHJPAHD358picnic_firewood1PBSHJHHv363hedge5KPIJPAHD368picnic_firewood1PBPIJHHD378picnic_firewood1PBQIJHHM3712picnic_bench1PCQIJPAHN3713picnic_bench2QCQIJPAHO3714picnic_bench3RCQIJPAHM3718picnic_bench1RDQIJPAHN3719picnic_bench2SDQIJPAHO3720picnic_bench3PEQIJPAHD388picnic_firewood1PBRIJHHF3812picnic_table2PCRIJJHP3814picnic_tableRCRIJJHF3818picnic_table2RDRIJJHP3820picnic_tablePERIJJHJ398picnic_firewood3PBSIJHHM3912picnic_bench1PCSIJHHN3913picnic_bench2QCSIJHHO3914picnic_bench3RCSIJHHM3918picnic_bench1RDSIJHHN3919picnic_bench2SDSIJHHO3920picnic_bench3PESIJH','0',NULL),
('pizza',5,27,1,2,'xxxxxxxxx0000000\r\nx11111x1xx000000\r\n11xxxxx111x00000\r\n11x1111111xx0000\r\n11x1111111100000\r\nxxx1111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n1111111111100000\r\n11111111111xxxxx\r\n1111111111xxxxxx\r\n1111111111111111\r\n1111111111111111\r\n1111111111111111\r\n1111111111111111\r\n1111111111111111\r\n1111111111111111\r\n11xx11xx11111111\r\nxxxx11xxxxxxxxxx\r\nxxxx11xxxxxxxxxx','QGHa015pizza_plant1SCHHJHe314pizza_sofa1RCKHPAHE315pizza_sofa2SCKHPAHc515pizza_tableSCQAHJHb60pizza_plant2HRAIJHf614pizza_sofa3RCRAHHHF615pizza_sofa4SCRAHHHd81pizza_chairIPBIPAHd82pizza_chairJPBIPAHc102pizza_tableJRBIJHe1014pizza_sofa1RCRBHPAHE1015pizza_sofa2SCRBHPAHd111pizza_chairISBIHHd112pizza_chairJSBIHHc1215pizza_tableSCPCHJHf1314pizza_sofa3RCQCHHHF1315pizza_sofa4SCQCHHHd161pizza_chairIPDIPAHd162pizza_chairJPDIPAHc182pizza_tableJRDIJHd191pizza_chairISDIHHd192pizza_chairJSDIHHd2111pizza_chairSBQEIJHd2114pizza_chairRCQEIRAHd2211pizza_chairSBREIJHc2213pizza_tableQCREIHHd2214pizza_chairRCREIRAHa250pizza_plant1HQFIJHa2515pizza_plant1SCQFIJ','0',NULL),
('pub_a',15,25,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxx2222222211111xxx\r\nxxxxxxxxx2222222211111xxx\r\nxxxxxxxxx2222222211111xxx\r\nxxxxxxxxx2222222211111xxx\r\nxxxxxxxxx2222222222111xxx\r\nxxxxxxxxx2222222222111xxx\r\nxxxxxxxxx2222222222000xxx\r\nxxxxxxxxx2222222222000xxx\r\nxxxxxxxxx2222222222000xxx\r\nxxxxxxxxx2222222222000xxx\r\nx333333332222222222000xxx\r\nx333333332222222222000xxx\r\nx333333332222222222000xxx\r\nx333333332222222222000xxx\r\nx333333332222222222000xxx\r\nx333332222222222222000xxx\r\nx333332222222222222000xxx\r\nx333332222222222222000xxx\r\nx333332222222222222000xxx\r\nx333333332222222222000xxx\r\nxxxxx31111112222222000xxx\r\nxxxxx31111111000000000xxx\r\nxxxxx31111111000000000xxx\r\nxxxxx31111111000000000xxx\r\nxxxxx31111111000000000xxx\r\nxxxxxxxxxxxxxxx00xxxxxxxx\r\nxxxxxxxxxxxxxxx00xxxxxxxx\r\nxxxxxxxxxxxxxxx00xxxxxxxx\r\nxxxxxxxxxxxxxxx00xxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxx','SWHS119pub_sofa2SDIIPAHs120pub_sofaPEIIPAHs121pub_sofaQEIIPAHq211bardesk1SBJJHHc212pub_chairPCJJRAHQ311bardesk2SBKJHHq411bardesk1SBPAJHHc412pub_chairPCPAJRAHQ511bardesk2SBQAJHHf518pub_fenceRDQAJIHq611bardesk1SBRAJHHc612pub_chairPCRAJRAHf618pub_fenceRDRAJHHQ711bardesk2SBSAJHHf718pub_fenceRDSAJHHq811bardesk1SBPBJHHc812pub_chairPCPBJRAHf818pub_fenceRDPBJHHw910bardesk4RBQBJHHW911bardesk3SBQBJHHf918pub_fenceRDQBJHHf1018pub_fenceRDRBJHHC112pub_chair2JSBKPAHC113pub_chair2KSBKPAHC115pub_chair2QASBKPAHC116pub_chair2RASBKPAHf118pub_fencePBSBKIHf1118pub_fenceRDSBJHHf128pub_fencePBPCKHHf1218pub_fenceRDPCJHHf138pub_fencePBQCKHHC139pub_chair2QBQCJJHk1314pub_chair3RCQCJJHT1315pub_table2SCQCJIHk1316pub_chair3PDQCJRAHf1318pub_fenceRDQCJHHf148pub_fencePBRCKJHC149pub_chair2QBRCJJHk1414pub_chair3RCRCJJHT1415pub_table2SCRCJJHk1416pub_chair3PDRCJRAHf1418pub_fenceRDRCJHHt151pub_tableISCKHHf155pub_fenceQASCKIHf1518pub_fenceRDSCJHHS161pub_sofa2IPDKJHf165pub_fenceQAPDKHHf1618pub_fenceRDPDJHHs171pub_sofaIQDKJHf175pub_fenceQAQDKHHk1713pub_chair3QCQDJPAHk1714pub_chair3RCQDJPAHk1715pub_chair3SCQDJPAHk1716pub_chair3PDQDJPAHf1718pub_fenceRDQDJHHs181pub_sofaIRDKJHf185pub_fenceQARDKHHT1813pub_table2QCRDJQAHT1814pub_table2RCRDJRAHT1815pub_table2SCRDJRAHT1816pub_table2PDRDJPAHf1818pub_fenceRDRDJHHs192pub_sofaJSDKHHS193pub_sofa2KSDKHHf195pub_fenceQASDKHHk1913pub_chair3QCSDJHHk1914pub_chair3RCSDJHHk1915pub_chair3SCSDJHHk1916pub_chair3PDSDJHHf1918pub_fenceRDSDJHHf201pub_fenceIPEKQAHf202pub_fenceJPEKRAHf203pub_fenceKPEKRAHf204pub_fencePAPEKRAHf205pub_fenceQAPEKKHf2018pub_fenceRDPEJHHS217pub_sofa2SAQEIPAHs218pub_sofaPBQEIPAHf2112pub_fencePCQEJQAHf2113pub_fenceQCQEJRAHf2114pub_fenceRCQEJRAHf2115pub_fenceSCQEJRAHf2116pub_fencePDQEJRAHf2117pub_fenceQDQEJRAHf2118pub_fenceRDQEJKHS226pub_sofa2RAREIJHt2215pub_tableSCREHHHC2216pub_chair2PDREHPAHC2217pub_chair2QDREHPAHs236pub_sofaRASEIJHT238pub_table2PBSEIIHs246pub_sofaRAPFIJHT248pub_table2PBPFIHHs256pub_sofaRAQFIJHT258pub_table2PBQFIJ','0',NULL),
('rooftop',17,12,4,2,'44xxxxxxxxxxxxxxxxxx\r\n444xxxxxxxxxxx444444\r\n4444xxxxxxxxxx444444\r\n44444xxxx4xxxx444444\r\n444444xxx44xxx444444\r\n44444444444444444444\r\n44444444444444444444\r\n44444444444444444444\r\n44444444xx44xx44xx44\r\n44444444xx44xx44xx44\r\n44444444444444444444\r\n44444444444444444444\r\n44444444444444444444\r\nx444444x444444xx4444\r\nx444444x444444xx333x\r\nx444444x444444xx222x\r\nx444444x444444xx11xx\r\nx444444x444444xxxxxx','PKHa10rooftop_minichairHIPAPAHd116rooftop_flatcurbPDIPAPAHe117rooftop_flatcurb2QDIPAPAHc20rooftop_rodtableHJPAHHa21rooftop_minichairIJPARAHa30rooftop_minichairHKPAHHd416rooftop_flatcurbPDPAPAHHe417rooftop_flatcurb2QDPAPAHHa62rooftop_minichairJRAPAPAHa71rooftop_minichairISAPAJHc72rooftop_rodtableJSAPAHHa73rooftop_minichairKSAPARAHa82rooftop_minichairJPBPAHHa90rooftop_minichairHQBPAPAHb100rooftop_emptytableHRBPAHHa110rooftop_minichairHSBPAHHd131rooftop_flatcurbIQCPAJHd136rooftop_flatcurbRAQCPARAHd138rooftop_flatcurbPBQCPAJHd1313rooftop_flatcurbQCQCPARAHf141rooftop_flatcurb3IRCPAJHf146rooftop_flatcurb3RARCPARAHf148rooftop_flatcurb3PBRCPAJHf1413rooftop_flatcurb3QCRCPARAHf151rooftop_flatcurb3ISCPAJHf156rooftop_flatcurb3RASCPARAHf158rooftop_flatcurb3PBSCPAJHf1513rooftop_flatcurb3QCSCPARAHf161rooftop_flatcurb3IPDPAJHf166rooftop_flatcurb3RAPDPARAHf168rooftop_flatcurb3PBPDPAJHf1613rooftop_flatcurb3QCPDPARAHg171rooftop_flatcurb4IQDPAHHf172rooftop_flatcurb3JQDPAHHf173rooftop_flatcurb3KQDPAHHf174rooftop_flatcurb3PAQDPAHHf175rooftop_flatcurb3QAQDPAHHh176rooftop_flatcurb5RAQDPAHHg178rooftop_flatcurb4PBQDPAHHf179rooftop_flatcurb3QBQDPAHHf1710rooftop_flatcurb3RBQDPAHHf1711rooftop_flatcurb3SBQDPAHHf1712rooftop_flatcurb3PCQDPAHHh1713rooftop_flatcurb5QCQDPAH','0',NULL),
('rooftop_2',4,9,0,2,'x0000x000\r\nxxxxxx000\r\n000000000\r\n000000000\r\n000000000\r\n000000000\r\n000000000\r\n000000000\r\n000000000\r\n000000000\r\nxxx000xxx\r\nxxx000xxx','RDHk08rooftop_bigchairPBHHPAHl18rooftop_bigtablePBIHHHj20rooftop_sofabHJHPAHi21rooftop_sofaIJHPAHk28rooftop_bigchairPBJHHHk38rooftop_bigchairPBKHPAHl48rooftop_bigtablePBPAHHHj50rooftop_sofabHQAHHHi51rooftop_sofaIQAHHHk58rooftop_bigchairPBQAHHHj60rooftop_sofabHRAHPAHi61rooftop_sofaIRAHPAHj67rooftop_sofabSARAHPAHi68rooftop_sofaPBRAHPAHj90rooftop_sofabHQBHHHi91rooftop_sofaIQBHHHj97rooftop_sofabSAQBHHHi98rooftop_sofaPBQBHH','0',NULL),
('star_lounge',37,36,0,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx2222x4444442222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222x444x32222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222xx4xx22222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx222222222222222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx222222222222222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx222222222222222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx222222222222222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx222222222222222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx222222222222222xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222222222222211111xxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222222222222211111xxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222222222222211111xxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222222222222211111xxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222222222222222111xxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx22222222222222222111xxxxxxxxx\r\nxxxxxxxxxxxxxxxx3333x22222222222222xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx3333x22222222222222xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx3333x22222222221111xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx3333xx2x22222220000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx333333332222222000000xxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx333333332222222x0000000xxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx33333332222222x0000000xxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxx222222000000xxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','PXHk1521star_tableQESCJHHa1522star_sofaRESCJPAHb1523star_sofa2SESCJPAHz1524palmPFSCJHHb1621star_sofa2QEPDJJHQ1632dj1PHPDJHHW1633dj2QHPDJHHE1634dj3RHPDJHHa1721star_sofaQEQDJJHm1728star_microphonePGQDPAHHb1821star_sofa2QERDJJHa1835star_sofaSHRDJRAHa1921star_sofaQESDJJHb1935star_sofa2SHSDJRAHb2021star_sofa2QEPEJJHb2024star_sofa2PFPEJJHa2032star_sofaPHPEJRAHa2035star_sofaSHPEJRAHa2121star_sofaQEQEJJHa2124star_sofaPFQEJJHb2132star_sofa2PHQEJRAHb2135star_sofa2SHQEJRAHc2221star_sofachairQEREJJHk2224star_tablePFREJHHb2225star_sofa2QFREJHHa2226star_sofaRFREJHHb2230star_sofa2RGREJHHa2231star_sofaSGREJHHk2232star_tablePHREJHHk2235star_tableSHREJHHz2321palmQESEJHHa2335star_sofaSHSEJRAHp2422bar10REPFJHHb2435star_sofa2SHPFJRAHa2437star_sofaQIPFIPAHb2438star_sofa2RIPFIPAHa2439star_sofaSIPFIPAHb2440star_sofa2PJPFIPAHo2522bar9REQFJHHb2525star_sofa2QFQFJHHa2526star_sofaRFQFJHHb2530star_sofa2RGQFJHHa2531star_sofaSGQFJHHa2535star_sofaSHQFJRAHb2536star_sofa2PIQFIJHi2622bar8RERFJHHX2625palm1QFRFJHHV2626palm3RFRFJHHC2630palm2RGRFJHHB2631palm4SGRFJHHb2635star_sofa2SHRFJRAHa2636star_sofaPIRFIJHk2639star_tableSIRFIHHk2640star_tablePJRFIHHu2722bar7RESFJHHa2725star_sofaQFSFJPAHb2726star_sofa2RFSFJPAHa2730star_sofaRGSFJPAHb2731star_sofa2SGSFJPAHk2735star_tableSHSFJHHz2736palmPISFIHHk2737star_tableQISFIHHy2822bar6REPGJHHt2922bar5REQGJHHk2925star_tableQFQGJHHk2926star_tableRFQGJHHk3016star_tablePDRGKHHr3022bar4RERGJHHb3116star_sofa2PDSGKJHe3122bar3RESGJHHb3125star_sofa2QFSGJHHa3126star_sofaRFSGJHHa3130star_sofaRGSGJRAHa3216star_sofaPDPHKJHw3222bar2REPHJHHB3225palm4QFPHJHHX3226palm1RFPHJHHb3230star_sofa2RGPHJRAHb3316star_sofa2PDQHKJHq3322bar1REQHJHHa3325star_sofaQFQHJPAHb3326star_sofa2RFQHJPAHa3330star_sofaRGQHJRAHa3416star_sofaPDRHKJHb3430star_sofa2RGRHJRAHV3435palm3SHRHHHHC3436palm2PIRHHHHk3516star_tablePDSHKHHa3530star_sofaRGSHJRAHb3630star_sofa2RGPIJRAHc3725star_sofachairQFQIJHHb3726star_sofa2RFQIJHHa3727star_sofaSFQIJHHb3728star_sofa2PGQIJHHa3729star_sofaQGQIJHHk3730star_tableRGQIJH','0',NULL),
('tearoom',21,19,1,6,'xxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxx3333x33333333x\r\n333333xx3333x33333333x\r\n3333333x3333x33333333x\r\n3333333x3333x33333333x\r\n3333333xxxxxx33333333x\r\n333333333333333333333x\r\n333333333333333333333x\r\n333333333333333333333x\r\n333333333333333333333x\r\n33333333222x333333333x\r\n33333333222x333333333x\r\n33333333222x333333333x\r\n33333333222x333333333x\r\n33333333111x333333333x\r\n33333333111x333333333x\r\n33333333111x333333333x\r\nxxxxxxxx111xxxxxxxxxxx\r\n11111111111111111111xx\r\n1111111111111111111111\r\n1111111111111111111111\r\n11111111111111111111xx','QIHh113hardwoodsofa1QCIKPAHi114hardwoodsofa2RCIKPAHj115hardwoodsofa3SCIKPAHc116teabambooPDIKHHh118hardwoodsofa1RDIKPAHi119hardwoodsofa2SDIKPAHj120hardwoodsofa3PEIKPAHl313teasmalltable1QCKKHHk315teasmalltable2SCKKHHl318teasmalltable1RDKKHHk320teasmalltable2PEKKHHe62teastoolJRAKPAHe63teastoolKRAKPAHf68chinastoolredPBRAKPAHf69chinastoolredQBRAKPAHf610chinastoolredRBRAKPAHf611chinastoolredSBRAKPAHa82teatable1JPBKHHb83teatable2KPBKHHm92teastool2JQBKHHm93teastool2KQBKHHe916teastoolPDQBKPAHe917teastoolQDQBKPAHa1116teatable1PDSBKHHb1117teatable2QDSBKHHe122teastoolJPCKPAHe123teastoolKPCKPAHm1216teastool2PDPCKHHm1217teastool2QDPCKHHa142teatable1JRCKHHb143teatable2KRCKHHm152teastool2JSCKHHm153teastool2KSCKHHd180teavaseHRDIHHg190chinastoolgreenHSDIJHg200chinastoolgreenHPEIJHd210teavaseHQEIH','0',NULL),
('theater',20,27,0,0,'XXXXXXXXXXXXXXXXXXXXXXX\r\nXXXXXXXXXXXXXXXXXXXXXXX\r\nXXXXXXXXXXXXXXXXXXXXXXX\r\nXXXXXXXXXXXXXXXXXXXXXXX\r\nXXXXXXXXXXXXXXXXXXXXXXX\r\nXXXXXXXXXXXXXXXXXXXXXXX\r\nXXXXXXX111111111XXXXXXX\r\nXXXXXXX11111111100000XX\r\nXXXX00X11111111100000XX\r\nXXXX00x11111111100000XX\r\n4XXX00X11111111100000XX\r\n4440000XXXXXXXXX00000XX\r\n444000000000000000000XX\r\n4XX000000000000000000XX\r\n4XX0000000000000000000X\r\n44400000000000000000000\r\n44400000000000000000000\r\n44X0000000000000000O000\r\n44X11111111111111111000\r\n44X11111111111111111000\r\n33X11111111111111111000\r\n22X11111111111111111000\r\n22X11111111111111111000\r\n22X11111111111111111000\r\n22X11111111111111111000\r\n22X11111111111111111000\r\n22211111111111111111000\r\n22211111111111111111000\r\nXXXXXXXXXXXXXXXXXXXX00X\r\nXXXXXXXXXXXXXXXXXXXX00X','QKHm1011micSBRBIHHd112thchair2JSBPAJHd122thchair2JPCPAJHd152thchair2JSCPAJHc156thchair1RASCHHHc157thchair1SASCHHHc158thchair1PBSCHHHc159thchair1QBSCHHHc1510thchair1RBSCHHHc1512thchair1PCSCHHHc1513thchair1QCSCHHHc1514thchair1RCSCHHHc1515thchair1SCSCHHHc1516thchair1PDSCHHHd162thchair2JPDPAJHc206thchair1RAPEIHHc207thchair1SAPEIHHc208thchair1PBPEIHHc209thchair1QBPEIHHc2010thchair1RBPEIHHc2012thchair1PCPEIHHc2013thchair1QCPEIHHc2014thchair1RCPEIHHc2015thchair1SCPEIHHc2016thchair1PDPEIHHc236thchair1RASEIHHc237thchair1SASEIHHc238thchair1PBSEIHHc239thchair1QBSEIHHc2310thchair1RBSEIHHc2312thchair1PCSEIHHc2313thchair1QCSEIHHc2314thchair1RCSEIHHc2315thchair1SCSEIHHc2316thchair1PDSEIHHc266thchair1RARFIHHc267thchair1SARFIHHc268thchair1PBRFIHHc269thchair1QBRFIHHc2610thchair1RBRFIHHc2612thchair1PCRFIHHc2613thchair1QCRFIHHc2614thchair1RCRFIHHc2615thchair1SCRFIHHc2616thchair1PDRFIH','0',NULL);
/*!40000 ALTER TABLE `room_models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `room_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT 0,
  `room_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `room_rights` WRITE;
/*!40000 ALTER TABLE `room_rights` DISABLE KEYS */;
INSERT INTO `room_rights` VALUES
(1,3,2),
(2,2,2);
/*!40000 ALTER TABLE `room_rights` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `room_word_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_word_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `word` varchar(255) NOT NULL DEFAULT 'bobba',
  PRIMARY KEY (`id`),
  KEY `room_id_word` (`room_id`,`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `room_word_filter` WRITE;
/*!40000 ALTER TABLE `room_word_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_word_filter` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('PUBLIC','PRIVATE') DEFAULT 'PRIVATE',
  `owner_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `owner` varchar(50) NOT NULL DEFAULT 'John',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `tags` varchar(65) NOT NULL DEFAULT '',
  `access_type` enum('password','doorbell','open','invisible') NOT NULL DEFAULT 'open',
  `processing_type` int(11) NOT NULL DEFAULT 0,
  `password` varchar(64) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 15,
  `max_users` int(11) NOT NULL DEFAULT 50,
  `score` int(11) NOT NULL DEFAULT 0,
  `model` varchar(64) NOT NULL DEFAULT 'model_a',
  `allow_pets` enum('0','1') NOT NULL DEFAULT '1',
  `allow_pets_eating` enum('0','1') NOT NULL DEFAULT '0',
  `allow_walkthrough` enum('0','1') NOT NULL DEFAULT '1',
  `hide_walls` enum('0','1') NOT NULL DEFAULT '0',
  `thickness_wall` int(11) NOT NULL DEFAULT 1,
  `thickness_floor` int(11) NOT NULL DEFAULT 1,
  `decorations` varchar(128) NOT NULL DEFAULT 'landscape=0.0',
  `heightmap` text DEFAULT NULL,
  `trade_state` enum('OWNER_ONLY','ENABLED','DISABLED') DEFAULT 'ENABLED',
  `mute_state` enum('NONE','RIGHTS') NOT NULL DEFAULT 'NONE',
  `kick_state` enum('NONE','RIGHTS','EVERYONE') NOT NULL DEFAULT 'NONE',
  `ban_state` enum('NONE','RIGHTS') NOT NULL DEFAULT 'NONE',
  `bubble_mode` tinyint(4) NOT NULL DEFAULT 0,
  `bubble_type` tinyint(4) DEFAULT 0,
  `bubble_scroll` tinyint(4) NOT NULL DEFAULT 0,
  `chat_distance` tinyint(4) NOT NULL DEFAULT 0,
  `flood_level` tinyint(4) NOT NULL DEFAULT 0,
  `disabled_commands` varchar(255) DEFAULT NULL,
  `required_badge` varchar(50) DEFAULT NULL,
  `thumbnail` varchar(128) NOT NULL DEFAULT 'camera/thumbnails/default1.png',
  `users_now` int(11) DEFAULT 0,
  `hide_wired` enum('0','1') DEFAULT '0',
  `user_idle_ticks` int(11) DEFAULT 600,
  `roller_speed_level` int(11) DEFAULT 4,
  `roller_speed` enum('0','1') NOT NULL DEFAULT '1',
  `creation_time` int(11) DEFAULT NULL,
  `wired_limit` enum('1','0') NOT NULL DEFAULT '0',
  `room_diagonal` enum('2','1','0') NOT NULL DEFAULT '2',
  `song_id` int(11) NOT NULL DEFAULT 0,
  `room_price` int(11) NOT NULL DEFAULT 0,
  `room_buyer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tags` (`tags`),
  KEY `score` (`score`),
  KEY `category` (`category`),
  KEY `type` (`type`),
  KEY `owner_id` (`owner_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES
(1,'PRIVATE',1,0,'Eu','aaa','','','open',0,'',29,10,0,'model_i','1','0','0','0',0,0,'landscape=0.0',NULL,'DISABLED','NONE','NONE','NONE',0,0,0,0,0,NULL,NULL,'camera/thumbnails/default1.png',0,'0',600,4,'1',1789409934,'0','2',0,0,NULL),
(2,'PRIVATE',1,0,'Eu','Sala de Teste','Hotel local para testar o emulador.','','open',3,'',29,10,0,'model_a','1','0','0','0',0,0,'landscape=0.0',NULL,'DISABLED','NONE','NONE','NONE',0,0,0,0,0,NULL,NULL,'camera/thumbnails/default1.png',2,'0',600,4,'1',1789410001,'0','2',0,0,NULL),
(3,'PRIVATE',3,0,'Jogador1','aaa','','','open',3,'',29,10,0,'model_i','1','0','0','0',0,0,'landscape=0.0,',NULL,'DISABLED','NONE','NONE','NONE',0,0,0,0,0,NULL,NULL,'camera/thumbnails/default1.png',2,'0',600,4,'1',1789411873,'0','2',0,0,NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `rooms_promoted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_promoted` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_expire` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `expire` (`time_expire`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5771 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `rooms_promoted` WRITE;
/*!40000 ALTER TABLE `rooms_promoted` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms_promoted` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `button_text` varchar(35) DEFAULT NULL,
  `button_link` varchar(512) DEFAULT '',
  `image_path` varchar(200) DEFAULT NULL,
  `visible` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_articles` WRITE;
/*!40000 ALTER TABLE `server_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_articles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_bets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_bets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_bets` WRITE;
/*!40000 ALTER TABLE `server_bets` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_bets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_calendar_gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_calendar_gifts` (
  `day` int(11) NOT NULL,
  `gift` varchar(24) NOT NULL DEFAULT '',
  `product` varchar(32) NOT NULL DEFAULT '',
  `image` varchar(128) DEFAULT '',
  `item` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_calendar_gifts` WRITE;
/*!40000 ALTER TABLE `server_calendar_gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_calendar_gifts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_configuration` (
  `id` int(11) DEFAULT NULL,
  `motd_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `target_offer_id` int(11) NOT NULL DEFAULT 0,
  `motd_message` varchar(500) NOT NULL DEFAULT 'Welcome to Comet!',
  `hotel_name` varchar(100) NOT NULL DEFAULT 'Comet',
  `hotel_url` varchar(100) NOT NULL DEFAULT '',
  `group_cost` int(11) NOT NULL DEFAULT 100,
  `online_reward_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `online_reward_interval` int(11) NOT NULL DEFAULT 15,
  `online_reward_credits` int(11) NOT NULL DEFAULT 150,
  `online_reward_duckets` int(11) NOT NULL DEFAULT 150,
  `about_image` varchar(100) NOT NULL DEFAULT '',
  `about_show_players_online` enum('true','false') NOT NULL DEFAULT 'false',
  `about_show_rooms_active` enum('true','false') NOT NULL DEFAULT 'false',
  `about_show_uptime` enum('true','false') NOT NULL DEFAULT 'false',
  `floor_editor_max_x` int(11) NOT NULL DEFAULT 0,
  `floor_editor_max_y` int(11) NOT NULL DEFAULT 0,
  `floor_editor_max_total` int(11) NOT NULL DEFAULT 0,
  `room_max_players` int(11) NOT NULL DEFAULT 500,
  `room_encrypt_passwords` enum('true','false') NOT NULL DEFAULT 'false',
  `room_can_place_item_on_entity` enum('true','false') NOT NULL DEFAULT 'false',
  `room_max_bots` int(11) NOT NULL DEFAULT 15,
  `room_max_pets` int(11) NOT NULL DEFAULT 15,
  `room_wired_reward_minimum_rank` int(11) NOT NULL DEFAULT 7,
  `room_wired_max_effects` int(11) NOT NULL DEFAULT 10,
  `room_wired_max_triggers` int(11) NOT NULL DEFAULT 10,
  `room_wired_max_execute_stacks` int(11) NOT NULL DEFAULT 5,
  `room_idle_minutes` int(11) NOT NULL DEFAULT 15,
  `word_filter_mode` enum('default','smart','strict') NOT NULL DEFAULT 'default',
  `word_filter_strict_chars` varchar(500) NOT NULL DEFAULT '',
  `use_database_ip` enum('true','false') NOT NULL DEFAULT 'false',
  `save_logins` enum('true','false') NOT NULL DEFAULT 'false',
  `player_infinite_balance` enum('true','false') NOT NULL DEFAULT 'false',
  `player_gift_cooldown` int(11) NOT NULL DEFAULT 30,
  `player_change_figure_cooldown` int(11) NOT NULL DEFAULT 5,
  `player_figure_validation` enum('true','false') NOT NULL DEFAULT 'false',
  `messenger_max_friends` int(11) NOT NULL DEFAULT 1500,
  `messenger_log_messages` enum('true','false') NOT NULL DEFAULT 'true',
  `storage_item_queue_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `storage_player_queue_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `camera_photo_upload_url` varchar(255) NOT NULL DEFAULT 'http://localhost/photos/photos/%photoId%.png',
  `camera_photo_itemid` int(11) NOT NULL DEFAULT 50001,
  `camera_photo_url` varchar(255) NOT NULL DEFAULT 'http://localhost/photos/photos/%photoId%.png',
  `max_connections_per_ip` int(11) NOT NULL DEFAULT 5,
  `max_connections_block_suspicious` enum('true','false') NOT NULL DEFAULT 'true',
  `log_catalog_purchases` enum('true','false') DEFAULT 'true',
  `group_chat_enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `hall_of_fame_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `hall_of_fame_currency` varchar(50) NOT NULL DEFAULT 'vip_points',
  `hall_of_fame_refresh_minutes` int(11) NOT NULL DEFAULT 10,
  `hall_of_fame_texts_key` varchar(50) NOT NULL DEFAULT 'halloffame',
  `online_reward_diamonds_interval` int(11) NOT NULL DEFAULT 15,
  `online_reward_diamonds` int(11) NOT NULL DEFAULT 5,
  `online_reward_double_days` varchar(255) NOT NULL DEFAULT '',
  `emoji_image_path_url` varchar(256) DEFAULT 'http://localhost:8080/assets/img/emoji/',
  `crypto_enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `crypto_e` varchar(256) NOT NULL DEFAULT '3',
  `crypto_n` varchar(256) NOT NULL DEFAULT '86851dd364d5c5cece3c883171cc6ddc5760779b992482bd1e20dd296888df91b33b936a7b93f06d29e8870f703a216257dec7c81de0058fea4cc5116f75e6efc4e9113513e45357dc3fd43d4efab5963ef178b78bd61e81a14c603b24c8bcce0a12230b320045498edc29282ff0603bc7b7dae8fc1b05b52b2f301a9dc783b',
  `crypto_d` varchar(256) NOT NULL DEFAULT '59ae13e243392e89ded305764bdd9e92e4eafa67bb6dac7e1415e8c645b0950bccd26246fd0d4af37145af5fa026c0ec3a94853013eaae5ff1888360f4f9449ee023762ec195dff3f30ca0b08b8c947e3859877b5d7dced5c8715c58b53740b84e11fbc71349a27c31745fcefeeea57cff291099205e230e0c7c27e8e1c0512',
  `websockets_whitelist` varchar(256) NOT NULL DEFAULT 'localhost',
  `websockets_enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `cantity_users_landing` int(11) NOT NULL DEFAULT 100,
  `reward_code_badge` varchar(100) NOT NULL DEFAULT 'VIP',
  `bonus_bag_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `bonus_reward_name` varchar(100) NOT NULL DEFAULT 'throne',
  `bonus_hours` int(11) NOT NULL DEFAULT 100,
  `bonus_reward_itemid` int(11) NOT NULL DEFAULT 28,
  `websocket_url` varchar(100) NOT NULL DEFAULT 'wss://yungbeef.gabbuz.org/ws',
  `player_purchase_cooldown` int(11) NOT NULL DEFAULT 30,
  `max_rooms_creations` int(11) NOT NULL DEFAULT 100,
  `online_reward_credits_vip` int(11) NOT NULL DEFAULT 5,
  `online_reward_diamonds_vip` int(11) NOT NULL DEFAULT 5,
  `online_reward_duckets_vip` int(11) NOT NULL DEFAULT 150,
  `camera_photo_itemdid_xxl` int(11) DEFAULT 50001,
  `camera_thumbnail_upload_url` varchar(255) DEFAULT 'http://localhost:8080/camera/upload/%photoId%',
  `websockets_header` varchar(256) NOT NULL DEFAULT 'X-Forwarded-For',
  `monster_seed_id` int(11) NOT NULL DEFAULT 0,
  `talenttrack_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `camera_pricing_coins` int(11) NOT NULL DEFAULT 0,
  `camera_pricing_duckets` int(11) NOT NULL DEFAULT 0,
  `catalog_soldout_ltd_page` int(11) DEFAULT 521,
  `fill_area_max_size` int(11) DEFAULT NULL,
  `fill_stack_max_height` int(11) DEFAULT NULL,
  `fill_place_item_delay` int(11) DEFAULT NULL,
  `place_items_async` enum('0','1') DEFAULT NULL,
  `event_badge_prefix` text DEFAULT NULL,
  `event_diamonds_amount` text DEFAULT NULL,
  `event_credits_amount` text DEFAULT NULL,
  `event_duckets_amount` text DEFAULT NULL,
  `event_duckets_before_100_amount` text DEFAULT NULL,
  `event_seasonal_amount` text DEFAULT NULL,
  `event_badge_prefix_maratona` text DEFAULT NULL,
  `calendar_time` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_configuration` WRITE;
/*!40000 ALTER TABLE `server_configuration` DISABLE KEYS */;
INSERT INTO `server_configuration` VALUES
(1,'false',1,'Welcome to Habbo','habbo','https://habbo.com',5,'true',10,200,10,'','true','true','true',5000,5000,25000000,300,'false','false',15,10,13,500,500,500,10,'smart','true','false','true','false',30,1,'true',1500,'true','false','true','/var/www/CMS/public/camera/',93,'https://habbo.com/camera/%photoId%',9999999,'false','true','false','true','seasonal_points',10,'halloffame',0,0,'','https://habbo.com/flash/emojis/','false','3','86851dd364d5c5cece3c883171cc6ddc5760779b992482bd1e20dd296888df91b33b936a7b93f06d29e8870f703a216257dec7c81de0058fea4cc5116f75e6efc4e9113513e45357dc3fd43d4efab5963ef178b78bd61e81a14c603b24c8bcce0a12230b320045498edc29282ff0603bc7b7dae8fc1b05b52b2f301a9dc783b7','59ae13e243392e89ded305764bdd9e92e4eafa67bb6dac7e1415e8c645b0950bccd26246fd0d4af37145af5fa026c0ec3a94853013eaae5ff1888360f4f9449ee023762ec195dff3f30ca0b08b8c947e3859877b5d7dced5c8715c58b53740b84e11fbc71349a27c31745fcefeeea57cff291099205e230e0c7c27e8e1c0512b','*','true',100,'VIP','false','throne',100,28,'wss://socket.habbo.com:2096',1,200,400,0,20,92,'/var/www/CMS/public/camera/thumbnails/','X-Forwarded-For',886734993,'0',0,0,521,100,35,75,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `server_configuration` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_external_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_external_configuration` (
  `id` int(11) NOT NULL,
  `houseekeping_furniture_edition` varchar(255) DEFAULT NULL,
  `prefix_badge_event` varchar(255) NOT NULL DEFAULT '',
  `badge_event_limit` int(11) NOT NULL DEFAULT 0,
  `event_diamonds_reward` int(11) NOT NULL DEFAULT 0,
  `event_diamonds_reward_double` int(11) NOT NULL DEFAULT 0,
  `enable_staff_messenger_logs` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_external_configuration` WRITE;
/*!40000 ALTER TABLE `server_external_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_external_configuration` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_locale` (
  `key` varchar(50) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_locale` WRITE;
/*!40000 ALTER TABLE `server_locale` DISABLE KEYS */;
INSERT INTO `server_locale` VALUES
('badge.deleted','You lost a badge!'),
('badge.get','You have received a badge!'),
('bots.chat.giveItemMessage','Here you go, %username%... Enjoy!'),
('bots.chat.tooFar','You\'re gonna have to come closer, %username%... I can\'t reach you!'),
('camera.photoTaken','Photo was successfully taken!'),
('catalog.error.nooffer','This item doesn\'t have an active offer!'),
('catalog.error.notenough','You don\'t have enough credits to buy this item!'),
('catalog.error.toomany','You can only purchase up to 50 items at once.'),
('command.about.description','Displays the server status.'),
('command.about.name','about'),
('command.addfilter.name','addfilter'),
('command.advban.description','Ban Advertiser for 5 days'),
('command.advban.name','advban'),
('command.advban.reason','Advertising for websites'),
('command.alert.description','Alert a user'),
('command.alert.name','alert'),
('command.alert.none','Who do you want to send a alert?'),
('command.alert.title','Alert'),
('command.autofloor.description','Remove unused boxes in your room'),
('command.autofloor.name','autofloor'),
('command.baby.description','Transform to a baby'),
('command.baby.name','baby'),
('command.ban.description','Bans a user.'),
('command.ban.error','Error while banning player:'),
('command.ban.name','ban'),
('command.bell.name','bell'),
('command.botcontrol.description','Freeze a bot on/off'),
('command.botcontrol.description\"',' \"Freeze a bot on/off\"'),
('command.botcontrol.name','botcontrol'),
('command.botcontrol.none','No bot selected'),
('command.brb.description','Put your the user in be right back state'),
('command.brb.name','brb'),
('command.bubble.description','Put on a specific bubble'),
('command.bubble.description\"',' \"Put on a specific bubble\"'),
('command.bubble.name','bubble'),
('command.bubble.params.invalid','You must enter the speech bubble number!'),
('command.bubble.success','The speech bubble has been successfully replaced!'),
('command.build.description','Displays the current build of the server.'),
('command.build.name','build'),
('command.bundle.create\"',' \"Utilize <br>:bundle create [name]</br> to create the bundle.\"'),
('command.bundle.description','Used for managing room bundles'),
('command.bundle.name','bundle'),
('command.buy_room.antispam','Antispam has been activated'),
('command.buy_room.bought','%user% has bought the room!'),
('command.buy_room.confirm','<b>Alert</b>Are you sure you want to buy this room? It will have a cost of <b>'),
('command.buy_room.description','Buy the room'),
('command.buy_room.has_group','This room is member of a group'),
('command.buy_room.name','buy_room'),
('command.buy_room.not_buyer','Eeeek! you are trying to buy the room from yourself...'),
('command.buy_room.not_enough','Sorry you do not have engough funds to buy the room!'),
('command.buy_room.not_on_sale','Not for sale!'),
('command.buy_room.owner_offline','Sorry the user is offline!'),
('command.buy_room.sold','The room is sold to %user%'),
('command.buy_room.you_are_owner','Sorry!, this is not your room'),
('command.clearscore.name','clearscore'),
('command.cloneroom.cloned','The room has been cloned successfully, it may take a few seconds.'),
('command.cloneroom.description','Clone the current room'),
('command.cloneroom.name','cloneroom'),
('command.closedice.description','Encloses the dice(s) around the user using the command.'),
('command.closedice.message','* %username% closed %amount% dice(s) *'),
('command.closedice.name','closedice'),
('command.coins.description','(username) (amount) Give an amount of credits to a user'),
('command.coins.errortitle','Error'),
('command.coins.formaterror','Error in format'),
('command.coins.name','coins'),
('command.coins.received','You received %amount% credits'),
('command.coins.title','Alert'),
('command.colour.blue','blue'),
('command.colour.cyan','cyan'),
('command.colour.description','Change the color of your messages'),
('command.colour.done','Your chat messages are now %colour%'),
('command.colour.green','green'),
('command.colour.invalid','Invalid color, colors available: %colours%'),
('command.colour.name','namecolor'),
('command.colour.purple','purple'),
('command.colour.red','red'),
('command.colour.reset','Your chat is back to normal!'),
('command.colour.reset.description','The color of your chat is back to normal!'),
('command.colour.reset.word','normal'),
('command.commands.description',' - List off all your commands.'),
('command.commands.name','commands'),
('command.commands.title','Command List'),
('command.count_furnis.name','count_furnis.name'),
('command.count_furnis.no_perm','Sorry you are not allowed to!'),
('command.dance.description','Let all the users dance'),
('command.dance.description\"',' \"Let all the users dance'),
('command.dance.name','dance'),
('command.deletegroup.confirm','Are you sure you want to delete this group? All items in the room will be returned to the rightful owner and the group will be deleted forever.<br><br>Use the command :deletegroup again to confirm!'),
('command.deletegroup.description','Delete the group in the room you are'),
('command.deletegroup.done','The group was deleted successfully.'),
('command.deletegroup.name','deletegroup'),
('command.deletegroup.nogroup','This room doesn\'t have a group to delete!'),
('command.deletegroup.permission','You do not have permission to delete this group!'),
('command.delete_all_items.confirm','<b>Alert</b>\\rAre you sure? You will erase all your items from the room.\\r\\rIf you are sure type <b>:'),
('command.delete_all_items.description','Deletes all your items from your room directly.'),
('command.delete_all_items.name','delete_all_items'),
('command.disablecommand.description','Disables a command for all players in the room.'),
('command.disablecommand.error','This command cannot be disabled!'),
('command.disablecommand.name','disablecommand'),
('command.disablecommand.success','The command was disabled successfully.'),
('command.disabled','This command is disabled in this room!'),
('command.disabledcommands.description','View the list of disabled commands in your room.'),
('command.disabledcommands.name','disabledcommands'),
('command.disablehotelalert.description','Turns hotel alerts on or off.'),
('command.disablehotelalert.name','disableha'),
('command.disablehotelalertlinks.description','Enables or disables linked hotel alerts.'),
('command.disablehotelalertlinks.name','disablehal'),
('command.disablemimic.description','Whether or not to allow them to copy your look.'),
('command.disablemimic.name','disablemimic'),
('command.disablewhisper.description','Turn off whispers'),
('command.disablewhisper.name','disablewhisper'),
('command.disconnect.description','Disconnect a user from the hotel.'),
('command.disconnect.errortitle','Command error'),
('command.disconnect.himself','You cannot disconnect yourself.'),
('command.disconnect.name','disconnect'),
('command.disconnect.none','Who do you want to disconnect?'),
('command.disconnect.undisconnectable','You cannot disconnect this player.'),
('command.djalert.description','[DJ] Create an exclusive event!'),
('command.djalert.name','djalert'),
('command.duckets.description','(username) (amount) Give an amount of duckets to a user'),
('command.duckets.name','duckets'),
('command.duckets.successmessage','You received %amount% duckets'),
('command.duckets.successtitle','Alert'),
('command.effect.none','To get a effect type :effect %number%'),
('command.ejectall.description',' - Ejects all the furniture from the room.'),
('command.ejectall.name','ejectall'),
('command.empty.confirm','<b>Warning!</b>\rAre you sure? You\'re going to delete your Furniture.\r\rIf you are sure type  <b>:empty yes</b>'),
('command.empty.description','Removed all items from your inventory.'),
('command.empty.emptied','Your inventory was cleared.'),
('command.empty.message','Your inventory was cleared.'),
('command.empty.name','empty'),
('command.empty.yes','yes'),
('command.emptybots.description','Remove all bots in your inventory'),
('command.emptybots.emptied','Your bots inventory was cleared.'),
('command.emptybots.name','emptybots'),
('command.emptyfriends.description','Delete all your friends you have added'),
('command.emptyfriends.name','emptyfriends'),
('command.emptyfriends.success','All friendships deleted successfully'),
('command.emptypets.confirm','<b>Warning!</b>\\rAre you sure you want to delete all of your pets?\\r\\rIf you are sure type  <b>:'),
('command.emptypets.description','Remove all pets in your inventory'),
('command.emptypets.emptied','Your pets inventory was cleared.'),
('command.emptypets.name','emptypets'),
('command.enable.description','Enables an effect.'),
('command.enable.invalidid','Invalid effect ID'),
('command.enable.name','enable'),
('command.enablecommand.description','Enables a command that was disabled previously.'),
('command.enablecommand.error','This command cannot be enabled!'),
('command.enablecommand.name','enablecommand'),
('command.enablecommand.success','The command was enabled successfully.'),
('command.error','Command error'),
('command.error.disabled','This command is currently disabled.'),
('command.eventalert.alerttitle','New event'),
('command.eventalert.buttontitle','Go to event room'),
('command.eventalert.message','Event is starting, participate!<br><br> The Event Promoter %username% is calling all the players to the <strong>%message%</strong> event. <br><br>Participate in our events to earn new badges!'),
('command.eventalert.name','eventalert'),
('command.eventreward.already_got','This player has already received this reward!'),
('command.eventreward.description','Gives a player a badge & points'),
('command.eventreward.name','eventreward'),
('command.eventreward.notfound','Could not find that player!'),
('command.eventreward.received','You just received an event reward!'),
('command.eventreward.seasonal_points','1'),
('command.eventreward.vip_points','1'),
('command.eventwon.description','Broadcast the eventwinner'),
('command.eventwon.message','%user% has won the event'),
('command.eventwon.name','eventwon'),
('command.executed','Command is executed succesfully.'),
('command.fastwalk.description','Activate fast walking'),
('command.fastwalk.disabled','Fastwalk has been disabled.'),
('command.fastwalk.enabled','Fastwalk has been enabled.'),
('command.fastwalk.name','fastwalk'),
('command.fill.already_in_use','The user {} is already using this command.'),
('command.fill.description','Build quickly with this command.'),
('command.fill.help','Build types:\\n\\narea: A region of squares will be filled with the next item you place, the items will be placed relative to your user and where you click to place the item.\\n\\nstack: The furniture will be stacked in the square you click (if stackable).'),
('command.fill.missing_args','You need to define the type of construction! To know more, say \':fill ?\''),
('command.fill.name','fill'),
('command.fill.off','Constructor mode disabled.'),
('command.fill.stack.missing_arg','You need to place how many items will be stacked (1-{})'),
('command.fill.stack.on','Item stacking defined in {} items.'),
('command.flagme.alreadybought','Hey! You have entered this command already, click on your avatar and after that on the button #Change your name#.'),
('command.flagme.bought','You can change your username by clicking on yourself in a room and then click on \'Change your name\'. You will be banned if your new name violates the rules!'),
('command.flagme.description','Get the ability to change your username'),
('command.flagme.incorrect','To continue, type: '),
('command.flagme.name','flagme'),
('command.flagme.yes','yes'),
('command.flaguser.description','Grants the ability to change the username to another user'),
('command.flaguser.name','flaguser'),
('command.flaguser.none','Who do you want to change the name of?'),
('command.floor.complete','The model has been modified and your room was unloaded. You may now re-enter your room!'),
('command.floor.invalid','The model you have created is not valid.'),
('command.floor.size','The model you have created is too big!'),
('command.follow.description','Follows the selected user'),
('command.follow.disabled','This user has follow disabled.'),
('command.follow.name','follow'),
('command.follow.none','Who you want to follow?'),
('command.follow.online','This user is not online!'),
('command.follow.playerhimself','You can\'t follow yourself!'),
('command.follow.room','This user is not in a room!'),
('command.freeze.description','Freeze a user in a room'),
('command.freeze.name','freeze'),
('command.freeze.none','Who do you want to freeze?'),
('command.freezebot.name','freezebot'),
('command.furnifix.name','furnifix'),
('command.givebadge.description','(username) (badgecode) Give a badge to a user'),
('command.givebadge.fail','Failed to give %username% badge: %badge%!'),
('command.givebadge.name','givebadge'),
('command.givebadge.success','Given %username% badge: %badge% successfully!'),
('command.giverank.description','Give a user an rank'),
('command.giverank.name','giverank'),
('command.giverank.success','Rank changed successfully!'),
('command.gotoroom.description','This will zapp you to a room (fill in the id)'),
('command.gotoroom.name','gotoroom'),
('command.handitem.description','Get a handitem'),
('command.handitem.invalid','Please, use numbers only!'),
('command.handitem.name','handitem'),
('command.handitem.none','You have to type :drink %number%'),
('command.hidewired.description','Remove the wireds in your room'),
('command.hidewired.hidden','Wired is now hidden'),
('command.hidewired.name','hidewired'),
('command.hidewired.shown','Wired is now visible'),
('command.highscore.description','Clean up the scoreboards you have in your room'),
('command.home.description','Return to your home room.'),
('command.home.name','home'),
('command.hotelalert.description','Sends the entire hotel an alert.'),
('command.hotelalert.name','ha'),
('command.hotelalert.title','Message From Hotel Management'),
('command.hotelalertlink.buttontitle','Click here'),
('command.hotelalertlink.description','Sends a notification with a link to all players.'),
('command.hotelalertlink.name','hotelalertlink,hal'),
('command.hug.antispam','Antispam has been activated, try again in a few moments.'),
('command.hug.himself','You cannot embrace yourself.'),
('command.hug.message','You hugged %username%.'),
('command.hug.name','hug'),
('command.ignore_invites.description','Ignore invitations.'),
('command.ignore_invites.name','ignoreinvites'),
('command.instancestats.description',' - Build and game statistics'),
('command.invisible.description','Turns player invisible to all other players.'),
('command.invisible.disabled','Invisibility is now disabled (players can now see you).'),
('command.invisible.enabled','Invisibility is now enabled.'),
('command.invisible.name','invisible'),
('command.invite_friends.antispam','Antispam has been activated, try again in a few moments.'),
('command.invite_friends.description','Invite friends'),
('command.invite_friends.name','invite_friends'),
('command.invite_friends.no_message','Sorry but no message was recived'),
('command.invite_friends.sent','The invite has been send to the user'),
('command.ipban.description','Bans the IP of selected user.'),
('command.ipban.name','ipban'),
('command.itemdata.description',' - Gets the data for the item you\'re currently standing on.'),
('command.itemid.description',' - Shows all current loaded virtual item ID\'s loaded in memory.'),
('command.kick.description','Kick a user from the room.'),
('command.kick.error','Command error'),
('command.kick.name','kick'),
('command.kick.successmessage','You have been kicked from the room.'),
('command.kick.successtitle','Information'),
('command.kick.userkicked','%username% was kicked from the room!'),
('command.kiss.description','kiss a user'),
('command.kiss.himself','You can\'t kiss yourself!'),
('command.kiss.name','kiss'),
('command.kiss.none','Who do you want to kiss?'),
('command.kiss.word','snogs'),
('command.lay.description','Be lay on the floor'),
('command.lay.name','lay'),
('command.listen.name','listen'),
('command.listen.notfound','User is not found!'),
('command.logsclient.description','Logs of what is done inside the hotel in notifications.'),
('command.logsclient.name','logsclient'),
('command.look.description','Switch to a saved look without opening the closet.'),
('command.look.name','look'),
('command.machineban.description','Bans the provided user\'s hardware ID.'),
('command.machineban.name','machineban'),
('command.maintenance.name','maintenance'),
('command.makesay.description','Use this to control the speech of the user'),
('command.makesay.name','makesay'),
('command.massbadge.name','massbadge'),
('command.masscoins.name','masscoins'),
('command.massduckets.name','massduckets'),
('command.masseffect.description','Send a mass effect to the room'),
('command.masseffect.invalidid','invalid effect ID'),
('command.masseffect.name','masseffect'),
('command.masseffect.none\"','To give everyone in the room an effect type :masseffect %number%'),
('command.massfreeze.description','Freeze the whole room!'),
('command.massfreeze.name','massfreeze'),
('command.masshanditem.description','Give the room all an handitem'),
('command.masshanditem.invalidid','invalid handitem ID'),
('command.masshanditem.name','masshanditem'),
('command.masshanditem.none','To give everyone in the room an handitem type :masshanditem %number%'),
('command.massmotd.description','Sends a mass MOTD notification.'),
('command.massmotd.name','massmotd'),
('command.masspoints.name','masspoints'),
('command.masswarp.description','Warp everybody in the room to a other room'),
('command.masswarp.name','masswarp'),
('command.maxfloor.complete','maxfloor command has been completed'),
('command.maxfloor.description','Extend the floor of your living room as much as possible'),
('command.maxfloor.name','maxfloor'),
('command.me.description','Speak with exclamation mark'),
('command.me.name','me'),
('command.mentions.description','Check your list of mentions received'),
('command.mentions.name','mentions'),
('command.mentionsettings.all.set','Mentions will be received from everyone!'),
('command.mentionsettings.description','Establish who can mention you'),
('command.mentionsettings.friends.set','Mentions are disabled.'),
('command.mentionsettings.name','mentionsettings'),
('command.mentionsettings.set','Mentions will only be received from friends.'),
('command.mimic.description','Copies the figure of the chosen player'),
('command.mimic.disabled','You can\'t steal the look of this user.'),
('command.mimic.name','mimic'),
('command.mimic.none','Who do you want to steal?'),
('command.mimic.offline','This user is offline!'),
('command.mimicoff.description','Copies a user\'s look when a user is offline'),
('command.mimicoff.name','mimicoff'),
('command.moonwalk.description','Do the moonwalk! (VIP only)'),
('command.moonwalk.disabled','Moonwalking is now disabled!'),
('command.moonwalk.enabled','Moonwalking is now enabled!'),
('command.moonwalk.name','moonwalk'),
('command.mute.muted','You\'re muted!'),
('command.mute.name','shutup'),
('command.mute.none','Who do you want to mute?'),
('command.mutepets.description','Mute the pets you have in your living room'),
('command.mutepets.name','mutepets'),
('command.muteusers.description','Ignore the speech of a user in the room.'),
('command.muteusers.name','muteusers'),
('command.muteusers.name\"','muteusers'),
('command.namecolour.description','Put color to your name'),
('command.namecolour.name','namecolor'),
('command.namecolour.success','Color set successfully!'),
('command.namecolour.wisper','The color you typed is invalid! Please try again. Example: FF00FF'),
('command.need.rights','You need rights to use this command!'),
('command.noface.description','Hides your face'),
('command.noface.name','noface'),
('command.nospam.name','nospam'),
('command.notaround','Oops! %playername% is not nearby, walk to this player.'),
('command.notification.description','<image> <message>'),
('command.notification.name','notification'),
('command.notilook.name','notilook'),
('command.online.description','Check hotel statistics in real time'),
('command.online.name','online'),
('command.override.description','Walk on furniture that are forbidden to walk on'),
('command.override.disable','The Override is deactivated !'),
('command.override.enable','The Override is activated !'),
('command.override.name','override'),
('command.parameter.alert','%username% %message%'),
('command.parameter.amount','%amount%'),
('command.parameter.badge','%badge%'),
('command.parameter.ban','%username% %hour% %reason%'),
('command.parameter.message','%message%'),
('command.parameter.number','%number%'),
('command.parameter.reason','%reason%'),
('command.parameter.roomid','%roomid%'),
('command.parameter.softban','%username% %reason%'),
('command.parameter.time','%time%'),
('command.parameter.username','%username%'),
('command.params.length','Oops! You did something wrong!'),
('command.pathfinder.changed','Pathfinder changed to'),
('command.pathfinder.description','Change the pathfinder for the room'),
('command.pathfinder.modified','Pathfinder modified for '),
('command.pathfinder.name','pathfinder'),
('command.pets.toomany','There are already too many pets in this room!'),
('command.pickall.description','Picks all items in a room up.'),
('command.pickall.name','pickall'),
('command.pickallwired.name','pickallwired'),
('command.pickallwireds.description\"',' \"Collect all the wireds in your room with this command'),
('command.playerinfo.description','Displays information on the chosen player'),
('command.playerinfo.name','playerinfo'),
('command.points.description','(username) (amount) Give an amount of points to a user'),
('command.points.name','points'),
('command.points.successmessage','You received %amount% points'),
('command.points.successtitle','Alert'),
('command.position.description',' - Check the coordinates of your position in the room.'),
('command.position.name','position'),
('command.prefix.description\"',' \"Add a prefix to your name\"'),
('command.prefix.filtered','Prefix is set to %prefix%'),
('command.prefix.invalid','This is an invalid prefix'),
('command.prefix.name','prefix'),
('command.processtimes.description',' - Record process times for a room (Max: 30).'),
('command.promoteoffer.description','Create Offers'),
('command.publicroom.add.success','The room was added to Public Rooms!'),
('command.publicroom.alreadypublic','The room is already public!'),
('command.publicroom.name','publicroom'),
('command.publicroom.notpublic','The room is not public!'),
('command.publicroom.remove.success','The room was removed from Public Rooms!'),
('command.pull.description','Pulls a user.'),
('command.pull.message','*pulls %playername%*'),
('command.pull.name','pull'),
('command.pull.none','Who do you want to pull?'),
('command.pull.playerhimself','You can\'t pull yourself!'),
('command.pull.usernotvip','You must be VIP to use this command!'),
('command.punch.himself','You can\'t punch yourself!'),
('command.punch.none','Who do you want to punch?'),
('command.punch.word','punch'),
('command.push.description','Pushes a user.'),
('command.push.invalidusername','Invalid username!'),
('command.push.message','*pushes %playername%*'),
('command.push.name','push'),
('command.push.none','Who do you want to push?'),
('command.push.outdoor','You can\'t push a user out of the room!'),
('command.push.playerhimself','You can\'t push yourself!'),
('command.push.usernotvip','You must be VIP to use this command!'),
('command.pyramid.description','Hides in the ground and periodically rises'),
('command.pyramid.name','pyramid'),
('command.quickpoll.description','Do a quickpoll in the hotel'),
('command.quickpoll.name','quickpoll'),
('command.randomize.description','Get random numbers'),
('command.randomize.done','The number chosen between %min% and %max% was <b>%output%</b>!'),
('command.randomize.invalidnumbers','Invalid numbers'),
('command.randomize.name','randomize'),
('command.randomize.negative','You can only use positive numbers!'),
('command.randomize.none','Between which 2 numbers do you want to randomize?'),
('command.randomize.toohigh','The minimum or maximum number is not valid. Choose between 0 and 1000!'),
('command.reload.bans','Bans were reloaded successfully.'),
('command.reload.catalog','Catalog was reloaded successfully.'),
('command.reload.description','Use :reload list to view more info.'),
('command.reload.items','Item definitions were reloaded successfully.'),
('command.reload.locale','Locale was reloaded successfully.'),
('command.reload.name','reload'),
('command.reload.navigation','Navigation was reloaded successfully.'),
('command.reload.news','News articles were reloaded successfully.'),
('command.reload.permissions','Permissions were reloaded successfully.'),
('command.reloadmapping.description',' - Reload Mapping of room.'),
('command.reloadroom.name','reloadroom'),
('command.reminderevent.name','reminderevent'),
('command.removebadge.description','(username) (badgecode) Remove the badge to a user'),
('command.removebadge.name','removebadge'),
('command.restart.description','Restarts the server instance.'),
('command.restart.name','restart'),
('command.roll.description','Roll a number'),
('command.roll.name','roll'),
('command.room.error','Oops! an room error occurred'),
('command.roomaction.name','roomaction'),
('command.roomalert.description','Send an alert to the room'),
('command.roomalert.name','roomalert'),
('command.roombadge.description','Give the whole room a badge'),
('command.roombadge.name','roombadge'),
('command.roomban.description','Ban a user from the room.'),
('command.roomban.name','roomban'),
('command.roomban.whisper','Oops, you have to choose a valid option. (time/day/week/always)'),
('command.roomgrid.description',' - This will show you the grid of the room.'),
('command.roomkick.description','(message) Kick all of users from the room'),
('command.roomkick.name','roomkick'),
('command.roomkick.title','Alert'),
('command.roommass.seasonal.name','roommassseasonal'),
('command.roommmasscoins.name','roommmasscoins'),
('command.roommmasspoints.name','roommmasspoints'),
('command.roommute.description','Mute all the users in the room'),
('command.roommute.name','roommute'),
('command.roomnotification.description','Send an room notification message'),
('command.roomnotification.name','roomnotification'),
('command.roomoption.description','For the room option you can use: shake, rotate & disco'),
('command.roomoption.name','roomoption'),
('command.screenshot.description','Take a screenshot of the room.'),
('command.screenshot.name','screenshot'),
('command.see_height.activated','Active command, double-click the mobi you want to see the height.'),
('command.see_height.description','See the height of a furni by clicking 2x on it'),
('command.see_height.disabled','Command disabled.'),
('command.see_height.name','see_height'),
('command.sell_room.description','Sell the room'),
('command.sell_room.description\"',' \"Sell the room\"'),
('command.sell_room.has_group','This room is member of a group'),
('command.sell_room.invalid_amount','A invalid amount'),
('command.sell_room.name','sell_room'),
('command.sell_room.not_yourself','Eeeek! you are trying to sell the room to yourself...'),
('command.sell_room.not_your_room','Sorry!, this is not your room'),
('command.sell_room.specify_buyer','Define the username who will buy this room'),
('command.sell_room.user_not_found','Sorry!, the user is not found.'),
('command.senduser.name','senduser'),
('command.setbet.name','setbet'),
('command.setidletimer.description','Set the Wired AFK time in seconds with this command'),
('command.setidletimer.name','setidletimer'),
('command.setidletimer.set','The idle timmer is set to %seconds% seconds'),
('command.setmax.description','Changes the max amount of players allowed in the room.'),
('command.setmax.done','The max amount was changed to %i!'),
('command.setmax.invalid','You must specify a valid number!'),
('command.setmax.name','setmax'),
('command.setmax.toomany','The number is too high! It must be lower than %i.'),
('command.setrot.description','Use this command to rotate the furniture'),
('command.setrot.description\"',' \"Use this command to rotate the furniture'),
('command.setrot.name','setrotate'),
('command.setspeed.description','Sets the speed of rollers in the room.'),
('command.setspeed.invalid','Please, use numbers only!'),
('command.setspeed.name','setspeed'),
('command.setspeed.none','To change the roller speed type :setspeed %number%'),
('command.setspeed.set','Speed of rollers was set to %s!'),
('command.setstate.description','Use this command to change the state of the furniture, available states in a range between 0 and 100.'),
('command.setstate.name','setstate'),
('command.setz.description','Use this command instead of a stackable block, with heights available in the range between -100 and 100.'),
('command.setz.name','setz'),
('command.sex.himself','You can\'t sex yourself!'),
('command.shutdown.name','shutdown'),
('command.sit.description','Be sit to the floor'),
('command.sit.name','sit'),
('command.slime.message','threw slime at %username%'),
('command.slime.name','slime'),
('command.slime.not_in_room','Sorry the user is not in the room'),
('command.slime.not_yourself','You can\'t slime yourself!'),
('command.softban.description','Ban user for 2 hours'),
('command.softban.name','softban'),
('command.staffalert.description','Send a staff alert message'),
('command.staffalert.name','staffalert'),
('command.staffinfo.description','Get all the staff info for a user'),
('command.staffinfo.name','staffinfo'),
('command.stand.description',' -Stand up.'),
('command.stand.name','stand'),
('command.successful','Command successful'),
('command.summon.description','Summons the selected player to the room you\'re currently in.'),
('command.summon.name','summon'),
('command.summon.none','Who do you want to follow you?'),
('command.summon.summoned','You\'ve been summoned by a member of staff!'),
('command.superban.description','Super ban a user'),
('command.superban.name','superban'),
('command.superpull.description','Pulls a far away user in front of you.'),
('command.superpull.name','superpull'),
('command.superpush.description','Push a nearby user away.'),
('command.superpush.name','superpush'),
('command.superwired.description','Review the list of commands available on the superwired'),
('command.superwired.name','superwired'),
('command.tagprofile.name','tagprofile'),
('command.tag_profile.message','You have successfully added a tag to the profile.'),
('command.tag_profile.parameter','{tag}'),
('command.teleport.description','Enables/Disables teleportation.'),
('command.teleport.disabled','Teleportation is disabled.'),
('command.teleport.enabled','Teleportation is enabled.'),
('command.teleport.name','teleport'),
('command.teleport_to_me.description','Teleport user nearby.'),
('command.teleport_to_me.done','%user% has been zapped to you!'),
('command.teleport_to_me.name','tp'),
('command.teleport_to_me.not_in_room','The user is not in a room'),
('command.teleport_to_me.not_yourself','Mabey in 2080 you can teleport yourself!'),
('command.teleport_to_me.specify_user','Please provide username'),
('command.teleport_to_me.user_offline','Oh no! the user is offline'),
('command.togglediagonal.description','enables/disables the diagonal as in the original habbo. Can only walk diagonally if the user can also walk to the position.'),
('command.togglediagonal.name','togglediagonal'),
('command.togglediagonal.nopermission','You don\'t have permission to use this command!'),
('command.toggleevents.description','Turn hotel event invitations on or off'),
('command.toggleevents.name','toggleevents'),
('command.togglefriends.description','Enable/disable friend requests'),
('command.togglefriends.disabled','You have turned off friend requests.'),
('command.togglefriends.enabled','You have turned on friend requests.'),
('command.togglefriends.name','togglefriends'),
('command.toggleshoot.description','Enable or disable shooting in the room'),
('command.toggleshoot.disable','shooting is disabled'),
('command.toggleshoot.disabled','Shooting is disabled'),
('command.toggleshoot.enable','Shooting is enabled'),
('command.toggleshoot.name','shoot'),
('command.toggletrade.name','toggletrade'),
('command.toggle_trade.description','Toggle trade, prevents you from being traded by having the trade off.'),
('command.toggle_trade.disabled','Disabled exchanges.'),
('command.toggle_trade.enabled','Exchanges activated.'),
('command.toggle_trade.info','To activate exchanges, type :exchanges on and to deactivate :exchanges off'),
('command.tradeban.name','tradeban'),
('command.transfer_room.description\"',' \"Transfer the room to a user.\"'),
('command.transfer_room.name','transfer_room'),
('command.transfer_room.same_user','You can\'t transfer the room to yourself!'),
('command.transfer_room.user_not_found','The user is not found!'),
('command.transform.description','Transform into the selected animal'),
('command.transform.name','transform'),
('command.transform.none','Oops! Which pet do you want to be?'),
('command.transform.notexists','Oops! This Pet name does not exists.'),
('command.twitch.description','Start a Twitch video'),
('command.twitch.name','twitch'),
('command.twitch.notification','%username% has started a Twitch Video!'),
('command.twitch.notification\"',' \"%username% has started a Twitch Video!\"'),
('command.unban.description','Unban a user'),
('command.unban.name','unban'),
('command.unban.notbanned','Oops! Perhaps this user has not been banned or has the machine banned.'),
('command.unban.success','You have successfully unbanned %s!'),
('command.unfreeze.description','Unfreeze a user int he room'),
('command.unfreeze.name','unfreeze'),
('command.unfreeze.none','Who do you want to unfreeze?'),
('command.unload.description','Unloads the room you\'re currently in'),
('command.unload.name','unload'),
('command.unmute.name','unmute'),
('command.updatefloor.description','Extend the floor of your room as much as possible'),
('command.updatefloor.name','updatefloor'),
('command.user.invalid','Username is invalid!'),
('command.user.muted','You are muted.'),
('command.user.notbannable','You\'re not able to ban this user!'),
('command.user.notinroom','This user is not in a room.'),
('command.user.offline','This user is offline!'),
('command.viewinventory.description','View Inventory'),
('command.viewinventory.error','Error!, maybe the user you searched for does not exist!'),
('command.viewinventory.name','viewinventory'),
('command.viewinventory.reset','It has been returned back your inventory!'),
('command.viewinventory.success','You\'ve changed your inventory successfully, write :viewinventory to return back your inventory.'),
('command.vip','You must be VIP to use this command!'),
('command.warp.name','warp'),
('command.warpbot.description','Attract or teleport a bot to your position'),
('command.warpbot.name','wrapbot'),
('command.welcome.name','welcome'),
('command.whisperalert.name','wa'),
('command.youtube.description','Start a youtube video'),
('command.youtube.name','youtube'),
('command.youtube.notification','%username% has started a YouTube Video!'),
('commands.cmd_promote_offer.info','info'),
('commands.cmd_promote_offer.list','Offers available (%amount%):'),
('commands.cmd_promote_offer.list.entry','%id%: %title%'),
('commands.cmd_promote_offer.remove','Offer removed successfully.'),
('commands.error.cmd_promote_offer.already_active','This offer is already active'),
('commands.error.cmd_promote_offer.not_found','Oops, there was an error inserting a new target offer.'),
('commands.keys.cmd_promote_offer','promote'),
('commands.success.cmd_promote_offer','Offer has been successfully changed to %id%: %title%'),
('drink.bubble','bubble'),
('drink.cappuccino','cappuccino'),
('drink.coffee','coffee'),
('drink.coke','coke'),
('drink.cola','cola'),
('drink.espresso','espresso'),
('drink.iced_coffee','iced coffee'),
('drink.java','java'),
('drink.love_potion','potion'),
('drink.milk','milk'),
('drink.mocha','mocha'),
('drink.pink_champagne','pink'),
('drink.tea','tea'),
('furni_placement_error','There is an error in the placement of the furni'),
('game.figure.invalid','That figure is invalid!'),
('game.kicked','You were kicked from the room!'),
('game.message.blocked','Your message was blocked because you said: %s'),
('game.received.achievementPoints','You\'ve received %points% achievement points!'),
('game.received.credits','You received {$} credits!'),
('game.received.credits.title','Credits received!'),
('game.room.full','This room is full!'),
('game.room.jukeboxExists','You can only have one jukebox per room!'),
('game.trade.error','There was an error with your trade, all items were returned to you.'),
('help.ticket.pending.message','Please wait until your previous call has been answered before submitting a new one.'),
('help.ticket.pending.title','Your other ticket hasn\'t been answered!'),
('key','value'),
('logchat.minrank','7'),
('mod.ban.nopermission','You don\'t have permission to ban this player!'),
('navigator.staff.picks.added.message','Room has been added to the staff picked rooms.'),
('navigator.staff.picks.added.title','Staff Picked Rooms'),
('navigator.staff.picks.removed.message','Room has been removed from the staff picked rooms.'),
('navigator.staff.picks.removed.title','Staff Picked Rooms'),
('notification.eventwin.enabled','true'),
('rank.too.high','You cannot grant a rank greater than or equal to your own.'),
('user.himself','You can\'t rank yourself'),
('command.brb.message','*I\'m AFK!*'),
('command.home.message','The power of the universe send you back to your home room!'),
('command.lay.error_sit','Oops!, you are not allowed to use the command here, as you are already sitting'),
('command.lay.error','Oops!, you are not allowed to right now as there is a effect active'),
('command.me.error','Oops!, We have received invalid input!');
/*!40000 ALTER TABLE `server_locale` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_permissions_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_permissions_ranks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `flood_bypass` tinyint(1) NOT NULL DEFAULT 0,
  `flood_time` int(11) NOT NULL DEFAULT 30,
  `disconnectable` tinyint(1) NOT NULL DEFAULT 1,
  `mod_tool` tinyint(1) NOT NULL DEFAULT 0,
  `alfa_tool` tinyint(1) NOT NULL DEFAULT 0,
  `bannable` tinyint(1) NOT NULL DEFAULT 0,
  `room_kickable` tinyint(1) NOT NULL DEFAULT 1,
  `room_full_control` tinyint(1) NOT NULL DEFAULT 1,
  `room_mute_bypass` tinyint(1) NOT NULL DEFAULT 1,
  `room_filter_bypass` tinyint(1) NOT NULL DEFAULT 0,
  `room_ignorable` tinyint(1) NOT NULL DEFAULT 1,
  `room_enter_full` tinyint(1) NOT NULL DEFAULT 1,
  `room_enter_locked` tinyint(1) NOT NULL DEFAULT 1,
  `room_staff_pick` tinyint(1) NOT NULL DEFAULT 1,
  `room_see_whispers` tinyint(1) NOT NULL DEFAULT 1,
  `messenger_staff_chat` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_max_friends` int(11) NOT NULL DEFAULT 1100,
  `about_detailed` tinyint(1) NOT NULL DEFAULT 0,
  `about_stats` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_log_chat` tinyint(1) NOT NULL DEFAULT 1,
  `login_notif` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_alfa_chat` tinyint(1) NOT NULL DEFAULT 0,
  `control_mpu` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_permissions_ranks` WRITE;
/*!40000 ALTER TABLE `server_permissions_ranks` DISABLE KEYS */;
INSERT INTO `server_permissions_ranks` VALUES
(1,'User',0,20,1,0,0,1,1,0,0,0,1,0,0,0,0,0,1500,0,0,0,0,0,0),
(2,'VIP',0,5,1,0,0,1,1,0,0,0,1,1,0,0,0,0,2500,0,0,0,0,0,0),
(3,'No name 1',0,10,1,0,0,1,1,0,0,0,1,0,0,0,0,0,1500,0,0,0,0,0,0),
(4,'Non ame 2',0,10,1,0,0,1,1,0,0,0,1,0,0,0,0,0,1500,0,0,0,0,0,0),
(5,'Ambassador',0,10,1,0,0,1,1,0,0,0,1,0,0,0,0,0,1500,0,0,0,0,0,1),
(6,'RPG/VISA',0,10,1,0,0,1,1,0,0,0,1,0,0,0,0,0,1500,0,0,0,0,0,1),
(7,'Staff',0,5,0,1,0,0,0,1,1,1,0,1,1,1,1,1,5000,1,1,1,1,0,1),
(8,'Hidden Staff',0,5,0,1,0,0,0,1,1,1,0,1,1,1,1,1,5000,1,1,1,1,0,1);
/*!40000 ALTER TABLE `server_permissions_ranks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `server_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_status` (
  `active_players` int(11) DEFAULT 0,
  `player_record` int(11) DEFAULT 0,
  `active_rooms` int(11) DEFAULT 0,
  `server_version` varchar(50) DEFAULT '0',
  `player_record_timestamp` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `server_status` WRITE;
/*!40000 ALTER TABLE `server_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_status` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(256) DEFAULT NULL,
  `value` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `song_data` text NOT NULL,
  `artist` varchar(32) NOT NULL,
  `creator_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sub_navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_navigations` (
  `navigation_id` int(11) unsigned DEFAULT 1,
  `visible` int(11) unsigned DEFAULT 1,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sub_navigations` WRITE;
/*!40000 ALTER TABLE `sub_navigations` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_navigations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `background_color` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `trade_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `items_id` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `trade_logs` WRITE;
/*!40000 ALTER TABLE `trade_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('COINS','DUCKETS','VIP_POINTS','SEASONAL_POINTS','BADGE') NOT NULL DEFAULT 'COINS',
  `data` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `claimed_by` int(11) NOT NULL DEFAULT 0,
  `claimed_at` int(11) NOT NULL DEFAULT 0,
  `status` enum('UNCLAIMED','CLAIMED') NOT NULL DEFAULT 'UNCLAIMED',
  `code` varchar(128) NOT NULL DEFAULT 'voucher-00001',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `created_by` (`created_by`),
  KEY `claimed_by` (`claimed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wordfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wordfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL,
  `replacement` varchar(50) DEFAULT '*****',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wordfilter` WRITE;
/*!40000 ALTER TABLE `wordfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `wordfilter` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wordfilter_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wordfilter_characters` (
  `character` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wordfilter_characters` WRITE;
/*!40000 ALTER TABLE `wordfilter_characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `wordfilter_characters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

