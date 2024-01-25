-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.3.35-MariaDB-1:10.3.35+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chao_addresses`
--

DROP TABLE IF EXISTS `chao_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_fk_updrvbhmbxitqftbsoljwtvxyxobqkljvkus` (`ownerId`),
  CONSTRAINT `chao_fk_bmkdxwlsemzoqrnbrivfilxczdjgxiaakzau` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_updrvbhmbxitqftbsoljwtvxyxobqkljvkus` FOREIGN KEY (`ownerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_announcements`
--

DROP TABLE IF EXISTS `chao_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_pujjolklgjzxavaduscbsajgcsjvbmxzvbms` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `chao_idx_ksjeapwhlsxlkvagewhfoifvqndpbsiedrvh` (`dateRead`),
  KEY `chao_fk_zrnfiqqmjqomskwlgttdwgxbemomhcxzvgac` (`pluginId`),
  CONSTRAINT `chao_fk_rkbxyhdmasdsnpamiipyoqbwjtmltnvyprqb` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_zrnfiqqmjqomskwlgttdwgxbemomhcxzvgac` FOREIGN KEY (`pluginId`) REFERENCES `chao_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_assetindexdata`
--

DROP TABLE IF EXISTS `chao_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_kdcczgzuemzpftdksveuozwmzllfybosqdue` (`sessionId`,`volumeId`),
  KEY `chao_idx_afbiqyrintkcoxxvipogzqmbxnonympmazfo` (`volumeId`),
  CONSTRAINT `chao_fk_rsoslrtkpaercywmtixdpinbgqkankalrzoe` FOREIGN KEY (`volumeId`) REFERENCES `chao_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_ybuunlptpaqoziogzakpqbpjrzedsusfrjow` FOREIGN KEY (`sessionId`) REFERENCES `chao_assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_assetindexingsessions`
--

DROP TABLE IF EXISTS `chao_assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_assets`
--

DROP TABLE IF EXISTS `chao_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_qbulxrdnqlwrtgymndfhlrlttzlcdqwchvnj` (`filename`,`folderId`),
  KEY `chao_idx_gmlzhppqqkthltwnrpnhzccnmnseigkwgrku` (`folderId`),
  KEY `chao_idx_ollnjxtmcejaubqswbusmnouusfgodvumjwl` (`volumeId`),
  KEY `chao_fk_aycnrfjmiaaezhslkgoliwrbaifznjyyupsx` (`uploaderId`),
  CONSTRAINT `chao_fk_aycnrfjmiaaezhslkgoliwrbaifznjyyupsx` FOREIGN KEY (`uploaderId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_etxcrszhnoubpqdiiqwmgbxgztuhagaqctxb` FOREIGN KEY (`volumeId`) REFERENCES `chao_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_sllhpjqifbjirsnrjxjuiltlualxsvgfxgvo` FOREIGN KEY (`folderId`) REFERENCES `chao_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_xahaxxmcrkswnenbrwlyrbnjjjrxaovoqahr` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_caches`
--

DROP TABLE IF EXISTS `chao_blitz_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `paginate` int(11) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_ywtcidkpvdkabjkidzgexhzybovxbezhggud` (`siteId`,`uri`),
  KEY `chao_idx_jhwpakumhztuuktmxdltkvwgeowuvsrslcme` (`expiryDate`),
  CONSTRAINT `chao_fk_klnciiuffcjotdjisexsdgwdzinmoxrqtfng` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_cachetags`
--

DROP TABLE IF EXISTS `chao_blitz_cachetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_cachetags` (
  `cacheId` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`cacheId`,`tag`),
  KEY `chao_idx_mcqdzhjgohpzyrvzkcfyzdwwoiyjakfbphgi` (`tag`),
  CONSTRAINT `chao_fk_aeckqaockvyxfqriwhizjhpvnluvjuxgebme` FOREIGN KEY (`cacheId`) REFERENCES `chao_blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_driverdata`
--

DROP TABLE IF EXISTS `chao_blitz_driverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_driverdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver` varchar(255) NOT NULL,
  `data` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementcaches`
--

DROP TABLE IF EXISTS `chao_blitz_elementcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementcaches` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`cacheId`,`elementId`),
  KEY `chao_fk_igieoeqdrtqlbbtuxzcxsdxmlzjeohhnhqkr` (`elementId`),
  CONSTRAINT `chao_fk_covfkikfrrenuevarwuensxagxltrfrgknrr` FOREIGN KEY (`cacheId`) REFERENCES `chao_blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_igieoeqdrtqlbbtuxzcxsdxmlzjeohhnhqkr` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementexpirydates`
--

DROP TABLE IF EXISTS `chao_blitz_elementexpirydates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementexpirydates` (
  `elementId` int(11) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`),
  UNIQUE KEY `chao_idx_pqaqwlieayqkhzptposafrrrdhgdftsiteme` (`elementId`),
  KEY `chao_idx_tjmixqaqwrgbmyjtgchcjmjamaxfsxcggtlg` (`expiryDate`),
  CONSTRAINT `chao_fk_robokyzuekvvrdxieqxwciraakcyuixgadgf` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementfieldcaches`
--

DROP TABLE IF EXISTS `chao_blitz_elementfieldcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementfieldcaches` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  PRIMARY KEY (`cacheId`,`elementId`,`fieldId`),
  KEY `chao_fk_buaabahiwhivstqamegkzseovvjziyliirgu` (`elementId`),
  KEY `chao_fk_fncyhuoqgmiqbxzrdlmrcsgfdamxbgkikzye` (`fieldId`),
  CONSTRAINT `chao_fk_buaabahiwhivstqamegkzseovvjziyliirgu` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_fncyhuoqgmiqbxzrdlmrcsgfdamxbgkikzye` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_wzbwzxkdrarssexbrrqqztbwmwaxiyxnqyco` FOREIGN KEY (`cacheId`) REFERENCES `chao_blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementqueries`
--

DROP TABLE IF EXISTS `chao_blitz_elementqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementqueries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_hzsympxajszpsfltgidmqtsibpcspruthoon` (`index`),
  KEY `chao_idx_gumhqoevtkrnoobivpfcjgofnxgxjheyqnnd` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementqueryattributes`
--

DROP TABLE IF EXISTS `chao_blitz_elementqueryattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementqueryattributes` (
  `queryId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  PRIMARY KEY (`queryId`,`attribute`),
  CONSTRAINT `chao_fk_fkiinessbmdwyhnvstaayqaxzxbpyzkidvch` FOREIGN KEY (`queryId`) REFERENCES `chao_blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementquerycaches`
--

DROP TABLE IF EXISTS `chao_blitz_elementquerycaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementquerycaches` (
  `cacheId` int(11) NOT NULL,
  `queryId` int(11) NOT NULL,
  PRIMARY KEY (`cacheId`,`queryId`),
  KEY `chao_fk_mrnwetwkdrwsoaubwnfysdjhsbvnxeqeypvw` (`queryId`),
  CONSTRAINT `chao_fk_krhidikfkqvwjnccvfxquhszcydwqpjcxqra` FOREIGN KEY (`cacheId`) REFERENCES `chao_blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_mrnwetwkdrwsoaubwnfysdjhsbvnxeqeypvw` FOREIGN KEY (`queryId`) REFERENCES `chao_blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementqueryfields`
--

DROP TABLE IF EXISTS `chao_blitz_elementqueryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementqueryfields` (
  `queryId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  PRIMARY KEY (`queryId`,`fieldId`),
  KEY `chao_fk_wcsqznczyfcacvdigwljorvqiklvubmxhfor` (`fieldId`),
  CONSTRAINT `chao_fk_hyjpgiefdfgppfonsltdnxseaaxbmfcyatic` FOREIGN KEY (`queryId`) REFERENCES `chao_blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_wcsqznczyfcacvdigwljorvqiklvubmxhfor` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_elementquerysources`
--

DROP TABLE IF EXISTS `chao_blitz_elementquerysources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_elementquerysources` (
  `queryId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  PRIMARY KEY (`queryId`,`sourceId`),
  CONSTRAINT `chao_fk_gpjoewjwdzofcntigauzorsutnwjjmifxxjs` FOREIGN KEY (`queryId`) REFERENCES `chao_blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_hints`
--

DROP TABLE IF EXISTS `chao_blitz_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_hints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `routeVariable` varchar(255) NOT NULL,
  `line` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_nixoqfvozipinxucfkqxplgqeobhyenxsnww` (`fieldId`,`template`,`routeVariable`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_includes`
--

DROP TABLE IF EXISTS `chao_blitz_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_includes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` bigint(20) NOT NULL,
  `siteId` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_biiydmtzyxxgissvcejhamuhxwwqfyodoyyv` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_blitz_ssiincludecaches`
--

DROP TABLE IF EXISTS `chao_blitz_ssiincludecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_blitz_ssiincludecaches` (
  `cacheId` int(11) NOT NULL,
  `includeId` int(11) NOT NULL,
  PRIMARY KEY (`cacheId`,`includeId`),
  KEY `chao_fk_earvxrommyyqtjxkvrlxbxvknghoxyjwxcdr` (`includeId`),
  CONSTRAINT `chao_fk_earvxrommyyqtjxkvrlxbxvknghoxyjwxcdr` FOREIGN KEY (`includeId`) REFERENCES `chao_blitz_includes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_ycefyfemhbtxqestxmhbtbfxnivjbswzaufn` FOREIGN KEY (`cacheId`) REFERENCES `chao_blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_categories`
--

DROP TABLE IF EXISTS `chao_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_rqodeeoofdfkwyahxvfunrvoapoiudmsiauc` (`groupId`),
  KEY `chao_fk_nsygcnubvahcymndltecgttvcademywrcscr` (`parentId`),
  CONSTRAINT `chao_fk_baqwdtzjijaypvcdemqxoujlwtdteohyukaf` FOREIGN KEY (`groupId`) REFERENCES `chao_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_bxjsqvgtownjteadtrucuznhnlwmwmjygnte` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_nsygcnubvahcymndltecgttvcademywrcscr` FOREIGN KEY (`parentId`) REFERENCES `chao_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_categorygroups`
--

DROP TABLE IF EXISTS `chao_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_zaqmtiqacumwhujpyfnreauqooandrslvfyy` (`name`),
  KEY `chao_idx_osetzoayqbwkknfnnnpcftvmhtwxaeuasjul` (`handle`),
  KEY `chao_idx_ozlksydbcjbkngiousphfcpaeisjnybelhph` (`structureId`),
  KEY `chao_idx_nvidernpxmtjdlpwfuiheceosjkyewldxnfy` (`fieldLayoutId`),
  KEY `chao_idx_qamqbmrgnddtlalucmwetlmysebbexmydmqz` (`dateDeleted`),
  CONSTRAINT `chao_fk_ikabdjendpacsbkdcxutwakrzaxfpvqxncwt` FOREIGN KEY (`structureId`) REFERENCES `chao_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_xhgkizufoqwkyteutorhdjysuofqdtvtbvcg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_categorygroups_sites`
--

DROP TABLE IF EXISTS `chao_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_fdktuuebcdsavqwdzordfersfpnehefpqoko` (`groupId`,`siteId`),
  KEY `chao_idx_xemqtiufoajbqiyvrpyrxmslrmgcnioremhr` (`siteId`),
  CONSTRAINT `chao_fk_prinvoxkvaoapjdqhxmcoozfjfdrtlwcwnxo` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_xpiqldahvupwonrlaogbvcryxsicbwroebby` FOREIGN KEY (`groupId`) REFERENCES `chao_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_changedattributes`
--

DROP TABLE IF EXISTS `chao_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `chao_idx_vnlgumbkvqpunshvjqxpyundakjzqnilkuzc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `chao_fk_edhtidsmthmcvrqgpjesammcmmetjpwykjfs` (`siteId`),
  KEY `chao_fk_lpgfddekbavsucgzawxjnwimgwdlexxrbrqd` (`userId`),
  CONSTRAINT `chao_fk_edhtidsmthmcvrqgpjesammcmmetjpwykjfs` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_gowjenyfqlnzwlkpplfuqmzhoomifibtgshb` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_lpgfddekbavsucgzawxjnwimgwdlexxrbrqd` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_changedfields`
--

DROP TABLE IF EXISTS `chao_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `chao_idx_qbphxoqxxogpomcszwdwspxodugqmsiguhem` (`elementId`,`siteId`,`dateUpdated`),
  KEY `chao_fk_eyfikzgafcscyuqbcmfqvxpfbknhveykkrch` (`siteId`),
  KEY `chao_fk_laxingweqcbcxrxyiziyezpqkojzodiavzru` (`fieldId`),
  KEY `chao_fk_qsndxwtjktbliommbwglycijvmzwjwyupafu` (`userId`),
  CONSTRAINT `chao_fk_eyfikzgafcscyuqbcmfqvxpfbknhveykkrch` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_laxingweqcbcxrxyiziyezpqkojzodiavzru` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_qsndxwtjktbliommbwglycijvmzwjwyupafu` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_ryzyvscvbxtmudzguqcopghjapqyhnqqtcnn` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_content`
--

DROP TABLE IF EXISTS `chao_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_sampleField_fuvqzowc` text DEFAULT NULL,
  `field_optimizationExample_zoefnqni` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_goyrbggttloahvpvmczieizbykrbsgygculo` (`elementId`,`siteId`),
  KEY `chao_idx_wonkfhdpudvhergepxsjigoszavmvhenuoef` (`siteId`),
  KEY `chao_idx_xmhyjnkbfbtcgewqybtlvcksaremgrqltaag` (`title`),
  CONSTRAINT `chao_fk_gzmzggcbgmtakaiicbxlzkcyrnnmjcowbjww` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_wzvxpuyduzkynayxhqyztluppwdbmnhkrzsj` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_craftidtokens`
--

DROP TABLE IF EXISTS `chao_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_fk_vjptbwjrmxxeuoinoqbdiikykhyybvgcsgzh` (`userId`),
  CONSTRAINT `chao_fk_vjptbwjrmxxeuoinoqbdiikykhyybvgcsgzh` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_deprecationerrors`
--

DROP TABLE IF EXISTS `chao_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_hkiapafaahxnkwjauigzvfuyrurjplwxfnes` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_drafts`
--

DROP TABLE IF EXISTS `chao_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `chao_idx_izlnmcoablrssccmklbvzmdysxufmoywohoi` (`creatorId`,`provisional`),
  KEY `chao_idx_mrhbcchmrmnqroecpohnkevmdaeyavmgokxy` (`saved`),
  KEY `chao_fk_swvphdmicypfeqdebzibmibhuuerpdukirzx` (`canonicalId`),
  CONSTRAINT `chao_fk_evapyuearewjexqqabccctzyebxfhbsmvauh` FOREIGN KEY (`creatorId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_swvphdmicypfeqdebzibmibhuuerpdukirzx` FOREIGN KEY (`canonicalId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_elements`
--

DROP TABLE IF EXISTS `chao_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_caozossfrvjgnxwtlxcbhfdizcleeztrvcfq` (`dateDeleted`),
  KEY `chao_idx_fajmzztlwqxajdvqjyitadtwuttcffkwiyts` (`fieldLayoutId`),
  KEY `chao_idx_ziulqcyvmntkafwztwkgeuoaidkahaophwsb` (`type`),
  KEY `chao_idx_uebcqfwibwgpeynhwohbhnpilzqtaiwzypiq` (`enabled`),
  KEY `chao_idx_iraojjbsfqqpkjeetzpdkdoxsqjodyplcsnp` (`canonicalId`),
  KEY `chao_idx_vwbmjgtvkzwbgswxcymemnwnguymqqjkdrco` (`archived`,`dateCreated`),
  KEY `chao_idx_gcsbdggyljjfvkeibagmlaiyycnjoybczhzr` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `chao_idx_pdydhlkjicfmdvsnuiasweimvtarzgbbwnyl` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `chao_fk_rlhiesuvoextnvvbwjtbxncqxrkzscebscgw` (`draftId`),
  KEY `chao_fk_ujhuouqfkytsjnbchcbsocwbqfdlnnoyebdj` (`revisionId`),
  CONSTRAINT `chao_fk_aozidhhsfyhttkbfjzsiarkkscmwesnksjan` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_ptpqlsxrwrtybrlcacjnbcylnudwpchyfunr` FOREIGN KEY (`canonicalId`) REFERENCES `chao_elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_rlhiesuvoextnvvbwjtbxncqxrkzscebscgw` FOREIGN KEY (`draftId`) REFERENCES `chao_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_ujhuouqfkytsjnbchcbsocwbqfdlnnoyebdj` FOREIGN KEY (`revisionId`) REFERENCES `chao_revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_elements_sites`
--

DROP TABLE IF EXISTS `chao_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_vsiobfuvsqptqgdxaevxhptxqofyfpxtmkjp` (`elementId`,`siteId`),
  KEY `chao_idx_hpmhknsbfgtumwmkiubuayztahsypkkoetin` (`siteId`),
  KEY `chao_idx_eipmipvtfbbhysxlvkmtshelsyjbqkgqtzpn` (`slug`,`siteId`),
  KEY `chao_idx_jpppwkehtmkihfjmgybeqvowpqmssmnyjbvm` (`enabled`),
  KEY `chao_idx_ywwxivngsbfomoncfhytxjbgbmzzejgebjgo` (`uri`,`siteId`),
  CONSTRAINT `chao_fk_dvmkqvzgctymqolmkafxlhtchtgvbjlqnukv` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_ybfdgqhuzpcklktbrnefewhfynybntutpdrq` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_entries`
--

DROP TABLE IF EXISTS `chao_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_yjyrwzqiwywxzyydbtgblxksipthkxfloopb` (`postDate`),
  KEY `chao_idx_odeybvbakjipygvfhngpokwbofyjvfcrhvcu` (`expiryDate`),
  KEY `chao_idx_ikzwanokjptfoxmptqlitrdlvsnxpiavfwjd` (`authorId`),
  KEY `chao_idx_tzkpvxvjsszyvwawiaaikygngvucowrxwvnx` (`sectionId`),
  KEY `chao_idx_vzmrevvjysgpvaqdmoukxiamcomracdhbdzv` (`typeId`),
  KEY `chao_fk_hnujlaztptuittfcfigvfmxuzrocovyhraby` (`parentId`),
  CONSTRAINT `chao_fk_hbnktcqjmiwjouvftxzjduffoolylojddtxq` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_hnujlaztptuittfcfigvfmxuzrocovyhraby` FOREIGN KEY (`parentId`) REFERENCES `chao_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_kvspntpkrwdivjqbuuemqmnmltrudvnsmrey` FOREIGN KEY (`sectionId`) REFERENCES `chao_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_otsoimwrharzbfvuekcttshbyntrsxhqhwqh` FOREIGN KEY (`authorId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_qkkdmykakvgdpmxuhsvmawuvddvtdmpbfase` FOREIGN KEY (`typeId`) REFERENCES `chao_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_entrytypes`
--

DROP TABLE IF EXISTS `chao_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_trvvoqujyrlwshvmgwxflzifffqczjkzxbjg` (`name`,`sectionId`),
  KEY `chao_idx_qjqdjffcqngrtvxxgivyxexlvdkhxotzzlqt` (`handle`,`sectionId`),
  KEY `chao_idx_vnjfavgsbcnxsisitzenagjxhnvrxdppmmrs` (`sectionId`),
  KEY `chao_idx_szakwpttgzbwgpqwsziwpbokxqcbbvcvrtnx` (`fieldLayoutId`),
  KEY `chao_idx_eaqrdohajtkznzhtgdgpkyogduqfujroijwa` (`dateDeleted`),
  CONSTRAINT `chao_fk_jikbzoqdptpmpwtzpodctotziavrdimdnbsh` FOREIGN KEY (`sectionId`) REFERENCES `chao_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_ucnlvcdudvycdhsggyjpmwovljpmiaubrzpv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_feedme_feeds`
--

DROP TABLE IF EXISTS `chao_feedme_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_feedme_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `feedUrl` text NOT NULL,
  `feedType` varchar(255) DEFAULT NULL,
  `primaryElement` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) NOT NULL,
  `elementGroup` text DEFAULT NULL,
  `siteId` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `duplicateHandle` text DEFAULT NULL,
  `updateSearchIndexes` tinyint(1) NOT NULL DEFAULT 1,
  `paginationNode` text DEFAULT NULL,
  `fieldMapping` text DEFAULT NULL,
  `fieldUnique` text DEFAULT NULL,
  `passkey` varchar(255) NOT NULL,
  `backup` tinyint(1) NOT NULL DEFAULT 0,
  `setEmptyValues` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_fieldgroups`
--

DROP TABLE IF EXISTS `chao_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_egzygktqmtnblqokmxgqrjztireofwtdoaxx` (`name`),
  KEY `chao_idx_vqcvwvsyrnitsoalvdbibdqkmxertffouwgb` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_fieldlayoutfields`
--

DROP TABLE IF EXISTS `chao_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_quooqtlfavlpjxzysrsyqbiuzhpgjdgyimjw` (`layoutId`,`fieldId`),
  KEY `chao_idx_ljodlswufgpsokwezsnvnjpaddkheghqfvpn` (`sortOrder`),
  KEY `chao_idx_zoqeietbwvnnxwdnuruzdgaqzoplkmgockye` (`tabId`),
  KEY `chao_idx_xqemsxdauctzgtckimrghslkvuthvxcvqyep` (`fieldId`),
  CONSTRAINT `chao_fk_gkduzmycnfnqozigfumpncsclunpqwiufcqe` FOREIGN KEY (`layoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_luzwxztyvpqvqemhztvvleyurdwqtirpqody` FOREIGN KEY (`tabId`) REFERENCES `chao_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_tqhqylyetychvmxccddrxstlzzpvzsxvjwqh` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_fieldlayouts`
--

DROP TABLE IF EXISTS `chao_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_tclqtavvgkduetmuehkvunblqhjypitctbbr` (`dateDeleted`),
  KEY `chao_idx_intjokwvliopsmieqmifhhuizotfuqjnpupa` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_fieldlayouttabs`
--

DROP TABLE IF EXISTS `chao_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_aptqfbfjvxdljyqiwhthjzduiohuzmtuxzlq` (`sortOrder`),
  KEY `chao_idx_hrmtjlbtjlukauxqcliyaucpbmcxxzxfpaeg` (`layoutId`),
  CONSTRAINT `chao_fk_tbsemumhzpggshnrwhqdpztszaemmwwghqmw` FOREIGN KEY (`layoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_fields`
--

DROP TABLE IF EXISTS `chao_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_wgjpyzdmsgcsvpadhveyggphutplmunehavx` (`handle`,`context`),
  KEY `chao_idx_mskgkgqtjdxnihfxmmxbrsykvacidjuftqjm` (`groupId`),
  KEY `chao_idx_rqxmppdfrmxacrxdtwofwmobajxftxunaiyx` (`context`),
  CONSTRAINT `chao_fk_mzvdnundrsxwoygdbjlqpbyongnpvapcrxhw` FOREIGN KEY (`groupId`) REFERENCES `chao_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_fmc_formieform`
--

DROP TABLE IF EXISTS `chao_fmc_formieform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_fmc_formieform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_yourName_kfcujouv` text DEFAULT NULL,
  `field_emailAddress_gyysmbvo` varchar(255) DEFAULT NULL,
  `field_message_xxzgcmbi` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_phodkskrsumdmnsfwmvbtszhuggtfxessaqd` (`elementId`,`siteId`),
  KEY `chao_fk_pqdjrjohgvaombogaugczumveuyoajuxbfip` (`siteId`),
  CONSTRAINT `chao_fk_pqdjrjohgvaombogaugczumveuyoajuxbfip` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_rqpgdxncxcxcvynhekcxqieawgolnyijjtmd` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_emailtemplates`
--

DROP TABLE IF EXISTS `chao_formie_emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_forms`
--

DROP TABLE IF EXISTS `chao_formie_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) NOT NULL,
  `fieldContentTable` varchar(74) NOT NULL,
  `settings` mediumtext DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `submitActionEntrySiteId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int(11) DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fieldLayoutId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_ntrnfuymcoombphtpvsxwbfhhigpsmrkvmub` (`templateId`),
  KEY `chao_idx_slmpyzvgaihtbuaxbpgnsrzyovkywvwlajzm` (`defaultStatusId`),
  KEY `chao_idx_omcpxmgghzngetmkbokkjatagcbfbzzxbfpo` (`submitActionEntryId`),
  KEY `chao_idx_zkqentkltbgwsdtnztnfcfzirzblidrotelr` (`submitActionEntrySiteId`),
  KEY `chao_idx_htbfxwrhkvtoqdmpjdimrxekongkhnjysddz` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_ctgfbdsvhalnthhoztpmtyngywhnhrnsvuxr` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_hznxuybccmpayhclgvutfksoicaqndyctobe` FOREIGN KEY (`defaultStatusId`) REFERENCES `chao_formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_ijxhhbacvlxtjynwuhhgbrabpcmlsnhfjolx` FOREIGN KEY (`templateId`) REFERENCES `chao_formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_nkisxogruayxbimcducrzofoafsgzyukgdga` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_wfmfznpiqygjgmpgtysgmsnzqeyqtbfzzzra` FOREIGN KEY (`submitActionEntryId`) REFERENCES `chao_entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_formtemplates`
--

DROP TABLE IF EXISTS `chao_formie_formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_formtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT 1,
  `outputCssLayout` tinyint(1) DEFAULT 1,
  `outputCssTheme` tinyint(1) DEFAULT 1,
  `outputJsBase` tinyint(1) DEFAULT 1,
  `outputJsTheme` tinyint(1) DEFAULT 1,
  `outputCssLocation` varchar(255) DEFAULT NULL,
  `outputJsLocation` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_mamygyljxchgzusyyilkpiznkisxzpqullmz` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_iptelhvbxfvqrtrtnhwtedriuspniyohpnlu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_integrations`
--

DROP TABLE IF EXISTS `chao_formie_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `settings` text DEFAULT NULL,
  `cache` longtext DEFAULT NULL,
  `tokenId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_nested`
--

DROP TABLE IF EXISTS `chao_formie_nested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_nested` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_zisjnsshuvpxmwcdecuyzjlwirqdhydsxtly` (`fieldId`),
  KEY `chao_idx_koxntrlbazugtrbkppgbkgjzelfreykkqebd` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_jfelebmfzzbrhhfqfxvoulxwnzezirsfkvdt` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_wbexxyolyqmynfqqmloafqwfznyppdgjqbdp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_nestedfieldrows`
--

DROP TABLE IF EXISTS `chao_formie_nestedfieldrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_nestedfieldrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_zimisqolysjmwpzkuurgehqpuktrhxgfjstn` (`ownerId`),
  KEY `chao_idx_wfineuuoytyducqkbtsxaymphnzecfidebpv` (`fieldId`),
  KEY `chao_idx_gcxptqhlirpjfwloepoaqhsihoqsbthliiba` (`sortOrder`),
  CONSTRAINT `chao_fk_gqbpdodthfexqqpurezntnawkcipqcppbsoc` FOREIGN KEY (`ownerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_qmwilmuyyuethrjnsmuincpiaqfddovdgsuz` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_xhmphtbkzngjrmjdyziklyfhtohutmilvitw` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_notifications`
--

DROP TABLE IF EXISTS `chao_formie_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `templateId` int(11) DEFAULT NULL,
  `pdfTemplateId` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `subject` text DEFAULT NULL,
  `recipients` enum('email','conditions') NOT NULL DEFAULT 'email',
  `to` text DEFAULT NULL,
  `toConditions` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `replyTo` text DEFAULT NULL,
  `replyToName` text DEFAULT NULL,
  `from` text DEFAULT NULL,
  `fromName` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `attachFiles` tinyint(1) DEFAULT 1,
  `attachPdf` tinyint(1) DEFAULT 0,
  `attachAssets` text DEFAULT NULL,
  `enableConditions` tinyint(1) DEFAULT 0,
  `conditions` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_wcsabnuvdommwbsdvebwqgnmxlrpperyqihd` (`formId`),
  KEY `chao_idx_sddrdgllnvawahfwwbajfrqtqjngyboltvvs` (`templateId`),
  KEY `chao_fk_vhzjipajjrabubkuayolkvxqhxodtzmxsrhw` (`pdfTemplateId`),
  CONSTRAINT `chao_fk_hhuamxsduphvvfdweqobyumnzwzjposujnii` FOREIGN KEY (`formId`) REFERENCES `chao_formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_mmmfvbkvbxgcycphbfmeirvvbasjqccstyhh` FOREIGN KEY (`templateId`) REFERENCES `chao_formie_emailtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_vhzjipajjrabubkuayolkvxqhxodtzmxsrhw` FOREIGN KEY (`pdfTemplateId`) REFERENCES `chao_formie_pdftemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_pagesettings`
--

DROP TABLE IF EXISTS `chao_formie_pagesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_pagesettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) NOT NULL,
  `fieldLayoutTabId` int(11) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_dxbktzkrmsgfrfxnyowpjxuxkhkizlyjzhxh` (`fieldLayoutTabId`),
  KEY `chao_idx_vfzuaagmmelxfvhezladkcqjzwfvrfypqtuq` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_esirmsjljkmflekkctggdegpxfiityfqwfqd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_gvpwmpltzexyxfcmhsstgvsjnsrlsqwihmqr` FOREIGN KEY (`fieldLayoutTabId`) REFERENCES `chao_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_payments`
--

DROP TABLE IF EXISTS `chao_formie_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_khkutqkxheskhwizizvamawdrkuymbfohlft` (`integrationId`),
  KEY `chao_idx_ernwtunsuiufslgdihpiaqfnqkwftusztogp` (`fieldId`),
  KEY `chao_idx_dxlqxcvepayndoouggjwegpivnhybwikumrl` (`reference`),
  KEY `chao_fk_mrizhcsfhobwajmgplimghqydqexlzoruyro` (`submissionId`),
  KEY `chao_fk_jdgoinpfsoruouepdynbktikeptnkxcnrpbg` (`subscriptionId`),
  CONSTRAINT `chao_fk_dgcughoajnlclkcewtxnnchjnxkepjnthizp` FOREIGN KEY (`integrationId`) REFERENCES `chao_formie_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_jdgoinpfsoruouepdynbktikeptnkxcnrpbg` FOREIGN KEY (`subscriptionId`) REFERENCES `chao_formie_payments_subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_mrizhcsfhobwajmgplimghqydqexlzoruyro` FOREIGN KEY (`submissionId`) REFERENCES `chao_formie_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_xtgqynmfmeggojwfngvwtcypyxwmnplxyzzh` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_payments_plans`
--

DROP TABLE IF EXISTS `chao_formie_payments_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_payments_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text DEFAULT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_jhtvphstyqlxhnxhmyfloyevvprutvwxivee` (`handle`),
  KEY `chao_idx_syhvxsajsxqkfetmljwkinxdvbihpbgzecfl` (`integrationId`),
  KEY `chao_idx_qlzkcqwrvkmxbarpxjhwtpjhiogfdbnyvpks` (`reference`),
  CONSTRAINT `chao_fk_nlbzfjttakmmfovzkqughrhwnfdpuryzmhtb` FOREIGN KEY (`integrationId`) REFERENCES `chao_formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `chao_formie_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_payments_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text DEFAULT NULL,
  `trialDays` int(11) NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT 1,
  `isSuspended` tinyint(1) NOT NULL DEFAULT 0,
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_zbbdupovjocclmwidbpsynkdcndmotflohmw` (`integrationId`),
  KEY `chao_idx_lcwhhdbgvcevxymvtubbdvkggkcuqbpgrqfd` (`submissionId`),
  KEY `chao_idx_grgldtzzzgzuylqghutpjplfctabghyzhsrr` (`fieldId`),
  KEY `chao_idx_uvazuzpvhnivwxdpcudiaumnmuavojrvpvgn` (`planId`),
  KEY `chao_idx_yyvhwmjlyhoxgpnaxniulhowanqvsnxtlehk` (`reference`),
  KEY `chao_idx_mqvagsxionuwunfzulxykqjidhbabsfjwaaj` (`nextPaymentDate`),
  KEY `chao_idx_uqmilkdsqkuctmlcxakyptljwhqfdxfucrik` (`dateExpired`),
  KEY `chao_idx_ieecnmxvfgjfxmizzisedpoatnufbbensxqx` (`dateExpired`),
  CONSTRAINT `chao_fk_cvesrszpuiqguzxhlpfnsdywpnkuhqhrwkmm` FOREIGN KEY (`planId`) REFERENCES `chao_formie_payments_plans` (`id`),
  CONSTRAINT `chao_fk_nvmigzdahemycpfzbuwigoihfwsidqmrtlfx` FOREIGN KEY (`submissionId`) REFERENCES `chao_formie_submissions` (`id`),
  CONSTRAINT `chao_fk_sryfmuuqzqtucqpnldkapixrmcshiiptefgj` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`),
  CONSTRAINT `chao_fk_yuauuuyhhmqahqmsdwyliryitpgqfqnauitb` FOREIGN KEY (`integrationId`) REFERENCES `chao_formie_integrations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_pdftemplates`
--

DROP TABLE IF EXISTS `chao_formie_pdftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_pdftemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `filenameFormat` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_relations`
--

DROP TABLE IF EXISTS `chao_formie_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_ixcjrcinzofjzupshocznzbezmddzdjfhryd` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `chao_idx_fbwjmnmbvfbykwovwtrnynjdsnugfyjnaoko` (`sourceId`),
  KEY `chao_idx_qfxcdfqmhnxolepjngftaffplmopncdpcheq` (`targetId`),
  KEY `chao_idx_suqisxcmpjdvfffcrvrylburiwvjdcdghdtk` (`sourceSiteId`),
  CONSTRAINT `chao_fk_gauiehzsortymnsefzbkxmqpfqafqmxuqyzr` FOREIGN KEY (`targetId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_rileiasceeyneiifmggniiuohhmoogbdnvee` FOREIGN KEY (`sourceSiteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_vubzqytfpgzyyvqaddavxmouahmhkqpfpilq` FOREIGN KEY (`sourceId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_rows`
--

DROP TABLE IF EXISTS `chao_formie_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) NOT NULL,
  `fieldLayoutFieldId` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_qjznwpdlphfidvtgmntyjgubipflyhfayykx` (`fieldLayoutFieldId`),
  KEY `chao_idx_rcycvowkkijtxtxcuvgromsmakewdrceqflm` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_dfinjfywusrraiolqmrmlubamuewejskflan` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_utwfhnqhswwgrhmpvwfktrwmnspgfiwivxme` FOREIGN KEY (`fieldLayoutFieldId`) REFERENCES `chao_fieldlayoutfields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_sentnotifications`
--

DROP TABLE IF EXISTS `chao_formie_sentnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_sentnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `formId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `notificationId` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `replyToName` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `htmlBody` mediumtext DEFAULT NULL,
  `info` text DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_fk_lcuiwndrdnxitqyjromxmnwyveishavidvoj` (`formId`),
  KEY `chao_fk_xgjwrqtyenseqjozzydktdiurdvfygemwbmm` (`submissionId`),
  KEY `chao_fk_qgohppqunrxknhbkpzzfebmxmxpvawtzzhdj` (`notificationId`),
  CONSTRAINT `chao_fk_jnjfakmxtrttjcdukohlzfbgoggzotaefwul` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_lcuiwndrdnxitqyjromxmnwyveishavidvoj` FOREIGN KEY (`formId`) REFERENCES `chao_formie_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_qgohppqunrxknhbkpzzfebmxmxpvawtzzhdj` FOREIGN KEY (`notificationId`) REFERENCES `chao_formie_notifications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_xgjwrqtyenseqjozzydktdiurdvfygemwbmm` FOREIGN KEY (`submissionId`) REFERENCES `chao_formie_submissions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_statuses`
--

DROP TABLE IF EXISTS `chao_formie_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_stencils`
--

DROP TABLE IF EXISTS `chao_formie_stencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_stencils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `data` mediumtext DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `submitActionEntrySiteId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_tkrvzonznrqbhadlwrnfovmwxmnjchdmbqjy` (`templateId`),
  KEY `chao_idx_fcrpbdbmmeghqribusmnzvykrlsugxcvxenx` (`defaultStatusId`),
  CONSTRAINT `chao_fk_oiovksazebdukmdwjtfbxspsykcmvwlfnndw` FOREIGN KEY (`templateId`) REFERENCES `chao_formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_xjnjyrpsumagungrkouulpzxzyfrmarjqymz` FOREIGN KEY (`defaultStatusId`) REFERENCES `chao_formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_submissions`
--

DROP TABLE IF EXISTS `chao_formie_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `formId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT 0,
  `isSpam` tinyint(1) DEFAULT 0,
  `spamReason` text DEFAULT NULL,
  `spamClass` varchar(255) DEFAULT NULL,
  `snapshot` text DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_vnmzhcqbeikciulyslpscsexmzstqbzpjfhg` (`formId`),
  KEY `chao_idx_jsswkhfsqwxzefkosjaqxymdeydktqbifddm` (`statusId`),
  KEY `chao_idx_fsmpaxyffitbzuxjvxjdrztklsncdscyjolq` (`userId`),
  CONSTRAINT `chao_fk_bttptkxwhrxwkgfffqvozrijbjuhpkosekqp` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_kgiptfnbxwijaxuqqculqmytaeqkofnznlkm` FOREIGN KEY (`statusId`) REFERENCES `chao_formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_rbxoezedaoegqujznaiwgxvqqkkdqcqayltx` FOREIGN KEY (`formId`) REFERENCES `chao_formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_zxliswyxuutrptcrsdrcwrqinlvogzjxrkbx` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_syncfields`
--

DROP TABLE IF EXISTS `chao_formie_syncfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_syncfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syncId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_quclslckmoghpjdulcvrvgbirnxapvvtnbxk` (`syncId`,`fieldId`),
  KEY `chao_fk_pnvezphcqmxjxyxkadorgzsmkzievtuorast` (`fieldId`),
  CONSTRAINT `chao_fk_lmhcppxrqxjjqnwgirnhjonbakraiuuqxyfn` FOREIGN KEY (`syncId`) REFERENCES `chao_formie_syncs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_pnvezphcqmxjxyxkadorgzsmkzievtuorast` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_syncs`
--

DROP TABLE IF EXISTS `chao_formie_syncs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_syncs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_formie_tokens`
--

DROP TABLE IF EXISTS `chao_formie_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_formie_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `accessToken` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `endOfLife` varchar(255) DEFAULT NULL,
  `refreshToken` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_globalsets`
--

DROP TABLE IF EXISTS `chao_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_ntuirszkerjmzkxdebkqcescjzodmjjcjhku` (`name`),
  KEY `chao_idx_djyyxolxgxzexaqevmkpzpttpyuyornctwvu` (`handle`),
  KEY `chao_idx_tudmpostqcazbyvsbwaksajkiuchqvewaetd` (`fieldLayoutId`),
  KEY `chao_idx_vqvoctkogzriobsjovfbapwroxucikbxjajp` (`sortOrder`),
  CONSTRAINT `chao_fk_iskrfslthoghanqjlzczmgjyzvmfuqhqxdsf` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_yecrlwhfrcrpaycohomxclmhtterpzobisvg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_gqlschemas`
--

DROP TABLE IF EXISTS `chao_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_gqltokens`
--

DROP TABLE IF EXISTS `chao_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_eunsqqsyltwqyhlzzgivteptgypuozaehqqz` (`accessToken`),
  UNIQUE KEY `chao_idx_xgnkquvmruwilrgbzldgbwyzcohorcufbsdm` (`name`),
  KEY `chao_fk_iutpvksxgtutkazoqugoxfatugnrdgjavhxi` (`schemaId`),
  CONSTRAINT `chao_fk_iutpvksxgtutkazoqugoxfatugnrdgjavhxi` FOREIGN KEY (`schemaId`) REFERENCES `chao_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_imagetransformindex`
--

DROP TABLE IF EXISTS `chao_imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_wdskgbykktjagaxrorryqlfsgolnxqmmuvsr` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_imagetransforms`
--

DROP TABLE IF EXISTS `chao_imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_cattgjlexwepmadkbvbsphopxvvdgcphtdpu` (`name`),
  KEY `chao_idx_haqhwvuowfhmbtqrjvycwzseyqifjxiggcvk` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_info`
--

DROP TABLE IF EXISTS `chao_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_knockknock_logins`
--

DROP TABLE IF EXISTS `chao_knockknock_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_knockknock_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipAddress` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `loginPath` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_lenz_linkfield`
--

DROP TABLE IF EXISTS `chao_lenz_linkfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_lenz_linkfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `type` varchar(63) DEFAULT NULL,
  `linkedUrl` text DEFAULT NULL,
  `linkedId` int(11) DEFAULT NULL,
  `linkedSiteId` int(11) DEFAULT NULL,
  `linkedTitle` varchar(255) DEFAULT NULL,
  `payload` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_fgkljvmatiqqxgowctfkpdjxehobomqmckzp` (`elementId`,`siteId`,`fieldId`),
  KEY `chao_idx_nwbabvcwgieanaoqblfnxckoqkgedlqdmzqw` (`fieldId`),
  KEY `chao_idx_qswaxlxfbbsghdduhsdnwppizxkmomzswmee` (`siteId`),
  KEY `chao_fk_wzscqqyuuztmzwbbiwyldwyssjvuogjphulm` (`linkedId`),
  KEY `chao_fk_mgbauohovbftsvolauyaepgezwczqzgqanur` (`linkedSiteId`),
  CONSTRAINT `chao_fk_mgbauohovbftsvolauyaepgezwczqzgqanur` FOREIGN KEY (`linkedSiteId`) REFERENCES `chao_sites` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `chao_fk_nthfxwuaiykpqogeucermdqbdlfduyqcjluo` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_szjnjzzyqcfwesjsajvqlikhouqjjccvodcv` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_wzscqqyuuztmzwbbiwyldwyssjvuogjphulm` FOREIGN KEY (`linkedId`) REFERENCES `chao_elements` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_matrixblocks`
--

DROP TABLE IF EXISTS `chao_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_ngcuapesfedgpgkajsrvthijblnfkcqrinko` (`primaryOwnerId`),
  KEY `chao_idx_khfcsejvwlubpzoxwibnyqhtjdtvyqgwibhb` (`fieldId`),
  KEY `chao_idx_uekqqnckfrumnenvnbxabpyeydoikcpfeibv` (`typeId`),
  CONSTRAINT `chao_fk_dihcyegfikpsibfbwyhkwzwgzdpudxwmkbna` FOREIGN KEY (`typeId`) REFERENCES `chao_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_hjnrfhvhyhocsklurbynqdcmxkxtihiarkth` FOREIGN KEY (`primaryOwnerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_tcitucyovzefevmwbmblpsvryhnnpbwifxpo` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_wzbumfrzsevukfztplplhsappkariwqqblmd` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_matrixblocks_owners`
--

DROP TABLE IF EXISTS `chao_matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `chao_fk_diqwzxuvgrwipkevvsapxtqmmxlnwgoyjgej` (`ownerId`),
  CONSTRAINT `chao_fk_diqwzxuvgrwipkevvsapxtqmmxlnwgoyjgej` FOREIGN KEY (`ownerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_yfygjkwgpgyyxrtjqwrweairkevvdtgoyxjr` FOREIGN KEY (`blockId`) REFERENCES `chao_matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_matrixblocktypes`
--

DROP TABLE IF EXISTS `chao_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_menkbtsgrtfmhquwgxcxrlovafqizwmdurex` (`name`,`fieldId`),
  KEY `chao_idx_kqlffijvnnolpdeqqhkvzvqurwqtlbqykmve` (`handle`,`fieldId`),
  KEY `chao_idx_nbdsjxihzwsgflwawbcdubtktupfjexaixce` (`fieldId`),
  KEY `chao_idx_wjpibtbzhhpuhopdnydraxsgowtcgfjzsmma` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_maohplovosxetrabpnlajiawlpshkwebpgiq` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_vqqorlndoyvgveimhhvrhlqlosumnaeinzwn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_matrixcontent_popupdialogbox`
--

DROP TABLE IF EXISTS `chao_matrixcontent_popupdialogbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_matrixcontent_popupdialogbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_regular_buttonText_awchfgot` text DEFAULT NULL,
  `field_regular_overlayText_xvurjjyv` text DEFAULT NULL,
  `field_regular_overlayClose_tcmzsmno` text DEFAULT NULL,
  `field_regular_overlayTitle_oduxeyyi` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_fuxwlyhdxdsmnxynzjhxkbyaqdwlftnfimyi` (`elementId`,`siteId`),
  KEY `chao_fk_zfcuxuvzirfyrdwioywbmlntqfktscflinaw` (`siteId`),
  CONSTRAINT `chao_fk_mdksjbrxldnepkmtzljeevpgujubsucmxoyl` FOREIGN KEY (`elementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_zfcuxuvzirfyrdwioywbmlntqfktscflinaw` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_migrations`
--

DROP TABLE IF EXISTS `chao_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_qdjjxpoetkivwvxbzxmhpngalkqjfvyejhll` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_neoblocks`
--

DROP TABLE IF EXISTS `chao_neoblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_neoblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_jiiywajxxrbpymussujyrwmuvnrxkybmrewo` (`primaryOwnerId`),
  KEY `chao_idx_alczeedsbxouvacnneksnebcysrhxrvfsgcq` (`fieldId`),
  KEY `chao_idx_dnryggmrkwgyjzjrocadogrtjguwpyxioyoi` (`typeId`),
  CONSTRAINT `chao_fk_ixrtcstzonfvbmtavyhbtbwimoqlobrlkxmu` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_klimmjeomfwsidenrvxahqbmhtugwdofnqch` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_oaxxbksrffkskmlhqmjxqndtqqthlepmnike` FOREIGN KEY (`primaryOwnerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_qruyuvdymzponrvcixquvfklnwomdxecjrrr` FOREIGN KEY (`typeId`) REFERENCES `chao_neoblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_neoblocks_owners`
--

DROP TABLE IF EXISTS `chao_neoblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_neoblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `chao_fk_qesbodzwjwrbjdimkcboarjfiuegazohzedn` (`ownerId`),
  CONSTRAINT `chao_fk_nvlhccpnphbegzwcvfjfkrbdnzgiysbzmumd` FOREIGN KEY (`blockId`) REFERENCES `chao_neoblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_qesbodzwjwrbjdimkcboarjfiuegazohzedn` FOREIGN KEY (`ownerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_neoblockstructures`
--

DROP TABLE IF EXISTS `chao_neoblockstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_neoblockstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_engboknridoabccdrsajtaejdpjbkvfdnwbu` (`structureId`),
  KEY `chao_idx_hkqwynwhfqqamlixswnujtuuxiwcxncpuhet` (`ownerId`),
  KEY `chao_idx_aixzhbiaerqbkzxxnnkdgljwoolonisrwuhl` (`siteId`),
  KEY `chao_idx_mhbnnqxwopjoqtvpgxequoixpdejsuyejccw` (`fieldId`),
  CONSTRAINT `chao_fk_fbfvknbhbwzupyuocuniktpqpuiwhsjstssd` FOREIGN KEY (`structureId`) REFERENCES `chao_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_gaxsgcntcjbftwfmruhrdrgpkexzpdzxknnk` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_kxtkpmfxljfyylhuvvswrodgssuqkttglvfr` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_tscsfuttcgjlcybaxlqmwkbsnibaaxhjtmdo` FOREIGN KEY (`ownerId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_neoblocktypegroups`
--

DROP TABLE IF EXISTS `chao_neoblocktypegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_neoblocktypegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `alwaysShowDropdown` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_flvaojadxabtvrbhklaimytegcdjrlseunee` (`name`,`fieldId`),
  KEY `chao_idx_mzfoyxlciwqlpriumlrkhbwmhakburtqxffw` (`fieldId`),
  CONSTRAINT `chao_fk_zorizlfxqpxbdqzgwjrisanifvesiwuymlke` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_neoblocktypes`
--

DROP TABLE IF EXISTS `chao_neoblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_neoblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `iconId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `minBlocks` smallint(6) unsigned DEFAULT 0,
  `maxBlocks` smallint(6) unsigned DEFAULT NULL,
  `minSiblingBlocks` smallint(6) unsigned DEFAULT 0,
  `maxSiblingBlocks` smallint(6) unsigned DEFAULT 0,
  `minChildBlocks` smallint(6) unsigned DEFAULT 0,
  `maxChildBlocks` smallint(6) unsigned DEFAULT NULL,
  `groupChildBlockTypes` tinyint(1) NOT NULL DEFAULT 1,
  `childBlocks` text DEFAULT NULL,
  `topLevel` tinyint(1) NOT NULL DEFAULT 1,
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT 1,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_fojzwxlwqighgaxnyoqxmrtfflyruvmtwtkc` (`handle`,`fieldId`),
  KEY `chao_idx_cvhaflhhzfcgkjleyxugdyejpycadzikhsdn` (`name`,`fieldId`),
  KEY `chao_idx_cksobrxjoueoakyheyotgyhsqovgfitarexw` (`fieldId`),
  KEY `chao_idx_bmkitdfkulsidlzqbqrzsushxgiacapgudck` (`fieldLayoutId`),
  KEY `chao_idx_hijlmgjlwugtqpbrvigswlodlnkdwqqqbevl` (`groupId`),
  KEY `chao_fk_fwwefnphbpfgmypxevvqmectgbrfbkcisdug` (`iconId`),
  CONSTRAINT `chao_fk_errnxtyjbewpbstpceppnxclriefhsnkavku` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_fwwefnphbpfgmypxevvqmectgbrfbkcisdug` FOREIGN KEY (`iconId`) REFERENCES `chao_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_icrwwzhloxejysqzlgkypqgeqdwcsrpyihfp` FOREIGN KEY (`groupId`) REFERENCES `chao_neoblocktypegroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_ouizquyfqjljobblmlyszdkldtktwlrbmeum` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_plugins`
--

DROP TABLE IF EXISTS `chao_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_stbhnpboozkpjgqgcpfxgtnywfvqtplmdylq` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_projectconfig`
--

DROP TABLE IF EXISTS `chao_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_queue`
--

DROP TABLE IF EXISTS `chao_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_dsvbcovflyvypwzylfqbuwfvomhftkdpgblf` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `chao_idx_fyjxmdqoqwsfaziryvczjqbiqbhshiuelxjz` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_relations`
--

DROP TABLE IF EXISTS `chao_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_nrthaxrinjvfedjocerkfxfodetcivajskhd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `chao_idx_fzworthpduvpuiuzdlipdsohbbaopbxsarwa` (`sourceId`),
  KEY `chao_idx_gngwrhvzmwkmufoucmnfujjcreiuxkouiymc` (`targetId`),
  KEY `chao_idx_zejrcdumachyyjynmzotyaqcaovrljjmoelm` (`sourceSiteId`),
  CONSTRAINT `chao_fk_gneeugrunffxunxshjvgnfwxjclxhbaccyfr` FOREIGN KEY (`fieldId`) REFERENCES `chao_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_idekufpfcspxzbeyhughdxykctvippcglyxh` FOREIGN KEY (`sourceSiteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chao_fk_owfzvtsjfcpmwcpcmvyioadwacuovqwdbpxs` FOREIGN KEY (`sourceId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_resourcepaths`
--

DROP TABLE IF EXISTS `chao_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_retour_redirects`
--

DROP TABLE IF EXISTS `chao_retour_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_retour_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  `associatedElementId` int(11) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `redirectSrcUrl` varchar(255) DEFAULT '',
  `redirectSrcUrlParsed` varchar(255) DEFAULT '',
  `redirectSrcMatch` varchar(32) DEFAULT 'pathonly',
  `redirectMatchType` varchar(32) DEFAULT 'exactmatch',
  `redirectDestUrl` varchar(255) DEFAULT '',
  `redirectHttpCode` int(11) DEFAULT 301,
  `priority` int(11) DEFAULT 5,
  `hitCount` int(11) DEFAULT 1,
  `hitLastTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_bmjzedighmwsaoicwdnotrnibblapgwdkotr` (`redirectSrcUrlParsed`),
  KEY `chao_idx_ixhgqerwqjdfwuruaginjddcgwuozyulgcyu` (`redirectSrcUrl`),
  KEY `chao_idx_cenqpjjgmniiccllgqwtflrxcbhmqyxhzzjt` (`siteId`),
  KEY `chao_fk_uhvpqstkjfwktbaibxtwkquzgwledkhgkapi` (`associatedElementId`),
  CONSTRAINT `chao_fk_uhvpqstkjfwktbaibxtwkquzgwledkhgkapi` FOREIGN KEY (`associatedElementId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_retour_static_redirects`
--

DROP TABLE IF EXISTS `chao_retour_static_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_retour_static_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  `associatedElementId` int(11) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `redirectSrcUrl` varchar(255) DEFAULT '',
  `redirectSrcUrlParsed` varchar(255) DEFAULT '',
  `redirectSrcMatch` varchar(32) DEFAULT 'pathonly',
  `redirectMatchType` varchar(32) DEFAULT 'exactmatch',
  `redirectDestUrl` varchar(255) DEFAULT '',
  `redirectHttpCode` int(11) DEFAULT 301,
  `priority` int(11) DEFAULT 5,
  `hitCount` int(11) DEFAULT 1,
  `hitLastTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_aucdnhvdzfsldwqwzrozukcxunxvlcljlfel` (`redirectSrcUrlParsed`),
  KEY `chao_idx_apgxlmwqepliveyuyosfritkojuyhmnzeytw` (`redirectSrcUrl`),
  KEY `chao_idx_zcpmgvngkmnfhuvvqaujkcpbeztsoodxjyuz` (`siteId`),
  CONSTRAINT `chao_fk_fztkwzejhmbglwanenrgtomemrhucgpcwqvz` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_retour_stats`
--

DROP TABLE IF EXISTS `chao_retour_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_retour_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  `redirectSrcUrl` varchar(255) DEFAULT '',
  `referrerUrl` varchar(2000) DEFAULT '',
  `remoteIp` varchar(45) DEFAULT '',
  `userAgent` varchar(255) DEFAULT '',
  `exceptionMessage` varchar(255) DEFAULT '',
  `exceptionFilePath` varchar(255) DEFAULT '',
  `exceptionFileLine` int(11) DEFAULT 0,
  `hitCount` int(11) DEFAULT 1,
  `hitLastTime` datetime DEFAULT NULL,
  `handledByRetour` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `chao_idx_lqfyxyjuchgmxquvbtljyafuttzmvzotvxja` (`redirectSrcUrl`),
  KEY `chao_idx_nqjmenwimbzelnwnobkkjxdtkxdondtxcevo` (`siteId`),
  CONSTRAINT `chao_fk_gzdbiberzkuzhhhkfrggyikcqkfjutfztymt` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_revisions`
--

DROP TABLE IF EXISTS `chao_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_mtmznkjnmlqacckeboitskmxdarudhiyhnmm` (`canonicalId`,`num`),
  KEY `chao_fk_xpncmrdnvpoeonzvjrpqcpyhsuhmotkzdpsp` (`creatorId`),
  CONSTRAINT `chao_fk_idhbtqtfkqbtfhgufqdzelidudsreizzwuiu` FOREIGN KEY (`canonicalId`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_xpncmrdnvpoeonzvjrpqcpyhsuhmotkzdpsp` FOREIGN KEY (`creatorId`) REFERENCES `chao_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_searchindex`
--

DROP TABLE IF EXISTS `chao_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `chao_idx_oizmrcogflqlfqoiivfhsfwhzliobnezmplf` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sections`
--

DROP TABLE IF EXISTS `chao_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_nqxdmjbxleodifjrytutftxzcyxeexpjjgyi` (`handle`),
  KEY `chao_idx_whixnysylmtrhtlegsliboenycwpfbuaozad` (`name`),
  KEY `chao_idx_phhludzcuxhecwpnspughgutrhydhsfkcrhe` (`structureId`),
  KEY `chao_idx_rakmkeiejludrwbmrhrschqkfbkoljmutdbf` (`dateDeleted`),
  CONSTRAINT `chao_fk_omqsiwfzohlrqlfrpraqnpytncxoxphefoqv` FOREIGN KEY (`structureId`) REFERENCES `chao_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sections_sites`
--

DROP TABLE IF EXISTS `chao_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_huujmvmpswavoiqmfegiignhokxdcxinolqs` (`sectionId`,`siteId`),
  KEY `chao_idx_mivgkwbyyxypygzacaacclbpaynrhnshgwbl` (`siteId`),
  CONSTRAINT `chao_fk_dhkdekvumivkiavhpooewfynsegsithcejsk` FOREIGN KEY (`sectionId`) REFERENCES `chao_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_kdtsaihxkwubwsdivwwiuphgipvssbdbazxh` FOREIGN KEY (`siteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_seomatic_metabundles`
--

DROP TABLE IF EXISTS `chao_seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_seomatic_metabundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int(11) DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int(11) DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int(11) DEFAULT NULL,
  `sourceAltSiteSettings` text DEFAULT NULL,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text DEFAULT NULL,
  `metaSiteVars` text DEFAULT NULL,
  `metaSitemapVars` text DEFAULT NULL,
  `metaContainers` text DEFAULT NULL,
  `redirectsContainer` text DEFAULT NULL,
  `frontendTemplatesContainer` text DEFAULT NULL,
  `metaBundleSettings` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_jcqwvhtqpuiuvlqcvbcnqlkvtameoqwkpdze` (`sourceBundleType`),
  KEY `chao_idx_ofiahgwymhirskzyddwozqudtpcxhzbfihel` (`sourceId`),
  KEY `chao_idx_hinblkmttmfffbewcahwklbtoagytktkehzi` (`sourceSiteId`),
  KEY `chao_idx_wagqetqpehwfxaftloodvpabferwxilcytos` (`sourceHandle`),
  CONSTRAINT `chao_fk_xvkiouhhhijbtatsdslggqgetjoqdsxrtbuu` FOREIGN KEY (`sourceSiteId`) REFERENCES `chao_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sequences`
--

DROP TABLE IF EXISTS `chao_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sessions`
--

DROP TABLE IF EXISTS `chao_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_zhrelmkginquvymmshvnobkryeyioszlbchl` (`uid`),
  KEY `chao_idx_zpqnannepjxrxgxcalyasrjgckwquthhvqqs` (`token`),
  KEY `chao_idx_wriglslydnhnndjwrdfbmpuhnlwgpwhlftsr` (`dateUpdated`),
  KEY `chao_idx_lywisddogvmkmlkgnckykuftnrctvfuageuy` (`userId`),
  CONSTRAINT `chao_fk_jfdydpfqcqcyiarslpoylnmojdxsxtakgvui` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_shunnedmessages`
--

DROP TABLE IF EXISTS `chao_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_gcnvlupuqcnbpxhajbltmntgiblzbnqcwyrc` (`userId`,`message`),
  CONSTRAINT `chao_fk_osmagdlhgtajjtebsusxzeolrmhbawgzyflp` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sitegroups`
--

DROP TABLE IF EXISTS `chao_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_foklfhawcskyaazsgexgxtwjxktwclfylvkj` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sites`
--

DROP TABLE IF EXISTS `chao_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_ioxrucaukmmsqvzzwdodsqvchpxfkojvqbud` (`dateDeleted`),
  KEY `chao_idx_unqursrcplplkjmnwnqnlbdosbpjmlvujhuk` (`handle`),
  KEY `chao_idx_opaqmfhdxzsoljpfkimtinsgekdommbecdcb` (`sortOrder`),
  KEY `chao_fk_pccwwhgbxllbympclwbivgzmqmhierjmjfov` (`groupId`),
  CONSTRAINT `chao_fk_pccwwhgbxllbympclwbivgzmqmhierjmjfov` FOREIGN KEY (`groupId`) REFERENCES `chao_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_sprig_playgrounds`
--

DROP TABLE IF EXISTS `chao_sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_sprig_playgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `component` text DEFAULT NULL,
  `variables` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_structureelements`
--

DROP TABLE IF EXISTS `chao_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_kgadjbccvsmqhjyucwftzawnmbrhmpspxril` (`structureId`,`elementId`),
  KEY `chao_idx_omdsjyvwyvrjbzwlmiodexlpfpuqevdnyaed` (`root`),
  KEY `chao_idx_cpoaqsnkgtzgtgroehwxmmrfykpperxwodwc` (`lft`),
  KEY `chao_idx_iscujvekzgyxhellwsiaykmlogjaxuudfmqz` (`rgt`),
  KEY `chao_idx_izibkbbshqpthekvdvoytuqwaoiqtozzjnxi` (`level`),
  KEY `chao_idx_pjaftmbwbqxfbkfkqhgxtugsnnanonakgnpk` (`elementId`),
  CONSTRAINT `chao_fk_wdxfmkpopyluqruongpenkscuhylrqxbayug` FOREIGN KEY (`structureId`) REFERENCES `chao_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_structures`
--

DROP TABLE IF EXISTS `chao_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_iweennhhqaiziplpudvkxcymqcrcclducpkg` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_systemmessages`
--

DROP TABLE IF EXISTS `chao_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_euhagqebkfcfrxqnxesaxiwsnnadhqszwtol` (`key`,`language`),
  KEY `chao_idx_ncinzzlicbigazqyafxupavdhglpgzuroakd` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_taggroups`
--

DROP TABLE IF EXISTS `chao_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_snpzkhjndzosakfdskgdmmoqwdsvkihwvaaz` (`name`),
  KEY `chao_idx_rvcghthnsllxbfpgfhreedrbxjugcrymoqhx` (`handle`),
  KEY `chao_idx_axweinysngdwgejminxmgfxustqideagstie` (`dateDeleted`),
  KEY `chao_fk_aozbkckbfyvzemosaawlpsrxrzmsnoupkafj` (`fieldLayoutId`),
  CONSTRAINT `chao_fk_aozbkckbfyvzemosaawlpsrxrzmsnoupkafj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_tags`
--

DROP TABLE IF EXISTS `chao_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_uepuhxwsnmnfhivlmaohhlhpgqyxwersyaxu` (`groupId`),
  CONSTRAINT `chao_fk_qhyshrctuxwilbodpcnvmfwphqwpjjqmxwss` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_xhnhheevvtclovcslwzmgymrolrrfcrhjvqk` FOREIGN KEY (`groupId`) REFERENCES `chao_taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_tokens`
--

DROP TABLE IF EXISTS `chao_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_ikjyvmifogiynqspcdpcawqfffempqntxbhg` (`token`),
  KEY `chao_idx_medrutbnilljolplokmvbjivqgjzlosjyfml` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_usergroups`
--

DROP TABLE IF EXISTS `chao_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_usjstggcequenxqyccdtmjotazaqogtiiudb` (`handle`),
  KEY `chao_idx_wzrqutalbhkkepnuwvhfgtmbseiabdutgznj` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_usergroups_users`
--

DROP TABLE IF EXISTS `chao_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_djsccrezdonbcjoxtqtfudvukltdbulcoufc` (`groupId`,`userId`),
  KEY `chao_idx_hizpetwgffcrjthxkzpvbzmcqcirnhekpwoi` (`userId`),
  CONSTRAINT `chao_fk_mlqftzyxgvvkzgmurcfttystsekzucvajfbg` FOREIGN KEY (`groupId`) REFERENCES `chao_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_vzylqsyloqxfcememshbjazvxzuziaslnaxd` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_userpermissions`
--

DROP TABLE IF EXISTS `chao_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_nagajjujqkcpfuybbekgsncpguuqdhilriat` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `chao_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_etapinfzisotnoiifvldfcivroncwaavmqhv` (`permissionId`,`groupId`),
  KEY `chao_idx_zltmgxjaeqyfbbitjbqyucvkgdxtrkxlxncm` (`groupId`),
  CONSTRAINT `chao_fk_pxkooqjilwvhmrdylqxesxrdabdvltpppozh` FOREIGN KEY (`permissionId`) REFERENCES `chao_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_vlrllaespmcqevtmqpvhfuvdcpxxhzgbxovs` FOREIGN KEY (`groupId`) REFERENCES `chao_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_userpermissions_users`
--

DROP TABLE IF EXISTS `chao_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_qvammuixwfbxoqhdydbyvybrwfyljjdjuffb` (`permissionId`,`userId`),
  KEY `chao_idx_ejonaaaszobagxrjgbabbmeygpsuwkuezciq` (`userId`),
  CONSTRAINT `chao_fk_bdsncqrlrgdvzwsellywdamgddcqlwubzbhd` FOREIGN KEY (`permissionId`) REFERENCES `chao_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_jiyuvgvbytbrdpdlyeeesxuamokopnvopwxc` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_userpreferences`
--

DROP TABLE IF EXISTS `chao_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `chao_fk_egvqzfsecctgejmuhqbwntycnpheeewkyfbt` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_users`
--

DROP TABLE IF EXISTS `chao_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chao_idx_wpsoaujgjzmlwluylsoymdkeawjgrpqxtqzb` (`active`),
  KEY `chao_idx_vgotjjmpbwhgzyaicxyaqivklgkozsohtaxu` (`locked`),
  KEY `chao_idx_lhkpuvghwmtyvsvizfyjyaudsahnuulszwqj` (`pending`),
  KEY `chao_idx_vomttihmlwinwckenlxhdaelmmrwovwyvkvn` (`suspended`),
  KEY `chao_idx_nelskvyvsfpqichcxaomufhgmcdkqipqymca` (`verificationCode`),
  KEY `chao_idx_qwdlxzlttnlkuguuyguvwvimuuyclwjitbne` (`email`),
  KEY `chao_idx_bwxyfrkmiohdvxmecmrjgadfumuxbvjkrwqb` (`username`),
  KEY `chao_fk_faocjvhkskhitckrnbercezowhrqojskaosw` (`photoId`),
  CONSTRAINT `chao_fk_faocjvhkskhitckrnbercezowhrqojskaosw` FOREIGN KEY (`photoId`) REFERENCES `chao_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chao_fk_yxruosiwkxpeptpkoisjywfpcwdztcbaocua` FOREIGN KEY (`id`) REFERENCES `chao_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_volumefolders`
--

DROP TABLE IF EXISTS `chao_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chao_idx_dyxkeanzichkkkcymoqtvksultczfqmcexus` (`name`,`parentId`,`volumeId`),
  KEY `chao_idx_fkfrcmtqaductmvlypeyytubvynapeeqbaqi` (`parentId`),
  KEY `chao_idx_gnhwlwkiybootuvyhifmwmpiludjhnutxoxw` (`volumeId`),
  CONSTRAINT `chao_fk_dcuwrakjbcyagqzlsnzhfskraosmptjrovdw` FOREIGN KEY (`volumeId`) REFERENCES `chao_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chao_fk_ktshfqkjyyvptdzrdwuuwcehrszxopicuabb` FOREIGN KEY (`parentId`) REFERENCES `chao_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_volumes`
--

DROP TABLE IF EXISTS `chao_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_cuizucsfsavwipbjsisoxgbibmcozobsrsjj` (`name`),
  KEY `chao_idx_bvdzfugfwratjseexpfevngmhwkisqdeniaf` (`handle`),
  KEY `chao_idx_qudafvrpjyhfytbackdtiaashobwnshvlsnk` (`fieldLayoutId`),
  KEY `chao_idx_mqfkfusljzkcwbvkaewsgtapqzwjquegolyl` (`dateDeleted`),
  CONSTRAINT `chao_fk_tbohvtkgudsmrealklaqxxqctxmhtbtbxagm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `chao_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chao_widgets`
--

DROP TABLE IF EXISTS `chao_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chao_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chao_idx_ewusxzbaawfkfpwsiybbipfsxythmnfkprlv` (`userId`),
  CONSTRAINT `chao_fk_pceayupgjisvcfswkgtxhtnzyczyzcmgdwvr` FOREIGN KEY (`userId`) REFERENCES `chao_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31  1:56:59
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.3.35-MariaDB-1:10.3.35+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `chao_addresses`
--

LOCK TABLES `chao_addresses` WRITE;
/*!40000 ALTER TABLE `chao_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_announcements`
--

LOCK TABLES `chao_announcements` WRITE;
/*!40000 ALTER TABLE `chao_announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_assetindexingsessions`
--

LOCK TABLES `chao_assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `chao_assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_assets`
--

LOCK TABLES `chao_assets` WRITE;
/*!40000 ALTER TABLE `chao_assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_assets` VALUES (10,1,1,1,'Encountering-Peace__NDA_14542_2018.jpg','image',NULL,2078,1438,2066979,NULL,0,0,'2023-05-27 04:34:37','2023-05-27 04:34:36','2023-05-27 04:34:38'),(14,1,1,1,'Curious-Direction__NDA_05659_2016.jpg','image',NULL,2328,1554,1988044,NULL,0,0,'2023-05-27 04:39:45','2023-05-27 04:39:46','2023-05-27 04:39:50'),(16,1,1,1,'Relentless-Hope__NDA_11739_2017.jpg','image',NULL,2433,1624,2908205,NULL,NULL,NULL,'2023-05-27 21:16:25','2023-05-27 21:16:25','2023-05-27 21:16:25');
/*!40000 ALTER TABLE `chao_assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_caches`
--

LOCK TABLES `chao_blitz_caches` WRITE;
/*!40000 ALTER TABLE `chao_blitz_caches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_caches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_cachetags`
--

LOCK TABLES `chao_blitz_cachetags` WRITE;
/*!40000 ALTER TABLE `chao_blitz_cachetags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_cachetags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_driverdata`
--

LOCK TABLES `chao_blitz_driverdata` WRITE;
/*!40000 ALTER TABLE `chao_blitz_driverdata` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_driverdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementcaches`
--

LOCK TABLES `chao_blitz_elementcaches` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementcaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementexpirydates`
--

LOCK TABLES `chao_blitz_elementexpirydates` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementexpirydates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementexpirydates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementfieldcaches`
--

LOCK TABLES `chao_blitz_elementfieldcaches` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementfieldcaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementfieldcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementqueries`
--

LOCK TABLES `chao_blitz_elementqueries` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementqueries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementqueries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementqueryattributes`
--

LOCK TABLES `chao_blitz_elementqueryattributes` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementqueryattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementqueryattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementquerycaches`
--

LOCK TABLES `chao_blitz_elementquerycaches` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementquerycaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementquerycaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementqueryfields`
--

LOCK TABLES `chao_blitz_elementqueryfields` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementqueryfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementqueryfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_elementquerysources`
--

LOCK TABLES `chao_blitz_elementquerysources` WRITE;
/*!40000 ALTER TABLE `chao_blitz_elementquerysources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_elementquerysources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_hints`
--

LOCK TABLES `chao_blitz_hints` WRITE;
/*!40000 ALTER TABLE `chao_blitz_hints` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_blitz_hints` VALUES (1,3,'index.twig','entry',67,'2023-05-27 04:22:52','2023-05-31 01:56:52','fc1cda50-26fa-4bf2-b4ea-634b2fcce8cc'),(36,4,'_components/popupDialogBox.twig','entry',2,'2023-05-30 15:35:37','2023-05-30 15:36:14','5749126c-994e-44a4-919b-baa23b356637'),(40,9,'_components/popupDialogBox.twig','entry',2,'2023-05-30 15:39:45','2023-05-31 01:56:52','bc4df641-f7b2-4e08-986a-b8c33218b4c3'),(121,18,'_components/form.twig','',5,'2023-05-30 18:08:07','2023-05-31 01:56:52','34b7f742-463a-42cb-9121-e53df8ce4506');
/*!40000 ALTER TABLE `chao_blitz_hints` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_includes`
--

LOCK TABLES `chao_blitz_includes` WRITE;
/*!40000 ALTER TABLE `chao_blitz_includes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_includes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_blitz_ssiincludecaches`
--

LOCK TABLES `chao_blitz_ssiincludecaches` WRITE;
/*!40000 ALTER TABLE `chao_blitz_ssiincludecaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_blitz_ssiincludecaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_categories`
--

LOCK TABLES `chao_categories` WRITE;
/*!40000 ALTER TABLE `chao_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_categorygroups`
--

LOCK TABLES `chao_categorygroups` WRITE;
/*!40000 ALTER TABLE `chao_categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_categorygroups_sites`
--

LOCK TABLES `chao_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `chao_categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_changedattributes`
--

LOCK TABLES `chao_changedattributes` WRITE;
/*!40000 ALTER TABLE `chao_changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_changedfields`
--

LOCK TABLES `chao_changedfields` WRITE;
/*!40000 ALTER TABLE `chao_changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_changedfields` VALUES (2,1,1,'2023-05-26 19:28:26',0,1),(2,1,3,'2023-05-27 21:17:02',0,1),(2,1,9,'2023-05-30 18:09:13',0,1),(35,1,18,'2023-05-30 18:09:12',0,1);
/*!40000 ALTER TABLE `chao_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_content`
--

LOCK TABLES `chao_content` WRITE;
/*!40000 ALTER TABLE `chao_content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_content` VALUES (1,1,1,NULL,'2023-05-26 19:23:04','2023-05-26 19:23:04','73a70e12-eec9-4f23-ae75-49a2a67524ea',NULL,NULL),(2,2,1,'Index','2023-05-26 19:27:51','2023-05-30 18:09:12','b7726e75-009f-468f-867c-12a89c7b88d5','Had to test out the sample field.',NULL),(3,3,1,'Index','2023-05-26 19:27:51','2023-05-26 19:27:51','f37fbca8-ff14-48e3-8d7b-d0236358870a',NULL,NULL),(4,4,1,'Index','2023-05-26 19:27:51','2023-05-26 19:27:51','81bb4d9e-2325-4d8b-9593-e03713d04997',NULL,NULL),(5,5,1,'Index','2023-05-26 19:27:55','2023-05-26 19:27:55','88ce7695-2241-4f02-8a5c-39da750ebd69',NULL,NULL),(7,7,1,'Index','2023-05-26 19:28:26','2023-05-26 19:28:26','df24576c-a980-49d7-b3a5-cf2d7ac22fc6','Had to test out the sample field.',NULL),(8,8,1,'Index','2023-05-27 04:22:34','2023-05-27 04:22:34','5d039a1a-0cfc-4daa-a535-93766db5db28','Had to test out the sample field.',NULL),(9,9,1,'Index','2023-05-27 04:22:34','2023-05-27 04:22:34','a4c76497-4230-4e30-a6ed-a996d2a6b39f','Had to test out the sample field.',NULL),(10,10,1,'Encountering Peace NDA 14542 2018','2023-05-27 04:34:36','2023-05-27 04:34:37','6f9af6f8-a0a5-43bd-9d75-685eb3327c0a',NULL,'{\"optimizedImageUrls\":{\"1200\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo4MiwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6MTIwMCwiaGVpZ2h0Ijo2NzUsImZpdCI6ImNvdmVyIn0sInNoYXJwZW4iOnRydWV9fQ==\",\"992\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo4MiwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6OTkyLCJoZWlnaHQiOjU1OCwiZml0IjoiY292ZXIifX19\",\"768\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo2MCwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6NzY4LCJoZWlnaHQiOjU3NiwiZml0IjoiY292ZXIifX19\",\"576\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo2MCwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6NTc2LCJoZWlnaHQiOjQzMiwiZml0IjoiY292ZXIifX19\"},\"optimizedWebPImageUrls\":{\"1200\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo4Mn0sInJlc2l6ZSI6eyJ3aWR0aCI6MTIwMCwiaGVpZ2h0Ijo2NzUsImZpdCI6ImNvdmVyIn0sInNoYXJwZW4iOnRydWV9fQ==\",\"992\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo4Mn0sInJlc2l6ZSI6eyJ3aWR0aCI6OTkyLCJoZWlnaHQiOjU1OCwiZml0IjoiY292ZXIifX19\",\"768\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo2MH0sInJlc2l6ZSI6eyJ3aWR0aCI6NzY4LCJoZWlnaHQiOjU3NiwiZml0IjoiY292ZXIifX19\",\"576\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkVuY291bnRlcmluZy1QZWFjZV9fTkRBXzE0NTQyXzIwMTguanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo2MH0sInJlc2l6ZSI6eyJ3aWR0aCI6NTc2LCJoZWlnaHQiOjQzMiwiZml0IjoiY292ZXIifX19\"},\"variantSourceWidths\":[\"1200\",\"992\",\"768\",\"576\"],\"variantHeights\":{\"1200\":675,\"992\":558,\"768\":576,\"576\":432},\"focalPoint\":{\"x\":0.5,\"y\":0.5},\"originalImageWidth\":2078,\"originalImageHeight\":1438,\"placeholder\":\"\\/9j\\/4AAQSkZJRgABAQECWAJYAAD\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wAARCAAJABADAREAAhEBAxEB\\/8QAFgABAQEAAAAAAAAAAAAAAAAABAIG\\/8QAIhAAAgECBQUAAAAAAAAAAAAAAQMEAAIREiExMzVRcXKR\\/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAEC\\/8QAGBEBAQEBAQAAAAAAAAAAAAAAAAERAlH\\/2gAMAwEAAhEDEQA\\/ALjSmmGsGa9Y2OVm30VOaYTqwddkWE98DV2mT1kV8dvikZpdnGv2raP\\/2Q==\",\"placeholderSvg\":null,\"colorPalette\":[\"#505755\",\"#e3dfdb\",\"#a29b99\",\"#b9b4b3\",\"#aeabb4\"],\"lightness\":60,\"placeholderWidth\":1200,\"placeholderHeight\":675,\"stickyErrors\":[]}'),(12,12,1,'Index','2023-05-27 04:34:39','2023-05-27 04:34:39','a460a968-eb2e-4e3e-afd7-9dfa070ecdbf','Had to test out the sample field.',NULL),(14,14,1,'Curious Direction NDA 05659 2016','2023-05-27 04:39:45','2023-05-27 04:39:50','3b621292-fe2f-48b2-a733-667126b0bebf',NULL,'{\"optimizedImageUrls\":{\"1200\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjgyLCJwcm9ncmVzc2l2ZSI6dHJ1ZSwidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWl6ZVNjYW5zIjp0cnVlfSwicmVzaXplIjp7IndpZHRoIjoxMjAwLCJoZWlnaHQiOjY3NSwiZml0IjoiY292ZXIifSwic2hhcnBlbiI6dHJ1ZX19\",\"992\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjgyLCJwcm9ncmVzc2l2ZSI6dHJ1ZSwidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWl6ZVNjYW5zIjp0cnVlfSwicmVzaXplIjp7IndpZHRoIjo5OTIsImhlaWdodCI6NTU4LCJmaXQiOiJjb3ZlciJ9fX0=\",\"768\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjYwLCJwcm9ncmVzc2l2ZSI6dHJ1ZSwidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWl6ZVNjYW5zIjp0cnVlfSwicmVzaXplIjp7IndpZHRoIjo3NjgsImhlaWdodCI6NTc2LCJmaXQiOiJjb3ZlciJ9fX0=\",\"576\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjYwLCJwcm9ncmVzc2l2ZSI6dHJ1ZSwidHJlbGxpc1F1YW50aXNhdGlvbiI6dHJ1ZSwib3ZlcnNob290RGVyaW5naW5nIjp0cnVlLCJvcHRpbWl6ZVNjYW5zIjp0cnVlfSwicmVzaXplIjp7IndpZHRoIjo1NzYsImhlaWdodCI6NDMyLCJmaXQiOiJjb3ZlciJ9fX0=\"},\"optimizedWebPImageUrls\":{\"1200\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJ3ZWJwIjp7InF1YWxpdHkiOjgyfSwicmVzaXplIjp7IndpZHRoIjoxMjAwLCJoZWlnaHQiOjY3NSwiZml0IjoiY292ZXIifSwic2hhcnBlbiI6dHJ1ZX19\",\"992\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJ3ZWJwIjp7InF1YWxpdHkiOjgyfSwicmVzaXplIjp7IndpZHRoIjo5OTIsImhlaWdodCI6NTU4LCJmaXQiOiJjb3ZlciJ9fX0=\",\"768\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJ3ZWJwIjp7InF1YWxpdHkiOjYwfSwicmVzaXplIjp7IndpZHRoIjo3NjgsImhlaWdodCI6NTc2LCJmaXQiOiJjb3ZlciJ9fX0=\",\"576\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IkN1cmlvdXMtRGlyZWN0aW9uX19OREFfMDU2NTlfMjAxNi5qcGciLCJlZGl0cyI6eyJ3ZWJwIjp7InF1YWxpdHkiOjYwfSwicmVzaXplIjp7IndpZHRoIjo1NzYsImhlaWdodCI6NDMyLCJmaXQiOiJjb3ZlciJ9fX0=\"},\"variantSourceWidths\":[\"1200\",\"992\",\"768\",\"576\"],\"variantHeights\":{\"1200\":675,\"992\":558,\"768\":576,\"576\":432},\"focalPoint\":{\"x\":0.5,\"y\":0.5},\"originalImageWidth\":2328,\"originalImageHeight\":1554,\"placeholder\":\"\\/9j\\/4AAQSkZJRgABAQECWAJYAAD\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wAARCAAJABADAREAAhEBAxEB\\/8QAFgABAQEAAAAAAAAAAAAAAAAABAUH\\/8QAIhAAAQMDAwUAAAAAAAAAAAAAAgABAwQGEQUhMSIzNEKB\\/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAEC\\/8QAFhEBAQEAAAAAAAAAAAAAAAAAAAER\\/9oADAMBAAIRAxEAPwAMNx5qPHjCP1Yny\\/1NWRYG4tOOMhkEhfjo3ZNMZ1L3XRCqLklK1H\\/\\/2Q==\",\"placeholderSvg\":null,\"colorPalette\":[\"#2e2828\",\"#d2d4d5\",\"#afb2b5\",\"#8d827c\",\"#97999e\"],\"lightness\":52,\"placeholderWidth\":1200,\"placeholderHeight\":675,\"stickyErrors\":[]}'),(15,15,1,'Index','2023-05-27 04:39:53','2023-05-27 04:39:53','83e4ee23-63f6-414a-979a-7ae77ef01e6e','Had to test out the sample field.',NULL),(16,16,1,'Relentless Hope NDA 11739 2017','2023-05-27 21:16:24','2023-05-27 21:16:24','dce223b7-3ca9-4ed2-b518-9691bde70937',NULL,'{\"optimizedImageUrls\":{\"1200\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo4MiwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6MTIwMCwiaGVpZ2h0Ijo2NzUsImZpdCI6ImNvdmVyIn19fQ==\",\"2400\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo2MSwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6MjQwMCwiaGVpZ2h0IjoxMzUwLCJmaXQiOiJjb3ZlciJ9LCJzaGFycGVuIjp0cnVlfX0=\",\"992\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo4MiwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6OTkyLCJoZWlnaHQiOjU1OCwiZml0IjoiY292ZXIifX19\",\"768\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo2MCwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6NzY4LCJoZWlnaHQiOjU3NiwiZml0IjoiY292ZXIifX19\",\"576\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsianBlZyI6eyJxdWFsaXR5Ijo2MCwicHJvZ3Jlc3NpdmUiOnRydWUsInRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pemVTY2FucyI6dHJ1ZX0sInJlc2l6ZSI6eyJ3aWR0aCI6NTc2LCJoZWlnaHQiOjQzMiwiZml0IjoiY292ZXIifX19\"},\"optimizedWebPImageUrls\":{\"1200\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo4Mn0sInJlc2l6ZSI6eyJ3aWR0aCI6MTIwMCwiaGVpZ2h0Ijo2NzUsImZpdCI6ImNvdmVyIn19fQ==\",\"2400\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo2MX0sInJlc2l6ZSI6eyJ3aWR0aCI6MjQwMCwiaGVpZ2h0IjoxMzUwLCJmaXQiOiJjb3ZlciJ9LCJzaGFycGVuIjp0cnVlfX0=\",\"992\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo4Mn0sInJlc2l6ZSI6eyJ3aWR0aCI6OTkyLCJoZWlnaHQiOjU1OCwiZml0IjoiY292ZXIifX19\",\"768\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo2MH0sInJlc2l6ZSI6eyJ3aWR0aCI6NzY4LCJoZWlnaHQiOjU3NiwiZml0IjoiY292ZXIifX19\",\"576\":\"https:\\/\\/image.goodcraft.dev\\/eyJidWNrZXQiOiJnb29kY3JhZnQtZGV2LWJ1Y2tldCIsImtleSI6IlJlbGVudGxlc3MtSG9wZV9fTkRBXzExNzM5XzIwMTcuanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo2MH0sInJlc2l6ZSI6eyJ3aWR0aCI6NTc2LCJoZWlnaHQiOjQzMiwiZml0IjoiY292ZXIifX19\"},\"variantSourceWidths\":[\"1200\",\"1200\",\"992\",\"768\",\"576\"],\"variantHeights\":{\"1200\":675,\"2400\":1350,\"992\":558,\"768\":576,\"576\":432},\"focalPoint\":{\"x\":0.5,\"y\":0.5},\"originalImageWidth\":2433,\"originalImageHeight\":1624,\"placeholder\":\"\\/9j\\/4AAQSkZJRgABAQECWAJYAAD\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wAARCAAJABADAREAAhEBAxEB\\/8QAFgABAQEAAAAAAAAAAAAAAAAAAwIF\\/8QAHxAAAgEEAgMAAAAAAAAAAAAAAQIAAwQRMxIhMVGB\\/8QAFwEAAwEAAAAAAAAAAAAAAAAAAAECA\\/\\/EABkRAAMBAQEAAAAAAAAAAAAAAAABAhESMf\\/aAAwDAQACEQMRAD8AEOBbh1HYXxMGsYSulg9S5U0l5KuCBkejEkTebhnUNI+SqHBR1rBE16f\\/2Q==\",\"placeholderSvg\":null,\"colorPalette\":[\"#727e5a\",\"#c3ac84\",\"#315339\",\"#9b97a5\",\"#a6ba8a\"],\"lightness\":48,\"placeholderWidth\":1200,\"placeholderHeight\":675,\"stickyErrors\":[]}'),(18,18,1,'Index','2023-05-27 21:17:02','2023-05-27 21:17:02','c177dac4-ff51-49fd-bcbe-d972d895e998','Had to test out the sample field.',NULL),(19,19,1,'Index','2023-05-30 15:35:04','2023-05-30 15:35:04','6e92bf91-3e42-4721-92fe-c0d856d8ca27','Had to test out the sample field.',NULL),(21,27,1,'Index','2023-05-30 15:35:35','2023-05-30 15:35:35','2119600c-537c-4789-ba10-617ce935f718','Had to test out the sample field.',NULL),(22,29,1,'Index','2023-05-30 15:39:17','2023-05-30 15:39:17','bc7e550f-8a10-43ff-8c1c-e256d2dec0f3','Had to test out the sample field.',NULL),(24,36,1,'Index','2023-05-30 15:39:40','2023-05-30 15:39:40','8d2503e6-8fc8-44ca-a9b2-4a3f03f4cf60','Had to test out the sample field.',NULL),(25,38,1,'Formie Form','2023-05-30 18:06:08','2023-05-30 18:06:35','dbabd91e-e0f1-4b45-8944-67085c631693',NULL,NULL),(27,42,1,'Index','2023-05-30 18:09:12','2023-05-30 18:09:12','4a1407d3-9c85-432f-a35a-517a5d4fa8b6','Had to test out the sample field.',NULL);
/*!40000 ALTER TABLE `chao_content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_craftidtokens`
--

LOCK TABLES `chao_craftidtokens` WRITE;
/*!40000 ALTER TABLE `chao_craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_deprecationerrors`
--

LOCK TABLES `chao_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `chao_deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_drafts`
--

LOCK TABLES `chao_drafts` WRITE;
/*!40000 ALTER TABLE `chao_drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_elements`
--

LOCK TABLES `chao_elements` WRITE;
/*!40000 ALTER TABLE `chao_elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-05-26 19:23:04','2023-05-26 19:23:04',NULL,NULL,'45bfe756-5bf4-44c7-a3bb-490a87eae243'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-05-26 19:27:51','2023-05-30 18:09:12',NULL,NULL,'9ac2601c-2957-4be1-89db-0ab24ed2fc59'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-05-26 19:27:51','2023-05-26 19:27:51',NULL,NULL,'b6860be0-fe05-465d-9586-1fdb1f684609'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-05-26 19:27:51','2023-05-26 19:27:51',NULL,NULL,'2e50f931-3e2d-47ff-b12b-c21a2817a617'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2023-05-26 19:27:55','2023-05-26 19:27:55',NULL,NULL,'1a1c3fc8-d343-409a-a1b3-a6b80f41afd3'),(7,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2023-05-26 19:28:26','2023-05-26 19:28:26',NULL,NULL,'fdb8df3a-95a6-461a-9bf1-6548bb2e31ca'),(8,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2023-05-27 04:22:34','2023-05-27 04:22:34',NULL,NULL,'e3c044f5-e9f0-4001-b342-109e332c2ba9'),(9,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2023-05-27 04:22:34','2023-05-27 04:22:34',NULL,NULL,'18b8d89b-f940-4f94-9b65-6bc58ebcfab2'),(10,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-05-27 04:34:36','2023-05-27 04:34:37',NULL,'2023-05-27 21:16:56','ef335254-4c4e-4e96-8424-d6a1bb7f7028'),(12,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2023-05-27 04:34:39','2023-05-27 04:34:39',NULL,NULL,'5fcb9bbb-b98a-4e70-9e5c-3631baa9ffb4'),(14,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-05-27 04:39:45','2023-05-27 04:39:50',NULL,'2023-05-27 21:16:56','c9a05d7b-e691-4022-b6aa-a3f6565bf1e1'),(15,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2023-05-27 04:39:53','2023-05-27 04:39:53',NULL,NULL,'1e8e1438-1943-4309-9133-beea2084d222'),(16,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-05-27 21:16:24','2023-05-27 21:16:24',NULL,NULL,'288be7de-ceea-499d-844f-8790cefe539c'),(18,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2023-05-27 21:17:02','2023-05-27 21:17:02',NULL,NULL,'341839d8-cc1f-4624-a69a-6c6f15618001'),(19,2,NULL,10,1,'craft\\elements\\Entry',1,0,'2023-05-30 15:35:04','2023-05-30 15:35:04',NULL,NULL,'067b4137-7db8-4dbe-b41f-92f2957dd6fe'),(21,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:35:08','2023-05-30 15:35:08',NULL,'2023-05-30 15:35:15','efca8d1d-ade9-4e49-b1f5-05f49b04cbcd'),(22,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:35:15','2023-05-30 15:35:15',NULL,'2023-05-30 15:35:19','0eae637f-e426-48c5-9b1b-c15f7cb87864'),(23,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:35:19','2023-05-30 15:35:19',NULL,'2023-05-30 15:35:31','910ee751-e7f7-4f9a-8875-314ca4d364bc'),(24,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:35:31','2023-05-30 15:35:31',NULL,'2023-05-30 15:35:33','19ecd1d1-3da6-4138-937f-20bb4921eb4c'),(26,NULL,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:35:35','2023-05-30 15:35:35',NULL,'2023-05-30 15:38:39','74dc6d4a-19c4-4572-8473-ce9c507c49b5'),(27,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2023-05-30 15:35:35','2023-05-30 15:35:35',NULL,NULL,'29d032eb-7664-4c43-b8e2-3f05ef4d52ba'),(28,26,NULL,12,3,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:35:35','2023-05-30 15:35:35',NULL,'2023-05-30 15:38:39','13294c04-ea34-4adc-84aa-f3296f7e68aa'),(29,2,NULL,13,1,'craft\\elements\\Entry',1,0,'2023-05-30 15:39:17','2023-05-30 15:39:17',NULL,NULL,'80e6078b-c8eb-431d-905c-22473f3e9a57'),(31,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:39:22','2023-05-30 15:39:22',NULL,'2023-05-30 15:39:32','34bb97c0-7af1-4719-9dd2-897b01240ac2'),(32,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:39:32','2023-05-30 15:39:32',NULL,'2023-05-30 15:39:37','051b1e33-bc7c-47d2-9f54-774347564478'),(33,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:39:37','2023-05-30 15:39:37',NULL,'2023-05-30 15:39:39','ae0c01e9-b760-45bc-bffc-2c8e646ae3ef'),(35,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:39:40','2023-05-30 18:09:12',NULL,NULL,'7301fdcf-7fb1-4466-96f1-a3f845727222'),(36,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2023-05-30 15:39:40','2023-05-30 15:39:40',NULL,NULL,'8ce591da-94c9-4b72-85a2-2fd189a450ff'),(37,35,NULL,15,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 15:39:40','2023-05-30 15:39:40',NULL,NULL,'72efde86-0181-40f6-8c1b-f35901b9540c'),(38,NULL,NULL,NULL,6,'verbb\\formie\\elements\\Form',1,0,'2023-05-30 18:06:08','2023-05-30 18:06:35',NULL,NULL,'e82b7c6b-1512-4e1b-aeca-f7c269a32a35'),(40,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 18:09:05','2023-05-30 18:09:05',NULL,'2023-05-30 18:09:08','439d7afd-a8b3-4597-a0e2-07f13b5bd70b'),(42,2,NULL,16,1,'craft\\elements\\Entry',1,0,'2023-05-30 18:09:12','2023-05-30 18:09:12',NULL,NULL,'bf607d39-533b-4dbf-9d89-f530aef1c62e'),(43,35,NULL,17,4,'craft\\elements\\MatrixBlock',1,0,'2023-05-30 18:09:12','2023-05-30 18:09:12',NULL,NULL,'4501d050-f1e2-4c7b-9520-bdbf97807aae'),(44,NULL,NULL,NULL,6,'verbb\\formie\\elements\\Submission',1,0,'2023-05-30 18:20:47','2023-05-30 18:20:47',NULL,NULL,'e5737d15-f859-4661-936c-0746934a5e41'),(45,NULL,NULL,NULL,NULL,'verbb\\formie\\elements\\SentNotification',1,0,'2023-05-30 18:20:49','2023-05-30 18:20:49',NULL,NULL,'eb09b25f-49f2-4ecf-8dba-8ccff1e62ac5'),(46,NULL,NULL,NULL,NULL,'verbb\\formie\\elements\\SentNotification',1,0,'2023-05-30 18:20:49','2023-05-30 18:20:49',NULL,NULL,'75b4ebb8-7264-4367-96d5-59fd8df05d78');
/*!40000 ALTER TABLE `chao_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_elements_sites`
--

LOCK TABLES `chao_elements_sites` WRITE;
/*!40000 ALTER TABLE `chao_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-05-26 19:23:04','2023-05-26 19:23:04','5a24f0ec-afe7-458e-9993-d90db84e17e2'),(2,2,1,'index','__home__',1,'2023-05-26 19:27:51','2023-05-26 19:27:51','e13b50ab-ee1d-4b00-9f78-19b8d7c5585b'),(3,3,1,'index','__home__',1,'2023-05-26 19:27:51','2023-05-26 19:27:51','9822093d-e9bc-4247-a3cf-2eecb0f9e197'),(4,4,1,'index','__home__',1,'2023-05-26 19:27:51','2023-05-26 19:27:51','90fe8c58-30e6-4c27-812c-03e884b86105'),(5,5,1,'index','__home__',1,'2023-05-26 19:27:55','2023-05-26 19:27:55','ef5201ad-814a-4f4f-a76a-4c22bac30d4a'),(7,7,1,'index','__home__',1,'2023-05-26 19:28:26','2023-05-26 19:28:26','fdbd8584-9fe8-4d9f-b119-93d239ed2854'),(8,8,1,'index','__home__',1,'2023-05-27 04:22:34','2023-05-27 04:22:34','55a2bf2a-e8d4-4b16-abf1-5419bee6caa8'),(9,9,1,'index','__home__',1,'2023-05-27 04:22:34','2023-05-27 04:22:34','a5329214-12b3-4336-a9ba-d7c1fbb9f3ec'),(10,10,1,NULL,NULL,1,'2023-05-27 04:34:36','2023-05-27 04:34:36','039df608-1c37-442b-b5fa-76156ea2007c'),(12,12,1,'index','__home__',1,'2023-05-27 04:34:39','2023-05-27 04:34:39','acc7a190-32db-4bb3-9746-be4cad064c16'),(14,14,1,NULL,NULL,1,'2023-05-27 04:39:45','2023-05-27 04:39:45','aeeb7188-8161-494a-bfbb-1710aba4a375'),(15,15,1,'index','__home__',1,'2023-05-27 04:39:53','2023-05-27 04:39:53','53d96928-e9e6-4eca-8fe4-4f2e9dbdf0e7'),(16,16,1,NULL,NULL,1,'2023-05-27 21:16:24','2023-05-27 21:16:24','fb35a09e-6085-4131-9608-4a319d68d52f'),(18,18,1,'index','__home__',1,'2023-05-27 21:17:02','2023-05-27 21:17:02','a78d47d7-2ab1-4b69-9b69-cd71f0eb9038'),(19,19,1,'index','__home__',1,'2023-05-30 15:35:04','2023-05-30 15:35:04','2ab81a4a-28a3-4ae1-b15f-c78d2e0add07'),(21,21,1,NULL,NULL,1,'2023-05-30 15:35:08','2023-05-30 15:35:08','0eec8e3a-09a7-40bf-8ec2-affc2ecc673b'),(22,22,1,NULL,NULL,1,'2023-05-30 15:35:15','2023-05-30 15:35:15','31f54099-8526-4170-8e4f-a08366a51d29'),(23,23,1,NULL,NULL,1,'2023-05-30 15:35:19','2023-05-30 15:35:19','854fcff8-271e-493b-a4ae-54a84c016c0f'),(24,24,1,NULL,NULL,1,'2023-05-30 15:35:31','2023-05-30 15:35:31','e91099c4-29e7-404e-a371-33063742f796'),(26,26,1,NULL,NULL,1,'2023-05-30 15:35:35','2023-05-30 15:35:35','03021466-22fe-4388-a537-6371e4ec3b29'),(27,27,1,'index','__home__',1,'2023-05-30 15:35:35','2023-05-30 15:35:35','fd47d538-f0eb-4a68-b86b-433f7b220aec'),(28,28,1,NULL,NULL,1,'2023-05-30 15:35:35','2023-05-30 15:35:35','08e5f9a6-3312-4cae-b0f3-4ba21ca49c5d'),(29,29,1,'index','__home__',1,'2023-05-30 15:39:17','2023-05-30 15:39:17','9fcb58a3-70f9-43e1-8912-6c1751e05acc'),(31,31,1,NULL,NULL,1,'2023-05-30 15:39:22','2023-05-30 15:39:22','df3d51bb-df2a-420e-8c85-c9ebf81500f7'),(32,32,1,NULL,NULL,1,'2023-05-30 15:39:32','2023-05-30 15:39:32','2ce43581-7156-47bb-a9bc-f5490ef3865b'),(33,33,1,NULL,NULL,1,'2023-05-30 15:39:37','2023-05-30 15:39:37','3a355f1f-a641-4dff-9748-f428fad0e06d'),(35,35,1,NULL,NULL,1,'2023-05-30 15:39:40','2023-05-30 15:39:40','1a2f9865-5277-4e02-ae35-406131979ad1'),(36,36,1,'index','__home__',1,'2023-05-30 15:39:40','2023-05-30 15:39:40','a89f7a8b-449c-4304-88bf-a0165a2f3dc9'),(37,37,1,NULL,NULL,1,'2023-05-30 15:39:40','2023-05-30 15:39:40','87be5363-3d74-49ce-be35-287d837e4a90'),(38,38,1,NULL,NULL,1,'2023-05-30 18:06:08','2023-05-30 18:06:08','2e773ba2-6b85-48a5-8d2e-93ea9be37c3c'),(40,40,1,NULL,NULL,1,'2023-05-30 18:09:05','2023-05-30 18:09:05','df25b17b-558f-445e-8a8d-2f5bb12c14ef'),(42,42,1,'index','__home__',1,'2023-05-30 18:09:12','2023-05-30 18:09:12','5d782239-d050-4a00-acc8-bc7f0db7ed03'),(43,43,1,NULL,NULL,1,'2023-05-30 18:09:12','2023-05-30 18:09:12','4f5c1b65-a321-425f-96f3-3d67e780010b'),(44,44,1,NULL,NULL,1,'2023-05-30 18:20:47','2023-05-30 18:20:47','331370b4-dc3f-4354-9d13-b52b991789c4'),(45,45,1,NULL,NULL,1,'2023-05-30 18:20:49','2023-05-30 18:20:49','336c7799-83db-4fec-b0dd-a3ae540f45f8'),(46,46,1,NULL,NULL,1,'2023-05-30 18:20:49','2023-05-30 18:20:49','689b00ce-ce58-43fb-8b63-28e7da3a263a');
/*!40000 ALTER TABLE `chao_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_entries`
--

LOCK TABLES `chao_entries` WRITE;
/*!40000 ALTER TABLE `chao_entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_entries` VALUES (2,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-26 19:27:51','2023-05-26 19:27:51'),(3,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-26 19:27:51','2023-05-26 19:27:51'),(4,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-26 19:27:51','2023-05-26 19:27:51'),(5,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-26 19:27:55','2023-05-26 19:27:55'),(7,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-26 19:28:26','2023-05-26 19:28:26'),(8,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-27 04:22:34','2023-05-27 04:22:34'),(9,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-27 04:22:34','2023-05-27 04:22:34'),(12,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-27 04:34:39','2023-05-27 04:34:39'),(15,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-27 04:39:53','2023-05-27 04:39:53'),(18,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-27 21:17:02','2023-05-27 21:17:02'),(19,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-30 15:35:04','2023-05-30 15:35:04'),(27,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-30 15:35:35','2023-05-30 15:35:35'),(29,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-30 15:39:17','2023-05-30 15:39:17'),(36,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-30 15:39:40','2023-05-30 15:39:40'),(42,1,NULL,1,NULL,'2023-05-26 19:27:00',NULL,NULL,'2023-05-30 18:09:12','2023-05-30 18:09:12');
/*!40000 ALTER TABLE `chao_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_entrytypes`
--

LOCK TABLES `chao_entrytypes` WRITE;
/*!40000 ALTER TABLE `chao_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_entrytypes` VALUES (1,1,1,'Index','index',0,'site',NULL,'{section.name|raw}',1,'2023-05-26 19:27:51','2023-05-26 19:27:51',NULL,'a2c1a242-e2c4-4102-882d-20fdf12839db');
/*!40000 ALTER TABLE `chao_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_feedme_feeds`
--

LOCK TABLES `chao_feedme_feeds` WRITE;
/*!40000 ALTER TABLE `chao_feedme_feeds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_feedme_feeds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_fieldgroups`
--

LOCK TABLES `chao_fieldgroups` WRITE;
/*!40000 ALTER TABLE `chao_fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_fieldgroups` VALUES (1,'Common','2023-05-26 19:23:04','2023-05-26 19:23:04',NULL,'95025c1d-db15-4404-b654-f0f0f31f236e'),(2,'Comon','2023-05-30 15:39:04','2023-05-30 15:39:04',NULL,'7c150880-028e-4d63-9a75-05ebf5149115');
/*!40000 ALTER TABLE `chao_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_fieldlayoutfields`
--

LOCK TABLES `chao_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `chao_fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_fieldlayoutfields` VALUES (9,2,8,2,0,1,'2023-05-27 04:22:34','2023-05-27 04:22:34','01b06c19-7d20-48a0-acda-e08d050394a6'),(25,1,13,1,0,1,'2023-05-30 15:39:17','2023-05-30 15:39:17','85606241-baf3-477c-8809-0b8c26007d5a'),(26,1,13,3,0,2,'2023-05-30 15:39:17','2023-05-30 15:39:17','3059261f-0390-45b2-9b99-f8a8d9a66e84'),(27,1,13,9,0,3,'2023-05-30 15:39:17','2023-05-30 15:39:17','42fb1eee-118d-4b3a-9f5e-8dc8b2a87335'),(28,5,14,9,0,0,'2023-05-30 15:41:34','2023-05-30 15:41:34','15dc06d8-d4cb-44c5-8c10-6b5078901f45'),(32,6,15,15,0,0,'2023-05-30 18:06:35','2023-05-30 18:06:35','730088e0-92ef-43da-a127-dcc093eddf70'),(33,6,15,16,1,1,'2023-05-30 18:06:35','2023-05-30 18:06:35','ac6cc55f-bde9-40b7-8caa-3877eec652ea'),(34,6,15,17,1,2,'2023-05-30 18:06:35','2023-05-30 18:06:35','1e5b1c2e-c1f3-4562-a317-b1b1e506b26b'),(35,4,16,10,0,0,'2023-05-30 18:07:25','2023-05-30 18:07:25','f1819f1a-a7b6-4343-a0f0-59376c729c67'),(36,4,16,13,0,1,'2023-05-30 18:07:25','2023-05-30 18:07:25','d50dfcd4-02d4-4b24-ab83-669525cbb8dc'),(37,4,16,11,0,2,'2023-05-30 18:07:25','2023-05-30 18:07:25','2375c649-0c61-4325-8531-6baf0dde3713'),(38,4,16,12,0,3,'2023-05-30 18:07:25','2023-05-30 18:07:25','d32202c5-c9d1-4006-a5a6-3ddb5945ac57'),(39,4,16,18,0,4,'2023-05-30 18:07:25','2023-05-30 18:07:25','1bc19687-6583-43da-bac8-86ef66482a92');
/*!40000 ALTER TABLE `chao_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_fieldlayouts`
--

LOCK TABLES `chao_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `chao_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-05-26 19:27:51','2023-05-26 19:27:51',NULL,'a856faa4-6964-4b5b-9689-1a623e83f0d1'),(2,'craft\\elements\\Asset','2023-05-27 04:22:34','2023-05-27 04:22:34',NULL,'d0c0ad20-e522-44e3-8e59-c15bc6fd36bc'),(3,'craft\\elements\\MatrixBlock','2023-05-30 15:34:55','2023-05-30 15:34:55','2023-05-30 15:38:40','2d880999-b900-4e92-86c9-6972167373bd'),(4,'craft\\elements\\MatrixBlock','2023-05-30 15:39:08','2023-05-30 15:39:08',NULL,'bb07d397-4b8e-4fc9-99e0-be6288197c9f'),(5,'benf\\neo\\elements\\Block','2023-05-30 15:41:34','2023-05-30 15:41:34',NULL,'1b77b419-c14b-4214-8f82-10fe11546ce6'),(6,'verbb\\formie\\elements\\Form','2023-05-30 18:06:08','2023-05-30 18:06:35',NULL,'a911ccc6-6a8f-4331-b395-87e970438ca0');
/*!40000 ALTER TABLE `chao_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_fieldlayouttabs`
--

LOCK TABLES `chao_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `chao_fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_fieldlayouttabs` VALUES (8,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"a942ae87-aa76-4daf-91e1-b5939c12e7df\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8bed16f3-ccec-431d-91a9-4cea50d49dcd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"03403fb7-efce-4256-ae24-2a81dbbf421b\"}]',1,'2023-05-27 04:22:34','2023-05-27 04:22:34','590bc761-4626-4f4d-af72-18a2d192e427'),(11,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2100f678-3297-4624-9d45-5f0ff4577d51\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9f9592ec-68d6-4e1f-8271-6856523ea803\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2d490473-7fe4-4c48-9014-f676dbd575f6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a38ec9c7-125f-402c-8e46-9b212b50ee85\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"168c0aa6-d86e-44d7-b73f-1df8117681fb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ac935a13-bd0d-4769-82e5-9bea8ee2fbbc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ce9e9c79-220b-45f1-8397-b350973a4c82\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6a4a57fb-0f7d-4a85-99d6-b0e4be164cc4\"}]',1,'2023-05-30 15:36:12','2023-05-30 15:36:12','a2b7a4bc-c58a-4847-a4ff-5d2c25a799b3'),(13,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"92f573e7-ccb2-4b76-8890-e53d5685a413\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"78f88a76-f236-4c1c-93ff-de52db168887\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"08795a71-347e-4b91-9b63-9620d51c49f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b6d73ee9-c01a-4459-bd62-29974bff27bc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"05880fc4-c88b-4f31-9397-c55aa70de265\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"17caad41-44ec-487f-a9e5-0dc89d3803d4\"}]',1,'2023-05-30 15:39:17','2023-05-30 15:39:17','b14cba5a-bd84-43a5-a626-8593742b0b16'),(14,5,'tab','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5882bcfa-518c-4611-95e5-dc683ec1c152\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"17caad41-44ec-487f-a9e5-0dc89d3803d4\"}]',1,'2023-05-30 15:41:34','2023-05-30 15:41:34','74c03d21-20f9-4af9-8f8c-c6cd5add63c2'),(15,6,'Page 1','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"af468b53-f424-41bc-93ef-310dcdc3869d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cc504800-d030-434d-9328-dccab99180ce\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"fa2448e7-ed4b-4b16-90d5-4625d03fb5a2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8117b3f9-6f39-4f04-a201-b2b015f1b751\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"5089009b-93bb-4f49-9e7e-da4c82b7e5b0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"18c005e2-f198-4836-9618-d9ca2425cc34\"}]',0,'2023-05-30 18:06:08','2023-05-30 18:06:35','951f3739-b86f-4094-b6c8-efbfb38f3a74'),(16,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"80a0cb84-1c94-4e42-a913-e8b31c198a9b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3d0aee8c-c441-40fd-ac84-9167c9e2ef2e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"36f31b3e-124f-4218-af2c-72d2b7b6293a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"33256147-375b-4aaa-9f2a-1ee861454c19\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8cfbdcf1-b0d3-452c-98d4-2186e4a488fb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9b5d3535-78fa-436a-92b1-2863d6488288\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d60e3fe3-3290-40fd-90f0-ffdd8a2d9fbc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"96c4d8b1-e79a-462b-b993-39f3521d554d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"baa12dfe-f1f0-4703-80a5-90993c7fd677\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a52e368d-3fc2-417f-ac29-682612b69713\"}]',1,'2023-05-30 18:07:25','2023-05-30 18:07:25','e91b5f93-afa3-4997-a1c5-455f2db9dcc9');
/*!40000 ALTER TABLE `chao_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_fields`
--

LOCK TABLES `chao_fields` WRITE;
/*!40000 ALTER TABLE `chao_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_fields` VALUES (1,1,'Sample Field','sampleField','global','fuvqzowc',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-05-26 19:27:29','2023-05-26 19:27:29','08795a71-347e-4b91-9b63-9620d51c49f2'),(2,1,'Optimization Example','optimizationExample','global','zoefnqni',NULL,0,'none',NULL,'nystudio107\\imageoptimize\\fields\\OptimizedImages','{\"displayDominantColorPalette\":false,\"displayLazyLoadPlaceholderImages\":true,\"displayOptimizedImageVariants\":true,\"fieldVolumeSettings\":{\"pictures\":\"*\"},\"ignoreFilesOfType\":[\"image\\/svg\",\"image\\/gif\"],\"variants\":[{\"width\":\"1200\",\"useAspectRatio\":\"1\",\"aspectRatioX\":\"16\",\"aspectRatioY\":\"9\",\"retinaSizes\":[\"1\",\"2\"],\"quality\":\"82\",\"format\":\"jpg\"},{\"width\":\"992\",\"useAspectRatio\":\"1\",\"aspectRatioX\":\"16\",\"aspectRatioY\":\"9\",\"retinaSizes\":[\"1\"],\"quality\":\"82\",\"format\":\"jpg\"},{\"width\":\"768\",\"useAspectRatio\":\"1\",\"aspectRatioX\":\"4\",\"aspectRatioY\":\"3\",\"retinaSizes\":[\"1\"],\"quality\":\"60\",\"format\":\"jpg\"},{\"width\":\"576\",\"useAspectRatio\":\"1\",\"aspectRatioX\":\"4\",\"aspectRatioY\":\"3\",\"retinaSizes\":[\"1\"],\"quality\":\"60\",\"format\":\"jpg\"}]}','2023-05-27 04:22:34','2023-05-27 21:20:09','03403fb7-efce-4256-ae24-2a81dbbf421b'),(3,1,'Images','images','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:47d85af7-a58a-401a-91ac-8a7e694423d2\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:47d85af7-a58a-401a-91ac-8a7e694423d2\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-05-27 04:22:34','2023-05-27 04:22:34','053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b'),(9,2,'Popup Dialog Box','popupDialogBox','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":null,\"maxBlocks\":null,\"contentTable\":\"{{%matrixcontent_popupdialogbox}}\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null}','2023-05-30 15:39:08','2023-05-30 18:07:25','17caad41-44ec-487f-a9e5-0dc89d3803d4'),(10,NULL,'Button Text','buttonText','matrixBlockType:52415a0c-7e5c-4900-978d-76aa5a03727e','awchfgot',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-05-30 15:39:08','2023-05-30 15:39:08','3d0aee8c-c441-40fd-ac84-9167c9e2ef2e'),(11,NULL,'OverlayText','overlayText','matrixBlockType:52415a0c-7e5c-4900-978d-76aa5a03727e','xvurjjyv',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-05-30 15:39:08','2023-05-30 15:39:08','9b5d3535-78fa-436a-92b1-2863d6488288'),(12,NULL,'Overlay Close','overlayClose','matrixBlockType:52415a0c-7e5c-4900-978d-76aa5a03727e','tcmzsmno',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-05-30 15:39:08','2023-05-30 15:39:08','96c4d8b1-e79a-462b-b993-39f3521d554d'),(13,NULL,'Overlay Title','overlayTitle','matrixBlockType:52415a0c-7e5c-4900-978d-76aa5a03727e','oduxeyyi',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-05-30 15:39:08','2023-05-30 15:39:08','33256147-375b-4aaa-9f2a-1ee861454c19'),(14,1,'Builder','builder','global',NULL,NULL,0,'site',NULL,'benf\\neo\\Field','{\"maxBlocks\":null,\"maxLevels\":null,\"maxTopBlocks\":null,\"minBlocks\":null,\"minLevels\":null,\"minTopBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-05-30 15:41:34','2023-05-30 15:41:34','d181b219-295a-4226-9aeb-6b57d5c1fee9'),(15,NULL,'Your Name','yourName','formie:e82b7c6b-1512-4e1b-aeca-f7c269a32a35','kfcujouv','Please enter your full name.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":null,\"prefixPrePopulate\":null,\"prefixRequired\":false,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":false,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameDefaultValue\":null,\"firstNamePrePopulate\":null,\"firstNameRequired\":true,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":null,\"middleNamePrePopulate\":null,\"middleNameRequired\":false,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":false,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameDefaultValue\":null,\"lastNamePrePopulate\":null,\"lastNameRequired\":true,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":\"Your name\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":38,\"isNested\":false}','2023-05-30 18:06:08','2023-05-30 18:06:35','cc504800-d030-434d-9328-dccab99180ce'),(16,NULL,'Email Address','emailAddress','formie:e82b7c6b-1512-4e1b-aeca-f7c269a32a35','gyysmbvo','Please enter your email so we can get in touch.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"matchField\":null,\"placeholder\":\"e.g. psherman@wallaby.com\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":38,\"isNested\":false}','2023-05-30 18:06:08','2023-05-30 18:06:35','8117b3f9-6f39-4f04-a201-b2b015f1b751'),(17,NULL,'Message','message','formie:e82b7c6b-1512-4e1b-aeca-f7c269a32a35','xxzgcmbi','Please enter your comments.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"limit\":false,\"min\":null,\"minType\":null,\"max\":null,\"maxType\":\"characters\",\"useRichText\":false,\"richTextButtons\":null,\"matchField\":null,\"placeholder\":\"e.g. The reason for my enquiry is...\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":38,\"isNested\":false}','2023-05-30 18:06:08','2023-05-30 18:06:35','18c005e2-f198-4836-9618-d9ca2425cc34'),(18,NULL,'Select Form','selectForm','matrixBlockType:52415a0c-7e5c-4900-978d-76aa5a03727e',NULL,NULL,0,'site',NULL,'verbb\\formie\\fields\\Forms','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-05-30 18:07:25','2023-05-30 18:07:25','a52e368d-3fc2-417f-ac29-682612b69713');
/*!40000 ALTER TABLE `chao_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_fmc_formieform`
--

LOCK TABLES `chao_fmc_formieform` WRITE;
/*!40000 ALTER TABLE `chao_fmc_formieform` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_fmc_formieform` VALUES (1,44,1,'2023-05-30 18:20:47','2023-05-30 18:20:47','27d498f2-ff49-4824-ba6b-bb80a5f11288','{\"prefix\":null,\"firstName\":\"Test\",\"middleName\":null,\"lastName\":\"test\",\"name\":null,\"isMultiple\":true}','test@vessul.co','Test');
/*!40000 ALTER TABLE `chao_fmc_formieform` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_emailtemplates`
--

LOCK TABLES `chao_formie_emailtemplates` WRITE;
/*!40000 ALTER TABLE `chao_formie_emailtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_forms`
--

LOCK TABLES `chao_formie_forms` WRITE;
/*!40000 ALTER TABLE `chao_formie_forms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_forms` VALUES (38,'formieForm','{{%fmc_formieform}}','{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":false,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"end\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"submitMethod\":\"page-reload\",\"submitAction\":\"entry\",\"submitActionTab\":\"same-tab\",\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"},\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":true,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"},\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"scheduleFormExpiredMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"limitSubmissions\":false,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":\"total\",\"limitSubmissionsMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}',NULL,2,1,1,'forever',NULL,'retain','retain',6,'2023-05-30 18:06:08','2023-05-30 18:06:35','e82b7c6b-1512-4e1b-aeca-f7c269a32a35');
/*!40000 ALTER TABLE `chao_formie_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_formtemplates`
--

LOCK TABLES `chao_formie_formtemplates` WRITE;
/*!40000 ALTER TABLE `chao_formie_formtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_formtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_integrations`
--

LOCK TABLES `chao_formie_integrations` WRITE;
/*!40000 ALTER TABLE `chao_formie_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_nested`
--

LOCK TABLES `chao_formie_nested` WRITE;
/*!40000 ALTER TABLE `chao_formie_nested` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_nested` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_nestedfieldrows`
--

LOCK TABLES `chao_formie_nestedfieldrows` WRITE;
/*!40000 ALTER TABLE `chao_formie_nestedfieldrows` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_nestedfieldrows` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_notifications`
--

LOCK TABLES `chao_formie_notifications` WRITE;
/*!40000 ALTER TABLE `chao_formie_notifications` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_notifications` VALUES (1,38,NULL,NULL,'Admin Notification',1,'A new submission was made on \"{formName}\"','email','{systemEmail}','{\"toRecipients\":[]}',NULL,NULL,'{field.emailAddress}',NULL,'{field.emailAddress}',NULL,NULL,'[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"A user submission has been made on the \\\"\"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Form Name\",\"value\":\"{formName}\"}},{\"type\":\"text\",\"text\":\"\\\" form on \"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Site Name\",\"value\":\"{siteName}\"}},{\"type\":\"text\",\"text\":\" at \"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Timestamp (yyyy-mm-dd hh:mm:ss)\",\"value\":\"{timestamp}\"}}]},{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Their submission details are:\"}]},{\"type\":\"paragraph\",\"content\":[{\"type\":\"variableTag\",\"attrs\":{\"label\":\"All Form Fields\",\"value\":\"{allFields}\"}}]}]',1,NULL,NULL,0,'{\"sendRule\":\"send\",\"conditionRule\":\"all\",\"conditions\":[]}','2023-05-30 18:06:08','2023-05-30 18:06:35','2a364659-f21e-4d27-a0ff-5b2994db578c'),(2,38,NULL,NULL,'User Notification',1,'Thanks for contacting us!','email','{field.emailAddress}','{\"toRecipients\":[]}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Thanks again for contacting us. Our team will get back to you as soon as we can.\"}]},{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"As a reminder, you submitted the following details at \"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Timestamp (yyyy-mm-dd hh:mm:ss)\",\"value\":\"{timestamp}\"}}]},{\"type\":\"paragraph\",\"content\":[{\"type\":\"variableTag\",\"attrs\":{\"label\":\"All Form Fields\",\"value\":\"{allFields}\"}}]}]',1,NULL,NULL,0,'{\"sendRule\":\"send\",\"conditionRule\":\"all\",\"conditions\":[]}','2023-05-30 18:06:08','2023-05-30 18:06:35','b7e61556-d83c-480b-9713-1210da7a4262');
/*!40000 ALTER TABLE `chao_formie_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_pagesettings`
--

LOCK TABLES `chao_formie_pagesettings` WRITE;
/*!40000 ALTER TABLE `chao_formie_pagesettings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_pagesettings` VALUES (1,6,15,'{\"submitButtonLabel\":\"Contact us\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-05-30 18:06:08','2023-05-30 18:06:08','fb18d555-f4a3-4e4f-a789-3178028a71b7');
/*!40000 ALTER TABLE `chao_formie_pagesettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_payments`
--

LOCK TABLES `chao_formie_payments` WRITE;
/*!40000 ALTER TABLE `chao_formie_payments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_payments_plans`
--

LOCK TABLES `chao_formie_payments_plans` WRITE;
/*!40000 ALTER TABLE `chao_formie_payments_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_payments_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_payments_subscriptions`
--

LOCK TABLES `chao_formie_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `chao_formie_payments_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_pdftemplates`
--

LOCK TABLES `chao_formie_pdftemplates` WRITE;
/*!40000 ALTER TABLE `chao_formie_pdftemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_pdftemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_relations`
--

LOCK TABLES `chao_formie_relations` WRITE;
/*!40000 ALTER TABLE `chao_formie_relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_rows`
--

LOCK TABLES `chao_formie_rows` WRITE;
/*!40000 ALTER TABLE `chao_formie_rows` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_rows` VALUES (4,6,32,0,'2023-05-30 18:06:35','2023-05-30 18:06:35','2d38bed7-1f3d-4926-a458-5fdade3246e5'),(5,6,33,1,'2023-05-30 18:06:35','2023-05-30 18:06:35','0755272b-0f94-469a-97d0-02a18201c078'),(6,6,34,2,'2023-05-30 18:06:35','2023-05-30 18:06:35','ff6ad6b7-cd28-4947-a54b-4cf4a862e89d');
/*!40000 ALTER TABLE `chao_formie_rows` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_sentnotifications`
--

LOCK TABLES `chao_formie_sentnotifications` WRITE;
/*!40000 ALTER TABLE `chao_formie_sentnotifications` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_sentnotifications` VALUES (45,'Admin Notification',38,44,1,'A new submission was made on \"Formie Form\"','dev@vessul.co',NULL,NULL,'test@vessul.co','','test@vessul.co','Chaos',NULL,'A user submission has been made on the \"Formie Form\" form on Chaos at\n2023-05-30 11:20:48\n\nTheir submission details are:\n\n YOUR NAME\nFIRST NAME: Test\nLAST NAME: test\n\nEMAIL ADDRESS\ntest@vessul.co\n\nMESSAGE\nTest\n','<p>A user submission has been made on the \"Formie Form\" form on Chaos at 2023-05-30 11:20:48</p><p>Their submission details are:</p><p><p>\n            <strong>Your Name</strong><br>\n    \n            \n                    <strong>First Name: </strong>Test<br>\n        \n        \n                    <strong>Last Name: </strong>test<br>\n            </p>\n<p>\n            <strong>Email Address</strong><br>\n    \n            test@vessul.co\n    </p><p>\n            <strong>Message</strong><br>\n    \n                        Test\n            </p></p>','{\"formieVersion\":\"Formie 2.0.29\",\"craftVersion\":\"Craft Solo 4.4.13\",\"ipAddress\":\"Console Request\",\"userAgent\":\"Console Request\",\"transportType\":\"Sendmail\"}',NULL,'Notification email “Admin Notification” could not be sent for submission “44”. The mailer service failed to send the notification: “”.','2023-05-30 18:20:49','2023-05-30 18:20:49','e98e0dbe-77e8-4656-b802-f4fb0b4f2817'),(46,'User Notification',38,44,2,'Thanks for contacting us!','test@vessul.co',NULL,NULL,'','','dev@vessul.co','Chaos',NULL,'Thanks again for contacting us. Our team will get back to you as soon\nas we can.\n\nAs a reminder, you submitted the following details at 2023-05-30\n11:20:49\n\n YOUR NAME\nFIRST NAME: Test\nLAST NAME: test\n\nEMAIL ADDRESS\ntest@vessul.co\n\nMESSAGE\nTest\n','<p>Thanks again for contacting us. Our team will get back to you as soon as we can.</p><p>As a reminder, you submitted the following details at 2023-05-30 11:20:49</p><p><p>\n            <strong>Your Name</strong><br>\n    \n            \n                    <strong>First Name: </strong>Test<br>\n        \n        \n                    <strong>Last Name: </strong>test<br>\n            </p>\n<p>\n            <strong>Email Address</strong><br>\n    \n            test@vessul.co\n    </p><p>\n            <strong>Message</strong><br>\n    \n                        Test\n            </p></p>','{\"formieVersion\":\"Formie 2.0.29\",\"craftVersion\":\"Craft Solo 4.4.13\",\"ipAddress\":\"Console Request\",\"userAgent\":\"Console Request\",\"transportType\":\"Sendmail\"}',NULL,'Notification email “User Notification” could not be sent for submission “44”. The mailer service failed to send the notification: “”.','2023-05-30 18:20:49','2023-05-30 18:20:49','ef54b218-4594-4e1d-90e1-c7ad7b8c6dd9');
/*!40000 ALTER TABLE `chao_formie_sentnotifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_statuses`
--

LOCK TABLES `chao_formie_statuses` WRITE;
/*!40000 ALTER TABLE `chao_formie_statuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_statuses` VALUES (1,'New','new','green',NULL,1,1,NULL,'2023-05-26 19:23:15','2023-05-26 19:23:15','9aa25dcc-fd5c-4735-968b-0f5016abcc67');
/*!40000 ALTER TABLE `chao_formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_stencils`
--

LOCK TABLES `chao_formie_stencils` WRITE;
/*!40000 ALTER TABLE `chao_formie_stencils` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_stencils` VALUES (1,'Contact Form','contactForm','{\"dataRetention\":\"forever\",\"dataRetentionValue\":null,\"fileUploadsAction\":\"retain\",\"notifications\":[{\"attachFiles\":true,\"attachPdf\":false,\"bcc\":null,\"cc\":null,\"conditions\":\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enableConditions\":false,\"enabled\":true,\"formId\":null,\"from\":\"{field.emailAddress}\",\"fromName\":null,\"id\":\"new981-8077\",\"name\":\"Admin Notification\",\"pdfTemplateId\":null,\"recipients\":\"email\",\"replyTo\":\"{field.emailAddress}\",\"replyToName\":null,\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"templateId\":null,\"to\":\"{systemEmail}\",\"toConditions\":\"{\\\"toRecipients\\\":[]}\",\"uid\":null},{\"attachFiles\":true,\"attachPdf\":false,\"bcc\":null,\"cc\":null,\"conditions\":\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enableConditions\":false,\"enabled\":true,\"formId\":null,\"from\":null,\"fromName\":null,\"id\":\"new7052-5168\",\"name\":\"User Notification\",\"pdfTemplateId\":\"\",\"recipients\":\"email\",\"replyTo\":null,\"replyToName\":null,\"subject\":\"Thanks for contacting us!\",\"templateId\":\"\",\"to\":\"{field.emailAddress}\",\"toConditions\":\"{\\\"toRecipients\\\":[]}\",\"uid\":null}],\"pages\":[{\"id\":\"new1272610411\",\"label\":\"Page 1\",\"notificationFlag\":true,\"rows\":[{\"fields\":[{\"brandNewField\":false,\"handle\":\"yourName\",\"hasLabel\":true,\"id\":\"new7715-7348\",\"label\":\"Your Name\",\"settings\":{\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"firstNameCollapsed\":false,\"firstNameDefaultValue\":\"\",\"firstNameEnabled\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameRequired\":true,\"handle\":\"yourName\",\"instructions\":\"Please enter your full name.\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"label\":\"Your Name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"lastNameCollapsed\":false,\"lastNameDefaultValue\":\"\",\"lastNameEnabled\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameRequired\":true,\"maxType\":\"characters\",\"middleNameCollapsed\":true,\"middleNameDefaultValue\":\"\",\"middleNameEnabled\":false,\"middleNameLabel\":\"Middle Name\",\"placeholder\":\"Your name\",\"prefixCollapsed\":true,\"prefixDefaultValue\":\"\",\"prefixEnabled\":false,\"prefixLabel\":\"Prefix\",\"subfieldLabelPosition\":\"\",\"useMultipleFields\":true,\"visibility\":\"\"},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"}],\"id\":\"new8990-9934\"},{\"fields\":[{\"brandNewField\":false,\"handle\":\"emailAddress\",\"hasLabel\":true,\"id\":\"new6482-9528\",\"label\":\"Email Address\",\"settings\":{\"handle\":\"emailAddress\",\"instructions\":\"Please enter your email so we can get in touch.\",\"instructionsPosition\":\"\",\"label\":\"Email Address\",\"labelPosition\":\"\",\"maxType\":\"characters\",\"placeholder\":\"e.g. psherman@wallaby.com\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"}],\"id\":\"new9524-8509\"},{\"fields\":[{\"brandNewField\":false,\"handle\":\"message\",\"hasLabel\":true,\"id\":\"new982-7322\",\"label\":\"Message\",\"settings\":{\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"handle\":\"message\",\"instructions\":\"Please enter your comments.\",\"instructionsPosition\":\"\",\"label\":\"Message\",\"labelPosition\":\"\",\"maxType\":\"characters\",\"placeholder\":\"e.g. The reason for my enquiry is...\",\"required\":true,\"visibility\":\"\"},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"}],\"id\":\"new2177-9685\"}],\"settings\":{\"backButtonLabel\":\"Back\",\"buttonsPosition\":\"left\",\"label\":\"Page 1\",\"showBackButton\":false,\"submitButtonLabel\":\"Contact us\"},\"sortOrder\":0}],\"settings\":{\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"defaultEmailTemplateId\":null,\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"disableCaptchas\":false,\"displayCurrentPageTitle\":false,\"displayFormTitle\":false,\"displayPageProgress\":false,\"displayPageTabs\":false,\"errorMessage\":[{\"content\":[{\"text\":\"Couldn’t save submission due to errors.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"errorMessagePosition\":\"top-form\",\"fileUploadsAction\":null,\"limitSubmissions\":false,\"limitSubmissionsMessage\":null,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"progressPosition\":\"end\",\"redirectUrl\":null,\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormEnd\":null,\"scheduleFormExpiredMessage\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormStart\":null,\"scrollToTop\":true,\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionFormHide\":false,\"submitActionMessage\":[{\"content\":[{\"text\":\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"submitActionMessagePosition\":\"top-form\",\"submitActionMessageTimeout\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitMethod\":\"ajax\",\"validationOnFocus\":true,\"validationOnSubmit\":true},\"userDeletedAction\":\"retain\"}',NULL,NULL,NULL,1,NULL,'2023-05-26 19:23:15','2023-05-26 19:23:15','e510f893-335d-417c-8a0d-f610ac8068f2');
/*!40000 ALTER TABLE `chao_formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_submissions`
--

LOCK TABLES `chao_formie_submissions` WRITE;
/*!40000 ALTER TABLE `chao_formie_submissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_formie_submissions` VALUES (44,'2023-05-30 11:20:47',38,1,NULL,0,0,NULL,NULL,'{\"form\":{\"redirectUrl\":\"https:\\/\\/chaos.ddev.site\\/?submissionId={uid}\"}}',NULL,'2023-05-30 18:20:47','2023-05-30 18:20:47','6d6cb97b-96d8-4557-829b-6248a85d228b');
/*!40000 ALTER TABLE `chao_formie_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_syncfields`
--

LOCK TABLES `chao_formie_syncfields` WRITE;
/*!40000 ALTER TABLE `chao_formie_syncfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_syncfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_syncs`
--

LOCK TABLES `chao_formie_syncs` WRITE;
/*!40000 ALTER TABLE `chao_formie_syncs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_syncs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_formie_tokens`
--

LOCK TABLES `chao_formie_tokens` WRITE;
/*!40000 ALTER TABLE `chao_formie_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_formie_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_globalsets`
--

LOCK TABLES `chao_globalsets` WRITE;
/*!40000 ALTER TABLE `chao_globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_gqlschemas`
--

LOCK TABLES `chao_gqlschemas` WRITE;
/*!40000 ALTER TABLE `chao_gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_gqltokens`
--

LOCK TABLES `chao_gqltokens` WRITE;
/*!40000 ALTER TABLE `chao_gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_imagetransforms`
--

LOCK TABLES `chao_imagetransforms` WRITE;
/*!40000 ALTER TABLE `chao_imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_info`
--

LOCK TABLES `chao_info` WRITE;
/*!40000 ALTER TABLE `chao_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_info` VALUES (1,'4.4.13','4.4.0.4',0,'jlxoolpkoojk','3@qewqthwecp','2023-05-26 19:23:04','2023-05-30 19:04:07','bf7dc394-0fc8-48e4-a7a6-6ef157bcdc29');
/*!40000 ALTER TABLE `chao_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_knockknock_logins`
--

LOCK TABLES `chao_knockknock_logins` WRITE;
/*!40000 ALTER TABLE `chao_knockknock_logins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_knockknock_logins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_lenz_linkfield`
--

LOCK TABLES `chao_lenz_linkfield` WRITE;
/*!40000 ALTER TABLE `chao_lenz_linkfield` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_lenz_linkfield` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_matrixblocks`
--

LOCK TABLES `chao_matrixblocks` WRITE;
/*!40000 ALTER TABLE `chao_matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_matrixblocks` VALUES (35,2,9,2,NULL,'2023-05-30 15:39:40','2023-05-30 15:39:40'),(37,36,9,2,NULL,'2023-05-30 15:39:40','2023-05-30 15:39:40'),(43,42,9,2,NULL,'2023-05-30 18:09:12','2023-05-30 18:09:12');
/*!40000 ALTER TABLE `chao_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_matrixblocks_owners`
--

LOCK TABLES `chao_matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `chao_matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_matrixblocks_owners` VALUES (35,2,1),(37,36,1),(43,42,1);
/*!40000 ALTER TABLE `chao_matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_matrixblocktypes`
--

LOCK TABLES `chao_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `chao_matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_matrixblocktypes` VALUES (2,9,4,'Regular','regular',1,'2023-05-30 15:39:08','2023-05-30 15:39:08','52415a0c-7e5c-4900-978d-76aa5a03727e');
/*!40000 ALTER TABLE `chao_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_matrixcontent_popupdialogbox`
--

LOCK TABLES `chao_matrixcontent_popupdialogbox` WRITE;
/*!40000 ALTER TABLE `chao_matrixcontent_popupdialogbox` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_matrixcontent_popupdialogbox` VALUES (1,31,1,'2023-05-30 15:39:22','2023-05-30 15:39:22','1ed205b0-2191-4e72-a6d7-1a7c85a3a1e5',NULL,NULL,NULL,NULL),(2,32,1,'2023-05-30 15:39:32','2023-05-30 15:39:32','8cdd3f5d-78f7-4529-ad95-039909864b47','Show overlay',NULL,NULL,'Title to have'),(3,33,1,'2023-05-30 15:39:37','2023-05-30 15:39:37','09f543fe-de1b-46bc-b1bd-7e8e310459ab','Show overlay','Text filling the box up!',NULL,'Title to have'),(5,35,1,'2023-05-30 15:39:40','2023-05-30 18:09:12','67e8ed4d-8114-46ea-8045-89b7e040ed04','Show overlay','Text filling the box up!','Close','Title to have'),(6,37,1,'2023-05-30 15:39:40','2023-05-30 15:39:40','5a130bf8-12a8-4405-92d6-f1214e3b8b84','Show overlay','Text filling the box up!','Close','Title to have'),(7,40,1,'2023-05-30 18:09:05','2023-05-30 18:09:05','eebd7063-6a3f-4c8f-a6dc-c411cc489da0',NULL,NULL,NULL,NULL),(9,43,1,'2023-05-30 18:09:12','2023-05-30 18:09:12','e8725429-7187-4b14-96c0-7a9d765446e0','Show overlay','Text filling the box up!','Close','Title to have');
/*!40000 ALTER TABLE `chao_matrixcontent_popupdialogbox` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_migrations`
--

LOCK TABLES `chao_migrations` WRITE;
/*!40000 ALTER TABLE `chao_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_migrations` VALUES (1,'craft','Install','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','d08ab12d-c1ec-49a0-aa79-ab0ca9ea6c0c'),(2,'craft','m210121_145800_asset_indexing_changes','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','faf953c1-addc-4ffa-a6e2-43a4b26ac145'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','9f0741a4-e96d-45ae-9b26-cfddc0908267'),(4,'craft','m210724_180756_rename_source_cols','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','96f47b7e-4140-42af-aff3-63496ef3d388'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','cbe79ba4-3b08-47bb-8f9a-dc7b7221a35e'),(6,'craft','m210817_014201_universal_users','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','a4a29287-9a55-4ecc-80cb-fb5cfb5a88c1'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','17cb796d-4434-4cd3-b072-a63f818dad02'),(8,'craft','m211115_135500_image_transformers','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','c9ea1d9c-f66a-445d-876b-68afac9cad31'),(9,'craft','m211201_131000_filesystems','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','268d9961-cad7-49b4-b6ed-90b44c2becb8'),(10,'craft','m220103_043103_tab_conditions','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','12d351dc-9a97-4bb1-9053-c216ac124fef'),(11,'craft','m220104_003433_asset_alt_text','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','fef7f48c-9aa6-4510-bdab-145461b1f53f'),(12,'craft','m220123_213619_update_permissions','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','19cff465-89c0-4268-8c1a-98b4ef55a216'),(13,'craft','m220126_003432_addresses','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','aea3a4e5-f27f-457f-ba62-9b36aa6f5787'),(14,'craft','m220209_095604_add_indexes','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','029e5134-208b-4029-a5f0-7d0938e2bf55'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','037879a8-f544-4e55-ab64-24065757165c'),(16,'craft','m220214_000000_truncate_sessions','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','999868af-8778-45ef-b76d-d9fd15547945'),(17,'craft','m220222_122159_full_names','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','6e312019-3faa-40ef-80cd-272198d96c07'),(18,'craft','m220223_180559_nullable_address_owner','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','56ea968d-db8c-4981-961d-65f920cf147f'),(19,'craft','m220225_165000_transform_filesystems','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','c52954de-0c93-47a5-813b-b8eec3c91e18'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','ddde9606-f735-4cdc-aa18-6dd7b311aa86'),(21,'craft','m220314_211928_field_layout_element_uids','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','5f4cfd3b-4a70-4ad8-834b-e4f286c4756c'),(22,'craft','m220316_123800_transform_fs_subpath','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','f64eeb67-3adb-4381-9946-9e387e0def33'),(23,'craft','m220317_174250_release_all_jobs','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','24da22e1-ca10-4808-91aa-9285b2001629'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','ec099067-a0e9-4241-a07b-28b0f9cc96f3'),(25,'craft','m220413_024536_site_enabled_string','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','332ca97b-e08b-482d-b37a-07d45d7e506e'),(26,'craft','m221027_160703_add_image_transform_fill','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','58aba87d-fb63-445e-8ead-3d28ccf259bb'),(27,'craft','m221028_130548_add_canonical_id_index','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','2dce7438-0411-4dbb-a9be-4f92f4fbabc0'),(28,'craft','m221118_003031_drop_element_fks','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','cdea457e-a996-4bcf-8dfa-fd643fffb42b'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','3bb66d6c-cf1d-4f39-88bc-1e6711e13a8a'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','b10eda78-ff0d-48b6-bec5-24aa6b2f5444'),(31,'plugin:aws-s3','Install','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','6ff8c260-571e-40c5-b37f-89262c573200'),(32,'plugin:aws-s3','m220119_204627_update_fs_configs','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','07b80dd2-0253-40a7-8c9b-12c8434fff8b'),(33,'plugin:postmark','m190220_005730_update_email_settings','2023-05-26 19:23:06','2023-05-26 19:23:06','2023-05-26 19:23:06','95d3fa65-ff30-4cdc-b436-27501107d981'),(34,'plugin:postmark','m190727_220415_drop_plugin_settings','2023-05-26 19:23:06','2023-05-26 19:23:06','2023-05-26 19:23:06','c92c9c52-346a-43a9-adc0-8de41d5ca4d1'),(35,'plugin:redactor','m180430_204710_remove_old_plugins','2023-05-26 19:23:07','2023-05-26 19:23:07','2023-05-26 19:23:07','96420fc1-90ca-44a5-8617-d007aa436634'),(36,'plugin:redactor','Install','2023-05-26 19:23:07','2023-05-26 19:23:07','2023-05-26 19:23:07','bcfe0c7f-4a0b-49db-ae6c-b6f373d236d4'),(37,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2023-05-26 19:23:07','2023-05-26 19:23:07','2023-05-26 19:23:07','28dccefc-6c28-49a1-95fe-e679d01d7a89'),(38,'plugin:knock-knock','Install','2023-05-26 19:23:08','2023-05-26 19:23:08','2023-05-26 19:23:08','e60f279a-a8cb-411d-9509-3368a5b40ba2'),(39,'plugin:feed-me','Install','2023-05-26 19:23:09','2023-05-26 19:23:09','2023-05-26 19:23:09','c4363308-16bc-4595-8509-f3dbb0e920f0'),(40,'plugin:feed-me','m230123_152413_set_empty_values','2023-05-26 19:23:09','2023-05-26 19:23:09','2023-05-26 19:23:09','df85522b-734b-4b68-a608-99f35b23bbd7'),(41,'plugin:sprig','Install','2023-05-26 19:23:09','2023-05-26 19:23:09','2023-05-26 19:23:09','e140d766-1d92-4c98-8e70-024edb2466b7'),(42,'plugin:formie','Install','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','c5641852-552a-4b5c-a686-95f1fcd84f0b'),(43,'plugin:formie','m220420_000000_stencil_add_entryid','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','9d2ad80b-8c2b-441f-9dda-104a276713d9'),(44,'plugin:formie','m220422_000000_migrate_asset_fields','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','f973adfb-1240-4ed6-a749-7d5d8ebc86a7'),(45,'plugin:formie','m220530_000000_payments','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','096af466-d69e-4fd5-b963-b82ffaf89130'),(46,'plugin:formie','m220727_000000_hubspot','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','1e774876-1627-43b8-81e4-7d7bf6d2df7a'),(47,'plugin:formie','m220903_000000_remove_old_form_settings','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','87355e9b-1c48-4d87-9cae-9aedc8df652b'),(48,'plugin:formie','m220904_000000_add_siteid_entry_redirect','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','bc53d63d-86aa-4062-b10d-82c93c58161c'),(49,'plugin:formie','m220905_000000_integration_enabled','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','8aeca803-2727-4747-b542-88c0c8b73a6e'),(50,'plugin:formie','m220917_000000_submission_spamclass','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','da315259-07e9-48ad-824e-ba7d658fb85d'),(51,'plugin:formie','m220918_000000_email_sender','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','eb4981b2-7d46-41a3-94d4-4178dbb60daa'),(52,'plugin:formie','m221130_000000_sent_notifications','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','901c5688-9bb0-4052-adb2-cdf54eacaae0'),(53,'plugin:formie','m221206_000000_fix_syncs','2023-05-26 19:23:15','2023-05-26 19:23:15','2023-05-26 19:23:15','a0889edb-3d81-4763-b29a-07e079917354'),(54,'plugin:blitz','Install','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','7b7ca35e-a332-4829-9cbe-50b1e4d828c3'),(55,'plugin:blitz','m220330_120000_update_settings','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','f79c7f4e-91c6-4d79-8127-f7658a0b3bb3'),(56,'plugin:blitz','m220511_120000_add_hints_table','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','413310e0-eb87-4e40-8e99-b51dea484599'),(57,'plugin:blitz','m220517_120000_add_hints_announcement','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','474cf10a-c9ae-455a-9cdb-aef98bf5f5a6'),(58,'plugin:blitz','m220630_120000_add_commerce_integration','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','092f7622-1f18-4589-b0da-61b96614f1b1'),(59,'plugin:blitz','m221026_120000_add_include_tables','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','d47b98ae-c5e5-4246-991b-0ad416403990'),(60,'plugin:blitz','m230112_120000_add_widget_announcement','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','ae0847bb-01d9-405f-b9f3-54a7f68efbbf'),(61,'plugin:blitz','m230211_110000_add_elementquery_columns_tables','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','f323f996-72a0-47b1-85c5-1d15c396a546'),(62,'plugin:blitz','m230211_120000_add_element_fields_columns_tables','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','e720b628-5eb0-437d-8651-c388fc4ad4f5'),(63,'plugin:retour','Install','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','694ad8e2-4591-4ab3-a9c4-cb8725bdf4fc'),(64,'plugin:retour','m181013_122446_add_remote_ip','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','3fb5c583-c63e-4862-8d4c-b870080e811d'),(65,'plugin:retour','m181013_171315_truncate_match_type','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','460c6874-eb1d-458e-b8e3-a3ecf779fcc0'),(66,'plugin:retour','m181013_202455_add_redirect_src_match','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','bde0140e-0bda-4240-83e7-0691acaca3e9'),(67,'plugin:retour','m181018_123901_add_stats_info','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','552de5ed-9d29-4736-9259-c4b1b99dd74e'),(68,'plugin:retour','m181018_135656_add_redirect_status','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','d7ebd918-6b08-4bdf-b765-3bc467a399cc'),(69,'plugin:retour','m181213_233502_add_site_id','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','2d7ffa1b-2863-4ef6-a43d-307bebb24ca2'),(70,'plugin:retour','m181216_043222_rebuild_indexes','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','910e2281-f74e-4c91-982b-ebfbcc231e89'),(71,'plugin:retour','m190416_212500_widget_type_update','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','6c2714bf-31cb-4057-8a18-2a536ea22067'),(72,'plugin:retour','m200109_144310_add_redirectSrcUrl_index','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','dc651e05-ef5d-4abb-ad78-868a01dde9c2'),(73,'plugin:retour','m210603_221000_add_gql_schema_components','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','13f21848-28a4-4a74-b245-7422b5f66657'),(74,'plugin:retour','m221130_224500_add_priorities_column','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','c19085a5-1114-4c6b-b1ec-cfbf8c237fb1'),(75,'plugin:neo','Install','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','0c50e572-3b73-41a8-9f69-34e66536e300'),(76,'plugin:neo','m220409_142203_neoblocks_owners_table','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','664d9e48-0d22-410d-b07e-fa63f7b7ea93'),(77,'plugin:neo','m220411_111523_remove_ownersiteid_and_uid_neoblocks_columns','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','71eb1f3c-9bb2-4522-97f0-43eab9968b63'),(78,'plugin:neo','m220412_135950_neoblockstructures_rename_ownersiteid_to_siteid','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','1fe837a4-c7d2-43be-a7df-7d02f6717941'),(79,'plugin:neo','m220421_105948_resave_shared_field_layouts','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','4a203a67-a8e5-4674-bd26-139f4a2d5458'),(80,'plugin:neo','m220428_060316_add_group_dropdown_setting','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','3df5db7f-537d-4f8e-a0e6-2a1fc26f2eaf'),(81,'plugin:neo','m220511_054742_delete_converted_field_block_types_and_groups','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','d00fc84b-434d-48e4-b3aa-fcdbc0289d29'),(82,'plugin:neo','m220516_124013_add_blocktype_description','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','dc8f5276-5ec4-47e8-befb-1aa6f4c24e3e'),(83,'plugin:neo','m220723_153601_add_conditions_column_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','9bbceef1-6780-46dc-b067-209cd4a13136'),(84,'plugin:neo','m220731_130608_add_min_child_blocks_column_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','1c94cff8-4043-42fa-98fd-e6f8a00ea078'),(85,'plugin:neo','m220805_072702_add_min_blocks_column_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','2b392b20-567b-422c-b5c6-73a323bd5b00'),(86,'plugin:neo','m220805_112335_add_min_sibling_blocks_column_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','44ce2b75-8496-4294-bb71-5a48fab4ed48'),(87,'plugin:neo','m220812_115137_add_enabled_column_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','ac333963-26ca-4996-930e-fe3f137807ca'),(88,'plugin:neo','m221006_052456_add_group_child_block_types_column_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','beaa0c15-3e09-4e6e-9410-499e4198ba81'),(89,'plugin:neo','m221110_132322_add_ignore_permissions_to_block_types','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','0af5f4fb-c298-4b46-9afc-5502fb01984b'),(90,'plugin:neo','m221231_110307_add_block_type_icon_property','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','4ffe5bd2-5359-4c08-90dd-967122402bef'),(91,'plugin:neo','m230202_000653_convert_project_config_icon_data','2023-05-26 19:23:20','2023-05-26 19:23:20','2023-05-26 19:23:20','0ebf1bf5-bb37-4ff1-86d1-539884e2433a'),(92,'plugin:typedlinkfield','Install','2023-05-26 19:29:48','2023-05-26 19:29:48','2023-05-26 19:29:48','be27d85c-fdc6-40cf-9e63-c3e524243d75'),(93,'plugin:typedlinkfield','m190417_202153_migrateDataToTable','2023-05-26 19:29:48','2023-05-26 19:29:48','2023-05-26 19:29:48','57192cd5-29dc-4cde-8dde-b59ad27d2863'),(94,'plugin:seomatic','Install','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','e312331b-5078-4d1c-9e85-224e69442dfc'),(95,'plugin:seomatic','m180314_002755_field_type','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','078c806d-7108-4ddf-875f-2b5fc4c49398'),(96,'plugin:seomatic','m180314_002756_base_install','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','139d389d-30d9-437c-b738-fc4dce526474'),(97,'plugin:seomatic','m180502_202319_remove_field_metabundles','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','0d336fc5-7a0f-408d-beb8-a3c697cad36c'),(98,'plugin:seomatic','m180711_024947_commerce_products','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','99f8e671-76ed-4f1d-8490-4a8518ae6109'),(99,'plugin:seomatic','m190401_220828_longer_handles','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','1b5deb16-868a-4d2c-80d2-cc646a0e6ded'),(100,'plugin:seomatic','m190518_030221_calendar_events','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','ab960557-f2ce-4e07-8db3-8b905770b6fb'),(101,'plugin:seomatic','m200419_203444_add_type_id','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','7aefc2e0-1283-477a-a705-e790bf825803'),(102,'plugin:seomatic','m210603_213100_add_gql_schema_components','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','0e75451d-115f-431c-873a-c23c29830fc7'),(103,'plugin:seomatic','m210817_230853_announcement_v3_4','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','37d25dc8-d304-4248-ad28-ab003e0d65f7');
/*!40000 ALTER TABLE `chao_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_neoblocks`
--

LOCK TABLES `chao_neoblocks` WRITE;
/*!40000 ALTER TABLE `chao_neoblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_neoblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_neoblocks_owners`
--

LOCK TABLES `chao_neoblocks_owners` WRITE;
/*!40000 ALTER TABLE `chao_neoblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_neoblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_neoblockstructures`
--

LOCK TABLES `chao_neoblockstructures` WRITE;
/*!40000 ALTER TABLE `chao_neoblockstructures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_neoblocktypegroups`
--

LOCK TABLES `chao_neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `chao_neoblocktypegroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_neoblocktypes`
--

LOCK TABLES `chao_neoblocktypes` WRITE;
/*!40000 ALTER TABLE `chao_neoblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_neoblocktypes` VALUES (1,14,5,NULL,'Sample','sample','',NULL,1,0,0,0,0,0,0,1,NULL,1,1,1,'[]','2023-05-30 15:41:34','2023-05-30 15:41:34','d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701');
/*!40000 ALTER TABLE `chao_neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_plugins`
--

LOCK TABLES `chao_plugins` WRITE;
/*!40000 ALTER TABLE `chao_plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_plugins` VALUES (1,'aws-s3','2.0.3','2.0','2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-26 19:23:05','9bad1be8-ebe1-4007-9060-fdd0433a062f'),(2,'cp-field-inspect','1.4.4','1.0.0','2023-05-26 19:23:06','2023-05-26 19:23:06','2023-05-26 19:23:06','f2c701b6-1128-4752-adf7-f4ce73430eed'),(3,'postmark','3.0.0','2.0.1','2023-05-26 19:23:06','2023-05-26 19:23:06','2023-05-26 19:23:06','f1896eb5-cdf3-4c34-a3a9-0b02abe12b3c'),(4,'redactor','3.0.4','2.3.0','2023-05-26 19:23:07','2023-05-26 19:23:07','2023-05-26 19:23:07','6b06f403-bdde-4610-9baa-1c1da5ca30b6'),(5,'vite','4.0.5','1.0.0','2023-05-26 19:23:07','2023-05-26 19:23:07','2023-05-26 19:23:07','67b3e2b0-2cc2-4902-a519-e5c0c2b3f5c2'),(6,'knock-knock','2.0.8','1.1.1','2023-05-26 19:23:08','2023-05-26 19:23:08','2023-05-26 19:23:08','3a979191-b6a7-4ea2-b6d4-cbfe9517ae6e'),(7,'feed-me','5.1.3.1','5.1.0.0','2023-05-26 19:23:09','2023-05-26 19:23:09','2023-05-26 19:23:09','6e63c930-6f28-45b9-ab43-cb0c45638533'),(8,'sprig','2.6.2','1.0.1','2023-05-26 19:23:09','2023-05-26 19:23:09','2023-05-26 19:23:09','3d5a29b7-3728-45c8-8c0b-bcfea16b39ec'),(9,'empty-coalesce','4.0.0','1.0.0','2023-05-26 19:23:10','2023-05-26 19:23:10','2023-05-26 19:23:10','abf09c7c-e3dd-49bd-a385-00c5307e86c7'),(10,'secrets','2.0.0','1.0.0','2023-05-26 19:23:10','2023-05-26 19:23:10','2023-05-26 19:23:10','f84d7983-6cff-4c9a-964e-60466ffd38bc'),(11,'minify','4.0.0-beta.2','1.0.0','2023-05-26 19:23:11','2023-05-26 19:23:11','2023-05-26 19:23:11','652df646-d5cb-48b9-bd8f-ea0cef0221f6'),(12,'eager-beaver','4.0.2','1.0.0','2023-05-26 19:23:11','2023-05-26 19:23:11','2023-05-26 19:23:11','c6d8f9c7-4f78-4947-9efa-94a26f922928'),(13,'formie','2.0.29','2.0.10','2023-05-26 19:23:12','2023-05-26 19:23:12','2023-05-26 19:23:12','dd91c132-028e-4fa3-925c-a454833310dd'),(14,'blitz','4.4.5','4.4.0','2023-05-26 19:23:16','2023-05-26 19:23:16','2023-05-26 19:23:16','0596a2d2-a9c6-47da-ba0c-1b9d9e8bdd34'),(15,'image-optimize','4.0.5','1.0.0','2023-05-26 19:23:17','2023-05-26 19:23:17','2023-05-26 19:23:17','f55cf8ce-5064-4d45-a189-6c8b158ca89f'),(16,'retour','4.1.12','3.0.11','2023-05-26 19:23:18','2023-05-26 19:23:18','2023-05-26 19:23:18','d65782ec-f4f3-4734-9dc4-dee70851565c'),(17,'neo','3.7.9','3.6.2','2023-05-26 19:23:19','2023-05-26 19:23:19','2023-05-26 19:23:19','5d0b2223-1e77-4344-be96-b94f5bfb9d1f'),(18,'typedlinkfield','2.1.5','2.0.0','2023-05-26 19:29:48','2023-05-26 19:29:48','2023-05-26 19:29:48','5abdadde-55ca-4814-b557-9781479856ba'),(19,'typogrify','4.0.1','1.0.0','2023-05-26 19:35:38','2023-05-26 19:35:38','2023-05-26 19:35:38','452fcaeb-de50-4b4b-84c4-0d2c112ae21a'),(20,'fastcgi-cache-bust','4.0.0','1.0.0','2023-05-26 19:35:40','2023-05-26 19:35:40','2023-05-26 19:35:40','7ef8f06a-9220-4bf0-9258-1fb187eed5e4'),(21,'environment-label','4.0.3','1.0.0','2023-05-26 19:35:43','2023-05-26 19:35:43','2023-05-26 19:35:43','1a4831ca-a628-4c2e-9fea-82cb21702273'),(22,'async-queue','3.1.0','1.0.0','2023-05-26 19:35:45','2023-05-26 19:35:45','2023-05-26 19:35:45','9c58fa95-2911-4616-8d5a-95809614e85b'),(23,'cookies','4.0.0','1.0.0','2023-05-26 19:35:47','2023-05-26 19:35:47','2023-05-26 19:35:47','a8747d34-741e-400d-8ea6-9a3b60e7d335'),(24,'seomatic','4.0.25','3.0.11','2023-05-26 19:35:50','2023-05-26 19:35:50','2023-05-26 19:35:50','7da3f0dd-891c-42a1-a623-fe28186d4af6'),(25,'imager-x','4.1.13','4.0.0','2023-05-26 22:59:40','2023-05-26 22:59:40','2023-05-26 22:59:40','fef2915f-9c39-463d-9be0-00c2b965f72d'),(26,'retcon','2.6.1','1.0.0','2023-05-27 04:29:49','2023-05-27 04:29:49','2023-05-27 04:29:49','207979e9-dbae-4e86-b982-2875c9634d1e'),(27,'field-manager','3.0.6','1.0.0','2023-05-29 20:05:06','2023-05-29 20:05:06','2023-05-29 20:05:06','825903ca-0675-43a7-ba3e-c6ce8a5d85ec');
/*!40000 ALTER TABLE `chao_plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_projectconfig`
--

LOCK TABLES `chao_projectconfig` WRITE;
/*!40000 ALTER TABLE `chao_projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_projectconfig` VALUES ('dateModified','1685473447'),('email.fromEmail','\"dev@vessul.co\"'),('email.fromName','\"Chaos\"'),('email.replyToEmail','null'),('email.template','null'),('email.transportSettings.messageStream','\"\"'),('email.transportSettings.token','\"$POSTMARK_API\"'),('email.transportType','\"craftcms\\\\postmark\\\\Adapter\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elementCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.autocomplete','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.autocorrect','true'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.class','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.disabled','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.elementCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.id','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.instructions','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.label','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.max','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.min','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.name','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.orientation','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.placeholder','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.readonly','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.requirable','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.size','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.step','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.tip','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.title','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.uid','\"92f573e7-ccb2-4b76-8890-e53d5685a413\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.userCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.warning','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.0.width','100'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.elementCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.fieldUid','\"08795a71-347e-4b91-9b63-9620d51c49f2\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.instructions','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.label','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.required','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.tip','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.uid','\"78f88a76-f236-4c1c-93ff-de52db168887\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.userCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.warning','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.1.width','100'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.elementCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.fieldUid','\"053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.instructions','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.label','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.required','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.tip','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.uid','\"b6d73ee9-c01a-4459-bd62-29974bff27bc\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.userCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.warning','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.2.width','100'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.elementCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.fieldUid','\"17caad41-44ec-487f-a9e5-0dc89d3803d4\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.instructions','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.label','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.required','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.tip','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.uid','\"05880fc4-c88b-4f31-9397-c55aa70de265\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.userCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.warning','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.elements.3.width','100'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.name','\"Content\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.uid','\"b14cba5a-bd84-43a5-a626-8593742b0b16\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.fieldLayouts.a856faa4-6964-4b5b-9689-1a623e83f0d1.tabs.0.userCondition','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.handle','\"index\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.hasTitleField','false'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.name','\"Index\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.section','\"cacf9851-daaf-4115-bd89-35d61982362a\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.sortOrder','1'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.titleFormat','\"{section.name|raw}\"'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.titleTranslationKeyFormat','null'),('entryTypes.a2c1a242-e2c4-4102-882d-20fdf12839db.titleTranslationMethod','\"site\"'),('fieldGroups.7c150880-028e-4d63-9a75-05ebf5149115.name','\"Comon\"'),('fieldGroups.95025c1d-db15-4404-b654-f0f0f31f236e.name','\"Common\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.columnSuffix','\"zoefnqni\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.contentColumnType','\"text\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.fieldGroup','\"95025c1d-db15-4404-b654-f0f0f31f236e\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.handle','\"optimizationExample\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.instructions','null'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.name','\"Optimization Example\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.searchable','false'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.displayDominantColorPalette','false'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.displayLazyLoadPlaceholderImages','true'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.displayOptimizedImageVariants','true'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.fieldVolumeSettings.__assoc__.0.0','\"pictures\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.fieldVolumeSettings.__assoc__.0.1','\"*\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.ignoreFilesOfType.0','\"image/svg\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.ignoreFilesOfType.1','\"image/gif\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.0.0','\"width\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.0.1','\"1200\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.1.0','\"useAspectRatio\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.1.1','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.2.0','\"aspectRatioX\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.2.1','\"16\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.3.0','\"aspectRatioY\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.3.1','\"9\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.4.0','\"retinaSizes\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.4.1.0','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.4.1.1','\"2\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.5.0','\"quality\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.5.1','\"82\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.6.0','\"format\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.0.__assoc__.6.1','\"jpg\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.0.0','\"width\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.0.1','\"992\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.1.0','\"useAspectRatio\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.1.1','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.2.0','\"aspectRatioX\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.2.1','\"16\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.3.0','\"aspectRatioY\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.3.1','\"9\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.4.0','\"retinaSizes\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.4.1.0','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.5.0','\"quality\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.5.1','\"82\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.6.0','\"format\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.1.__assoc__.6.1','\"jpg\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.0.0','\"width\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.0.1','\"768\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.1.0','\"useAspectRatio\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.1.1','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.2.0','\"aspectRatioX\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.2.1','\"4\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.3.0','\"aspectRatioY\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.3.1','\"3\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.4.0','\"retinaSizes\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.4.1.0','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.5.0','\"quality\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.5.1','\"60\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.6.0','\"format\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.2.__assoc__.6.1','\"jpg\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.0.0','\"width\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.0.1','\"576\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.1.0','\"useAspectRatio\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.1.1','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.2.0','\"aspectRatioX\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.2.1','\"4\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.3.0','\"aspectRatioY\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.3.1','\"3\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.4.0','\"retinaSizes\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.4.1.0','\"1\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.5.0','\"quality\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.5.1','\"60\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.6.0','\"format\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.settings.variants.3.__assoc__.6.1','\"jpg\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.translationKeyFormat','null'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.translationMethod','\"none\"'),('fields.03403fb7-efce-4256-ae24-2a81dbbf421b.type','\"nystudio107\\\\imageoptimize\\\\fields\\\\OptimizedImages\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.columnSuffix','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.contentColumnType','\"string\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.fieldGroup','\"95025c1d-db15-4404-b654-f0f0f31f236e\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.handle','\"images\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.instructions','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.name','\"Images\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.searchable','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.allowedKinds','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.allowSelfRelations','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.allowSubfolders','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.allowUploads','true'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.branchLimit','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.defaultUploadLocationSource','\"volume:47d85af7-a58a-401a-91ac-8a7e694423d2\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.defaultUploadLocationSubpath','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.localizeRelations','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.maintainHierarchy','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.maxRelations','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.minRelations','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.previewMode','\"full\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.restrictedDefaultUploadSubpath','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.restrictedLocationSource','\"volume:47d85af7-a58a-401a-91ac-8a7e694423d2\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.restrictedLocationSubpath','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.restrictFiles','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.restrictLocation','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.selectionLabel','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.showSiteMenu','true'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.showUnpermittedFiles','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.showUnpermittedVolumes','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.sources','\"*\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.targetSiteId','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.validateRelatedElements','false'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.settings.viewMode','\"list\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.translationKeyFormat','null'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.translationMethod','\"site\"'),('fields.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b.type','\"craft\\\\fields\\\\Assets\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.columnSuffix','\"fuvqzowc\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.contentColumnType','\"text\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.fieldGroup','\"95025c1d-db15-4404-b654-f0f0f31f236e\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.handle','\"sampleField\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.instructions','null'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.name','\"Sample Field\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.searchable','false'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.byteLimit','null'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.charLimit','null'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.code','false'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.columnType','null'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.initialRows','4'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.multiline','false'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.placeholder','null'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.settings.uiMode','\"normal\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.translationKeyFormat','null'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.translationMethod','\"none\"'),('fields.08795a71-347e-4b91-9b63-9620d51c49f2.type','\"craft\\\\fields\\\\PlainText\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.columnSuffix','null'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.contentColumnType','\"string\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.fieldGroup','\"7c150880-028e-4d63-9a75-05ebf5149115\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.handle','\"popupDialogBox\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.instructions','null'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.name','\"Popup Dialog Box\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.searchable','false'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.settings.contentTable','\"{{%matrixcontent_popupdialogbox}}\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.settings.maxBlocks','null'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.settings.minBlocks','null'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.settings.propagationKeyFormat','null'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.settings.propagationMethod','\"all\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.translationKeyFormat','null'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.translationMethod','\"site\"'),('fields.17caad41-44ec-487f-a9e5-0dc89d3803d4.type','\"craft\\\\fields\\\\Matrix\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.columnSuffix','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.contentColumnType','\"string\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.fieldGroup','\"95025c1d-db15-4404-b654-f0f0f31f236e\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.handle','\"builder\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.instructions','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.name','\"Builder\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.searchable','false'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.maxBlocks','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.maxLevels','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.maxTopBlocks','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.minBlocks','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.minLevels','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.minTopBlocks','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.propagationKeyFormat','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.settings.propagationMethod','\"all\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.translationKeyFormat','null'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.translationMethod','\"site\"'),('fields.d181b219-295a-4226-9aeb-6b57d5c1fee9.type','\"benf\\\\neo\\\\Field\"'),('formie.statuses.9aa25dcc-fd5c-4735-968b-0f5016abcc67.color','\"green\"'),('formie.statuses.9aa25dcc-fd5c-4735-968b-0f5016abcc67.description','null'),('formie.statuses.9aa25dcc-fd5c-4735-968b-0f5016abcc67.handle','\"new\"'),('formie.statuses.9aa25dcc-fd5c-4735-968b-0f5016abcc67.isDefault','true'),('formie.statuses.9aa25dcc-fd5c-4735-968b-0f5016abcc67.name','\"New\"'),('formie.statuses.9aa25dcc-fd5c-4735-968b-0f5016abcc67.sortOrder','1'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.dataRetention','\"forever\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.dataRetentionValue','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.fileUploadsAction','\"retain\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.attachFiles','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.attachPdf','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.bcc','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.cc','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.conditions','\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.enableConditions','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.enabled','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.formId','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.from','\"{field.emailAddress}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.fromName','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.id','\"new981-8077\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.name','\"Admin Notification\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.pdfTemplateId','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.recipients','\"email\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.replyTo','\"{field.emailAddress}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.replyToName','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.subject','\"A new submission was made on \\\"{formName}\\\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.templateId','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.to','\"{systemEmail}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.toConditions','\"{\\\"toRecipients\\\":[]}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.0.uid','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.attachFiles','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.attachPdf','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.bcc','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.cc','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.conditions','\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.enableConditions','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.enabled','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.formId','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.from','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.fromName','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.id','\"new7052-5168\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.name','\"User Notification\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.pdfTemplateId','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.recipients','\"email\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.replyTo','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.replyToName','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.subject','\"Thanks for contacting us!\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.templateId','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.to','\"{field.emailAddress}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.toConditions','\"{\\\"toRecipients\\\":[]}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.notifications.1.uid','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.id','\"new1272610411\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.label','\"Page 1\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.notificationFlag','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.brandNewField','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.handle','\"yourName\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.hasLabel','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.id','\"new7715-7348\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.label','\"Your Name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.conditions','\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.firstNameCollapsed','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.firstNameDefaultValue','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.firstNameEnabled','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.firstNameLabel','\"First Name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.firstNamePlaceholder','\"e.g. Peter\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.firstNameRequired','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.handle','\"yourName\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.instructions','\"Please enter your full name.\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.instructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.label','\"Your Name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.labelPosition','\"verbb\\\\formie\\\\positions\\\\Hidden\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.lastNameCollapsed','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.lastNameDefaultValue','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.lastNameEnabled','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.lastNameLabel','\"Last Name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.lastNamePlaceholder','\"e.g. Sherman\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.lastNameRequired','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.maxType','\"characters\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.middleNameCollapsed','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.middleNameDefaultValue','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.middleNameEnabled','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.middleNameLabel','\"Middle Name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.placeholder','\"Your name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.prefixCollapsed','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.prefixDefaultValue','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.prefixEnabled','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.prefixLabel','\"Prefix\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.subfieldLabelPosition','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.useMultipleFields','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.settings.visibility','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.0.id','\"new8990-9934\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.brandNewField','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.handle','\"emailAddress\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.hasLabel','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.id','\"new6482-9528\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.label','\"Email Address\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.handle','\"emailAddress\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.instructions','\"Please enter your email so we can get in touch.\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.instructionsPosition','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.label','\"Email Address\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.labelPosition','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.maxType','\"characters\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.placeholder','\"e.g. psherman@wallaby.com\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.settings.required','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.1.id','\"new9524-8509\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.brandNewField','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.handle','\"message\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.hasLabel','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.id','\"new982-7322\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.label','\"Message\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.conditions','\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.handle','\"message\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.instructions','\"Please enter your comments.\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.instructionsPosition','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.label','\"Message\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.labelPosition','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.maxType','\"characters\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.placeholder','\"e.g. The reason for my enquiry is...\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.required','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.settings.visibility','\"\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.rows.2.id','\"new2177-9685\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.settings.backButtonLabel','\"Back\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.settings.buttonsPosition','\"left\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.settings.label','\"Page 1\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.settings.showBackButton','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.settings.submitButtonLabel','\"Contact us\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.pages.0.sortOrder','0'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.collectIp','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.collectUser','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.dataRetention','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.dataRetentionValue','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.defaultEmailTemplateId','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.defaultInstructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.defaultLabelPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.disableCaptchas','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.displayCurrentPageTitle','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.displayFormTitle','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.displayPageProgress','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.displayPageTabs','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.errorMessage.0.content.0.text','\"Couldn’t save submission due to errors.\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.errorMessage.0.content.0.type','\"text\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.errorMessage.0.type','\"paragraph\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.errorMessagePosition','\"top-form\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.fileUploadsAction','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.limitSubmissions','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.limitSubmissionsMessage','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.limitSubmissionsNumber','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.limitSubmissionsType','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.loadingIndicator','\"spinner\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.loadingIndicatorText','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.progressPosition','\"end\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.redirectUrl','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.requireUser','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.requireUserMessage','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.scheduleForm','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.scheduleFormEnd','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.scheduleFormExpiredMessage','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.scheduleFormPendingMessage','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.scheduleFormStart','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.scrollToTop','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submissionTitleFormat','\"{timestamp}\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitAction','\"message\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionFormHide','false'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionMessage.0.content.0.text','\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionMessage.0.content.0.type','\"text\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionMessage.0.type','\"paragraph\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionMessagePosition','\"top-form\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionMessageTimeout','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionTab','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitActionUrl','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.submitMethod','\"ajax\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.validationOnFocus','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.settings.validationOnSubmit','true'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.data.userDeletedAction','\"retain\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.defaultStatus','\"9aa25dcc-fd5c-4735-968b-0f5016abcc67\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.handle','\"contactForm\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.name','\"Contact Form\"'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.submitActionEntry','null'),('formie.stencils.e510f893-335d-417c-8a0d-f610ac8068f2.template','null'),('fs.default.hasUrls','true'),('fs.default.name','\"Default\"'),('fs.default.settings.addSubfolderToRootUrl','true'),('fs.default.settings.autoFocalPoint','false'),('fs.default.settings.bucket','\"$S3_BUCKET\"'),('fs.default.settings.bucketSelectionMode','\"manual\"'),('fs.default.settings.cfDistributionId','\"$CLOUDFRONT_DISTRIBUTION_ID\"'),('fs.default.settings.cfPrefix','\"$CLOUDFRONT_PATH_PREFIX\"'),('fs.default.settings.expires','\"3 months\"'),('fs.default.settings.keyId','\"$S3_KEY_ID\"'),('fs.default.settings.makeUploadsPublic','false'),('fs.default.settings.region','\"$S3_REGION\"'),('fs.default.settings.secret','\"$S3_SECRET\"'),('fs.default.settings.storageClass','\"\"'),('fs.default.settings.subfolder','\"\"'),('fs.default.type','\"craft\\\\awss3\\\\Fs\"'),('fs.default.url','\"$S3_ASSET_URL\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.field','\"17caad41-44ec-487f-a9e5-0dc89d3803d4\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elementCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.fieldUid','\"3d0aee8c-c441-40fd-ac84-9167c9e2ef2e\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.label','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.required','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.tip','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.uid','\"80a0cb84-1c94-4e42-a913-e8b31c198a9b\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.warning','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.0.width','100'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.fieldUid','\"33256147-375b-4aaa-9f2a-1ee861454c19\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.label','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.required','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.tip','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.uid','\"36f31b3e-124f-4218-af2c-72d2b7b6293a\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.warning','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.1.width','100'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.elementCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.fieldUid','\"9b5d3535-78fa-436a-92b1-2863d6488288\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.label','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.required','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.tip','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.uid','\"8cfbdcf1-b0d3-452c-98d4-2186e4a488fb\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.userCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.warning','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.2.width','100'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.elementCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.fieldUid','\"96c4d8b1-e79a-462b-b993-39f3521d554d\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.label','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.required','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.tip','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.uid','\"d60e3fe3-3290-40fd-90f0-ffdd8a2d9fbc\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.userCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.warning','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.3.width','100'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.elementCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.fieldUid','\"a52e368d-3fc2-417f-ac29-682612b69713\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.label','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.required','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.tip','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.uid','\"baa12dfe-f1f0-4703-80a5-90993c7fd677\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.userCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.warning','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.elements.4.width','100'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.name','\"Content\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.uid','\"e91b5f93-afa3-4997-a1c5-455f2db9dcc9\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fieldLayouts.bb07d397-4b8e-4fc9-99e0-be6288197c9f.tabs.0.userCondition','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.columnSuffix','\"oduxeyyi\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.contentColumnType','\"text\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.fieldGroup','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.handle','\"overlayTitle\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.name','\"Overlay Title\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.searchable','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.byteLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.charLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.code','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.columnType','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.initialRows','4'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.multiline','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.placeholder','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.settings.uiMode','\"normal\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.translationKeyFormat','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.translationMethod','\"none\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.33256147-375b-4aaa-9f2a-1ee861454c19.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.columnSuffix','\"awchfgot\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.contentColumnType','\"text\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.fieldGroup','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.handle','\"buttonText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.name','\"Button Text\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.searchable','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.byteLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.charLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.code','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.columnType','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.initialRows','4'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.multiline','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.placeholder','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.settings.uiMode','\"normal\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.translationKeyFormat','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.translationMethod','\"none\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.columnSuffix','\"tcmzsmno\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.contentColumnType','\"text\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.fieldGroup','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.handle','\"overlayClose\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.name','\"Overlay Close\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.searchable','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.byteLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.charLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.code','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.columnType','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.initialRows','4'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.multiline','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.placeholder','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.settings.uiMode','\"normal\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.translationKeyFormat','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.translationMethod','\"none\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.96c4d8b1-e79a-462b-b993-39f3521d554d.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.columnSuffix','\"xvurjjyv\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.contentColumnType','\"text\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.fieldGroup','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.handle','\"overlayText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.name','\"OverlayText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.searchable','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.byteLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.charLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.code','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.columnType','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.initialRows','4'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.multiline','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.placeholder','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.settings.uiMode','\"normal\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.translationKeyFormat','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.translationMethod','\"none\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.9b5d3535-78fa-436a-92b1-2863d6488288.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.columnSuffix','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.contentColumnType','\"string\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.fieldGroup','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.handle','\"selectForm\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.instructions','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.name','\"Select Form\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.searchable','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.allowSelfRelations','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.branchLimit','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.localizeRelations','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.maintainHierarchy','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.maxRelations','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.minRelations','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.selectionLabel','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.showSiteMenu','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.sources','\"*\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.targetSiteId','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.validateRelatedElements','false'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.settings.viewMode','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.translationKeyFormat','null'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.translationMethod','\"site\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.fields.a52e368d-3fc2-417f-ac29-682612b69713.type','\"verbb\\\\formie\\\\fields\\\\Forms\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.handle','\"regular\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.name','\"Regular\"'),('matrixBlockTypes.52415a0c-7e5c-4900-978d-76aa5a03727e.sortOrder','1'),('meta.__names__.03403fb7-efce-4256-ae24-2a81dbbf421b','\"Optimization Example\"'),('meta.__names__.053ac3ae-ffd9-4c04-95fb-c2a2e9e08b5b','\"Images\"'),('meta.__names__.08795a71-347e-4b91-9b63-9620d51c49f2','\"Sample Field\"'),('meta.__names__.17caad41-44ec-487f-a9e5-0dc89d3803d4','\"Popup Dialog Box\"'),('meta.__names__.33256147-375b-4aaa-9f2a-1ee861454c19','\"Overlay Title\"'),('meta.__names__.3d0aee8c-c441-40fd-ac84-9167c9e2ef2e','\"Button Text\"'),('meta.__names__.47d85af7-a58a-401a-91ac-8a7e694423d2','\"Pictures\"'),('meta.__names__.52415a0c-7e5c-4900-978d-76aa5a03727e','\"Regular\"'),('meta.__names__.6a4a57fb-0f7d-4a85-99d6-b0e4be164cc4','\"Overlay Close\"'),('meta.__names__.7c150880-028e-4d63-9a75-05ebf5149115','\"Comon\"'),('meta.__names__.95025c1d-db15-4404-b654-f0f0f31f236e','\"Common\"'),('meta.__names__.96c4d8b1-e79a-462b-b993-39f3521d554d','\"Overlay Close\"'),('meta.__names__.9aa25dcc-fd5c-4735-968b-0f5016abcc67','\"New\"'),('meta.__names__.9b5d3535-78fa-436a-92b1-2863d6488288','\"OverlayText\"'),('meta.__names__.9f9592ec-68d6-4e1f-8271-6856523ea803','\"Button Text\"'),('meta.__names__.a2c1a242-e2c4-4102-882d-20fdf12839db','\"Index\"'),('meta.__names__.a38ec9c7-125f-402c-8e46-9b212b50ee85','\"Overlay Title\"'),('meta.__names__.a52e368d-3fc2-417f-ac29-682612b69713','\"Select Form\"'),('meta.__names__.abd4084c-0d61-4110-97b0-2f095d8c5445','\"Chaos\"'),('meta.__names__.ac935a13-bd0d-4769-82e5-9bea8ee2fbbc','\"OverlayText\"'),('meta.__names__.cacf9851-daaf-4115-bd89-35d61982362a','\"Index\"'),('meta.__names__.d181b219-295a-4226-9aeb-6b57d5c1fee9','\"Builder\"'),('meta.__names__.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701','\"Sample\"'),('meta.__names__.e510f893-335d-417c-8a0d-f610ac8068f2','\"Contact Form\"'),('meta.__names__.f1481cac-5f13-4cba-8a68-d16b7839a08b','\"Chaos\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.childBlocks','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.conditions','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.description','\"\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.enabled','true'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.field','\"d181b219-295a-4226-9aeb-6b57d5c1fee9\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elementCondition','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.elementCondition','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.fieldUid','\"17caad41-44ec-487f-a9e5-0dc89d3803d4\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.instructions','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.label','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.required','false'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.tip','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.uid','\"5882bcfa-518c-4611-95e5-dc683ec1c152\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.userCondition','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.warning','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.elements.0.width','100'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.name','\"tab\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.uid','\"74c03d21-20f9-4af9-8f8c-c6cd5add63c2\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.fieldLayouts.1b77b419-c14b-4214-8f82-10fe11546ce6.tabs.0.userCondition','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.group','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.groupChildBlockTypes','true'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.handle','\"sample\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.icon','null'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.ignorePermissions','true'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.maxBlocks','0'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.maxChildBlocks','0'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.maxSiblingBlocks','0'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.minBlocks','0'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.minChildBlocks','0'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.minSiblingBlocks','0'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.name','\"Sample\"'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.sortOrder','1'),('neoBlockTypes.d6a8ca5c-1dcb-4f1f-a3f3-24cf52ae8701.topLevel','true'),('plugins.async-queue.edition','\"standard\"'),('plugins.async-queue.enabled','true'),('plugins.async-queue.schemaVersion','\"1.0.0\"'),('plugins.aws-s3.edition','\"standard\"'),('plugins.aws-s3.enabled','true'),('plugins.aws-s3.schemaVersion','\"2.0\"'),('plugins.blitz.edition','\"standard\"'),('plugins.blitz.enabled','true'),('plugins.blitz.licenseKey','\"Y6KF0L5NMOPONV3PFPJJJY7F\"'),('plugins.blitz.schemaVersion','\"4.4.0\"'),('plugins.blitz.settings.apiKey','\"\"'),('plugins.blitz.settings.cacheControlHeader','\"public, s-maxage=31536000, max-age=0\"'),('plugins.blitz.settings.cacheDuration','600000'),('plugins.blitz.settings.cacheElementQueries','true'),('plugins.blitz.settings.cacheElements','true'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.0.0','\"concurrency\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.0.1','\"3\"'),('plugins.blitz.settings.cacheGeneratorType','\"putyourlightson\\\\blitz\\\\drivers\\\\generators\\\\HttpGenerator\"'),('plugins.blitz.settings.cacheNonHtmlResponses','false'),('plugins.blitz.settings.cachePurgerType','\"putyourlightson\\\\blitz\\\\drivers\\\\purgers\\\\DummyPurger\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.0.0','\"folderPath\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.0.1','\"@webroot/cache/blitz\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.1.0','\"createGzipFiles\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.1.1','\"\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.2.0','\"createBrotliFiles\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.2.1','\"\"'),('plugins.blitz.settings.cacheStorageType','\"putyourlightson\\\\blitz\\\\drivers\\\\storage\\\\FileStorage\"'),('plugins.blitz.settings.cachingEnabled','false'),('plugins.blitz.settings.debug','false'),('plugins.blitz.settings.deployerType','\"putyourlightson\\\\blitz\\\\drivers\\\\deployers\\\\DummyDeployer\"'),('plugins.blitz.settings.driverJobPriority','100'),('plugins.blitz.settings.esiEnabled','false'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.0.0','\"queryStringParam\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.0.1','\"gclid\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.0.0','\"queryStringParam\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.0.1','\"fbclid\"'),('plugins.blitz.settings.generatePagesWithQueryStringParams','true'),('plugins.blitz.settings.hintsEnabled','true'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.0.0','\"queryStringParam\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.0.1','\".*\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.0.0','\"uriPattern\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.0.1','\"\"'),('plugins.blitz.settings.includedUriPatterns.1.__assoc__.0.0','\"uriPattern\"'),('plugins.blitz.settings.includedUriPatterns.1.__assoc__.0.1','\".\"'),('plugins.blitz.settings.injectScriptEvent','\"DOMContentLoaded\"'),('plugins.blitz.settings.integrations.0','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\CommerceIntegration\"'),('plugins.blitz.settings.integrations.1','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\FeedMeIntegration\"'),('plugins.blitz.settings.integrations.2','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\SeomaticIntegration\"'),('plugins.blitz.settings.maxRetryAttempts','10'),('plugins.blitz.settings.mutexTimeout','1'),('plugins.blitz.settings.outputComments','true'),('plugins.blitz.settings.purgeAssetImagesWhenChanged','true'),('plugins.blitz.settings.queryStringCaching','1'),('plugins.blitz.settings.queueJobTtr','300'),('plugins.blitz.settings.refreshCacheAutomaticallyForGlobals','true'),('plugins.blitz.settings.refreshCacheJobPriority','10'),('plugins.blitz.settings.refreshCacheWhenElementMovedInStructure','true'),('plugins.blitz.settings.refreshCacheWhenElementSavedNotLive','false'),('plugins.blitz.settings.refreshCacheWhenElementSavedUnchanged','false'),('plugins.blitz.settings.refreshMode','3'),('plugins.blitz.settings.sendPoweredByHeader','true'),('plugins.blitz.settings.ssiEnabled','true'),('plugins.blitz.settings.trackElementQueries','true'),('plugins.blitz.settings.trackElements','true'),('plugins.cookies.edition','\"standard\"'),('plugins.cookies.enabled','true'),('plugins.cookies.schemaVersion','\"1.0.0\"'),('plugins.cp-field-inspect.edition','\"standard\"'),('plugins.cp-field-inspect.enabled','true'),('plugins.cp-field-inspect.schemaVersion','\"1.0.0\"'),('plugins.eager-beaver.edition','\"standard\"'),('plugins.eager-beaver.enabled','true'),('plugins.eager-beaver.schemaVersion','\"1.0.0\"'),('plugins.empty-coalesce.edition','\"standard\"'),('plugins.empty-coalesce.enabled','true'),('plugins.empty-coalesce.schemaVersion','\"1.0.0\"'),('plugins.environment-label.edition','\"standard\"'),('plugins.environment-label.enabled','true'),('plugins.environment-label.schemaVersion','\"1.0.0\"'),('plugins.fastcgi-cache-bust.edition','\"standard\"'),('plugins.fastcgi-cache-bust.enabled','true'),('plugins.fastcgi-cache-bust.schemaVersion','\"1.0.0\"'),('plugins.feed-me.edition','\"standard\"'),('plugins.feed-me.enabled','true'),('plugins.feed-me.schemaVersion','\"5.1.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.formie.edition','\"standard\"'),('plugins.formie.enabled','true'),('plugins.formie.licenseKey','\"U9II5S4B4ST0H8ZC44BTQF7U\"'),('plugins.formie.schemaVersion','\"2.0.10\"'),('plugins.formie.settings.ajaxTimeout','10'),('plugins.formie.settings.captchas.__assoc__.0.0','\"recaptcha\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\Recaptcha\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.1.1','\"1\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.0.1','\"recaptcha\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.1.0','\"secretKey\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.1.1','\"$GOOGLE_SECRET_KEY\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.10.0','\"scriptLoadingMethod\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.10.1','\"asyncDefer\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.2.0','\"siteKey\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.2.1','\"$GOOGLE_SITE_KEY\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.3.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.3.1','\"v3\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.4.0','\"size\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.4.1','\"normal\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.5.0','\"theme\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.5.1','\"light\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.6.0','\"badge\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.6.1','\"bottomright\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.7.0','\"language\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.7.1','\"en\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.8.0','\"minScore\"'),('plugins.formie.settings.captchas.__assoc__.0.1.__assoc__.3.1.__assoc__.8.1','0.5'),('plugins.formie.settings.captchas.__assoc__.1.0','\"hcaptcha\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\Hcaptcha\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.1.1','\"0\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.0.1','\"hcaptcha\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.3.0','\"size\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.3.1','\"normal\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.4.0','\"theme\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.4.1','\"light\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.5.0','\"language\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.5.1','\"en\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.6.0','\"minScore\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.6.1','0.5'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.7.0','\"scriptLoadingMethod\"'),('plugins.formie.settings.captchas.__assoc__.1.1.__assoc__.3.1.__assoc__.7.1','\"asyncDefer\"'),('plugins.formie.settings.captchas.__assoc__.2.0','\"friendlyCaptcha\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\FriendlyCaptcha\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.1.1','\"0\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.2.1.__assoc__.3.1.__assoc__.0.1','\"friendlyCaptcha\"'),('plugins.formie.settings.captchas.__assoc__.3.0','\"turnstile\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\Turnstile\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.1.1','\"0\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.3.1.__assoc__.0.1','\"turnstile\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.3.1.__assoc__.3.0','\"scriptLoadingMethod\"'),('plugins.formie.settings.captchas.__assoc__.3.1.__assoc__.3.1.__assoc__.3.1','\"asyncDefer\"'),('plugins.formie.settings.captchas.__assoc__.4.0','\"duplicate\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\Duplicate\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.1.1','\"1\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.4.1.__assoc__.3.1.__assoc__.0.1','\"duplicate\"'),('plugins.formie.settings.captchas.__assoc__.5.0','\"honeypot\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\Honeypot\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.1.1','\"1\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.5.1.__assoc__.3.1.__assoc__.0.1','\"honeypot\"'),('plugins.formie.settings.captchas.__assoc__.6.0','\"javascript\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.0.0','\"type\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.0.1','\"verbb\\\\formie\\\\integrations\\\\captchas\\\\Javascript\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.1.0','\"enabled\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.1.1','\"0\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.2.0','\"saveSpam\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.2.1','true'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.3.0','\"settings\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.3.1.__assoc__.0.0','\"handle\"'),('plugins.formie.settings.captchas.__assoc__.6.1.__assoc__.3.1.__assoc__.0.1','\"javascript\"'),('plugins.formie.settings.defaultDateDisplayType','\"\"'),('plugins.formie.settings.defaultDateTime','null'),('plugins.formie.settings.defaultDateValueOption','\"\"'),('plugins.formie.settings.defaultEmailTemplate','\"\"'),('plugins.formie.settings.defaultFileUploadVolume','\"\"'),('plugins.formie.settings.defaultFormTemplate','\"\"'),('plugins.formie.settings.defaultInstructionsPosition','\"below-input\"'),('plugins.formie.settings.defaultLabelPosition','\"above-input\"'),('plugins.formie.settings.defaultPage','\"submissions\"'),('plugins.formie.settings.emptyValuePlaceholder','\"No response.\"'),('plugins.formie.settings.enableBackSubmission','true'),('plugins.formie.settings.enableCsrfValidationForGuests','true'),('plugins.formie.settings.enableLargeFieldStorage','false'),('plugins.formie.settings.enableUnloadWarning','false'),('plugins.formie.settings.includeDraftElementUsage','false'),('plugins.formie.settings.includeRevisionElementUsage','false'),('plugins.formie.settings.maxIncompleteSubmissionAge','30'),('plugins.formie.settings.maxSentNotificationsAge','30'),('plugins.formie.settings.pdfPaperOrientation','\"portrait\"'),('plugins.formie.settings.pdfPaperSize','\"letter\"'),('plugins.formie.settings.pluginName','\"Forms\"'),('plugins.formie.settings.queuePriority','null'),('plugins.formie.settings.saveSpam','true'),('plugins.formie.settings.sendEmailAlerts','false'),('plugins.formie.settings.sentNotifications','true'),('plugins.formie.settings.spamBehaviour','\"showSuccess\"'),('plugins.formie.settings.spamBehaviourMessage','\"\"'),('plugins.formie.settings.spamEmailNotifications','false'),('plugins.formie.settings.spamKeywords','\"\"'),('plugins.formie.settings.spamLimit','500'),('plugins.formie.settings.useQueueForIntegrations','true'),('plugins.formie.settings.useQueueForNotifications','true'),('plugins.image-optimize.edition','\"standard\"'),('plugins.image-optimize.enabled','true'),('plugins.image-optimize.licenseKey','\"NCA57HE5U6O7IHKQTWM8R2NG\"'),('plugins.image-optimize.schemaVersion','\"1.0.0\"'),('plugins.image-optimize.settings.allowUpScaledImageVariants','false'),('plugins.image-optimize.settings.assetVolumeSubFolders','true'),('plugins.image-optimize.settings.autoSharpenScaledImages','true'),('plugins.image-optimize.settings.capSilhouetteSvgSize','true'),('plugins.image-optimize.settings.createColorPalette','true'),('plugins.image-optimize.settings.createPlaceholderSilhouettes','false'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.0','\"nystudio107\\\\imageoptimizeimgix\\\\imagetransforms\\\\ImgixImageTransform\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.0.0','\"domain\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.0.1','\"\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.1.0','\"apiKey\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.2.0','\"securityToken\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.3.0','\"unsharpMask\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.0.1.__assoc__.3.1','\"20\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.1.0','\"nystudio107\\\\imageoptimizesharp\\\\imagetransforms\\\\SharpImageTransform\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.1.1.__assoc__.0.0','\"baseUrl\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.1.1.__assoc__.0.1','\"$IMAGE_TRANSFORM_URL\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.0','\"nystudio107\\\\imageoptimizethumbor\\\\imagetransforms\\\\ThumborImageTransform\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.1.__assoc__.0.0','\"baseUrl\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.1.__assoc__.0.1','\"\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.1.__assoc__.1.0','\"securityKey\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.1.__assoc__.1.1','\"\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.1.__assoc__.2.0','\"includeBucketPrefix\"'),('plugins.image-optimize.settings.imageTransformTypeSettings.__assoc__.2.1.__assoc__.2.1','\"\"'),('plugins.image-optimize.settings.lowerQualityRetinaImageVariants','true'),('plugins.image-optimize.settings.sharpenScaledImagePercentage','50'),('plugins.image-optimize.settings.transformClass','\"nystudio107\\\\imageoptimizesharp\\\\imagetransforms\\\\SharpImageTransform\"'),('plugins.imager-x.edition','\"pro\"'),('plugins.imager-x.enabled','true'),('plugins.imager-x.licenseKey','\"BBKWCOJHCG7249KELKMSDHFY\"'),('plugins.imager-x.schemaVersion','\"4.0.0\"'),('plugins.knock-knock.edition','\"standard\"'),('plugins.knock-knock.enabled','true'),('plugins.knock-knock.schemaVersion','\"1.1.1\"'),('plugins.minify.edition','\"standard\"'),('plugins.minify.enabled','true'),('plugins.minify.schemaVersion','\"1.0.0\"'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"8CRSQUW080EQ22BDZYTR4T4B\"'),('plugins.neo.schemaVersion','\"3.6.2\"'),('plugins.postmark.edition','\"standard\"'),('plugins.postmark.enabled','true'),('plugins.postmark.schemaVersion','\"2.0.1\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.retcon.edition','\"standard\"'),('plugins.retcon.enabled','true'),('plugins.retcon.schemaVersion','\"1.0.0\"'),('plugins.retour.edition','\"standard\"'),('plugins.retour.enabled','true'),('plugins.retour.licenseKey','\"NCWHZYOH2AUZ40RMW7NO2OAY\"'),('plugins.retour.schemaVersion','\"3.0.11\"'),('plugins.secrets.edition','\"standard\"'),('plugins.secrets.enabled','true'),('plugins.secrets.schemaVersion','\"1.0.0\"'),('plugins.seomatic.edition','\"standard\"'),('plugins.seomatic.enabled','true'),('plugins.seomatic.licenseKey','\"6ZAJRTOJN3HOBK3VUV2WKWXA\"'),('plugins.seomatic.schemaVersion','\"3.0.11\"'),('plugins.sprig.edition','\"standard\"'),('plugins.sprig.enabled','true'),('plugins.sprig.schemaVersion','\"1.0.1\"'),('plugins.typedlinkfield.edition','\"standard\"'),('plugins.typedlinkfield.enabled','true'),('plugins.typedlinkfield.schemaVersion','\"2.0.0\"'),('plugins.typogrify.edition','\"standard\"'),('plugins.typogrify.enabled','true'),('plugins.typogrify.schemaVersion','\"1.0.0\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.defaultPlacement','\"end\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.enableVersioning','true'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.handle','\"index\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.name','\"Index\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.propagationMethod','\"all\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.siteSettings.abd4084c-0d61-4110-97b0-2f095d8c5445.enabledByDefault','true'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.siteSettings.abd4084c-0d61-4110-97b0-2f095d8c5445.hasUrls','true'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.siteSettings.abd4084c-0d61-4110-97b0-2f095d8c5445.template','\"index.twig\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.siteSettings.abd4084c-0d61-4110-97b0-2f095d8c5445.uriFormat','\"__home__\"'),('sections.cacf9851-daaf-4115-bd89-35d61982362a.type','\"single\"'),('siteGroups.f1481cac-5f13-4cba-8a68-d16b7839a08b.name','\"Chaos\"'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.handle','\"default\"'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.hasUrls','true'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.language','\"en-US\"'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.name','\"Chaos\"'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.primary','true'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.siteGroup','\"f1481cac-5f13-4cba-8a68-d16b7839a08b\"'),('sites.abd4084c-0d61-4110-97b0-2f095d8c5445.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Chaos\"'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elementCondition','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.autocapitalize','true'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.autocomplete','false'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.autocorrect','true'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.class','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.disabled','false'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.elementCondition','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.id','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.instructions','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.label','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.max','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.min','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.name','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.orientation','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.placeholder','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.readonly','false'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.requirable','false'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.size','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.step','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.tip','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.title','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.uid','\"a942ae87-aa76-4daf-91e1-b5939c12e7df\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.userCondition','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.warning','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.0.width','100'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.elementCondition','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.fieldUid','\"03403fb7-efce-4256-ae24-2a81dbbf421b\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.instructions','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.label','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.required','false'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.tip','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.uid','\"8bed16f3-ccec-431d-91a9-4cea50d49dcd\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.userCondition','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.warning','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.elements.1.width','100'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.name','\"Content\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.uid','\"590bc761-4626-4f4d-af72-18a2d192e427\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fieldLayouts.d0c0ad20-e522-44e3-8e59-c15bc6fd36bc.tabs.0.userCondition','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.fs','\"default\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.handle','\"pictures\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.name','\"Pictures\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.sortOrder','1'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.titleTranslationKeyFormat','null'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.titleTranslationMethod','\"site\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.transformFs','\"default\"'),('volumes.47d85af7-a58a-401a-91ac-8a7e694423d2.transformSubpath','\"\"');
/*!40000 ALTER TABLE `chao_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_queue`
--

LOCK TABLES `chao_queue` WRITE;
/*!40000 ALTER TABLE `chao_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_relations`
--

LOCK TABLES `chao_relations` WRITE;
/*!40000 ALTER TABLE `chao_relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_relations` VALUES (3,3,12,NULL,10,1,'2023-05-27 04:34:39','2023-05-27 04:34:39','6655bee9-24f0-4d2c-9fda-5a11e7a83990'),(7,3,15,NULL,14,1,'2023-05-27 04:39:53','2023-05-27 04:39:53','99bd9c9e-5d2f-434b-bed9-a455148f6f88'),(9,3,2,NULL,16,1,'2023-05-27 21:17:02','2023-05-27 21:17:02','e40118e5-3e8d-4422-a925-244d4339ff88'),(10,3,18,NULL,16,1,'2023-05-27 21:17:02','2023-05-27 21:17:02','5dff8c8f-4c40-44d6-abf5-d158dac6009c'),(11,3,19,NULL,16,1,'2023-05-30 15:35:04','2023-05-30 15:35:04','3aa7c954-3cf9-4e88-84ac-9cb8704667c2'),(13,3,27,NULL,16,1,'2023-05-30 15:35:35','2023-05-30 15:35:35','65198b1e-7ce8-4791-8f93-8102b2c90406'),(14,3,29,NULL,16,1,'2023-05-30 15:39:17','2023-05-30 15:39:17','da3e1c9e-851e-405c-8129-fb4c700cd469'),(16,3,36,NULL,16,1,'2023-05-30 15:39:40','2023-05-30 15:39:40','d4227b35-9f77-466a-a175-9727a5692317'),(19,18,35,NULL,38,1,'2023-05-30 18:09:12','2023-05-30 18:09:12','7afd62e6-472a-41b7-8118-dba627a3e8f0'),(20,3,42,NULL,16,1,'2023-05-30 18:09:12','2023-05-30 18:09:12','3810ae59-2c9c-415c-9401-bb8f77b8b9c1'),(21,18,43,NULL,38,1,'2023-05-30 18:09:12','2023-05-30 18:09:12','78a5153c-607a-4973-996f-ae08b1dda89f');
/*!40000 ALTER TABLE `chao_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_retour_redirects`
--

LOCK TABLES `chao_retour_redirects` WRITE;
/*!40000 ALTER TABLE `chao_retour_redirects` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_retour_redirects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_retour_static_redirects`
--

LOCK TABLES `chao_retour_static_redirects` WRITE;
/*!40000 ALTER TABLE `chao_retour_static_redirects` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_retour_static_redirects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_retour_stats`
--

LOCK TABLES `chao_retour_stats` WRITE;
/*!40000 ALTER TABLE `chao_retour_stats` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_retour_stats` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_revisions`
--

LOCK TABLES `chao_revisions` WRITE;
/*!40000 ALTER TABLE `chao_revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,'Applied “Draft 1”'),(5,2,1,5,NULL),(6,2,1,6,NULL),(7,2,1,7,'Applied “Draft 1”'),(8,2,1,8,'Applied “Draft 1”'),(9,2,1,9,'Applied “Draft 1”'),(10,2,1,10,NULL),(11,2,1,11,'Applied “Draft 1”'),(12,26,1,1,NULL),(13,2,1,12,NULL),(14,2,1,13,'Applied “Draft 1”'),(15,35,1,1,NULL),(16,2,1,14,'Applied “Draft 1”'),(17,35,1,2,NULL);
/*!40000 ALTER TABLE `chao_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_searchindex`
--

LOCK TABLES `chao_searchindex` WRITE;
/*!40000 ALTER TABLE `chao_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_searchindex` VALUES (1,'email',0,1,' dev vessul co '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' nathanworking '),(2,'slug',0,1,' index '),(2,'title',0,1,' index '),(10,'alt',0,1,''),(10,'extension',0,1,' jpg '),(10,'filename',0,1,' encountering peace nda 14542 2018 jpg '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' encountering peace nda 14542 2018 '),(14,'alt',0,1,''),(14,'extension',0,1,' jpg '),(14,'filename',0,1,' curious direction nda 05659 2016 jpg '),(14,'kind',0,1,' image '),(14,'slug',0,1,''),(14,'title',0,1,' curious direction nda 05659 2016 '),(16,'alt',0,1,''),(16,'extension',0,1,' jpg '),(16,'filename',0,1,' relentless hope nda 11739 2017 jpg '),(16,'kind',0,1,' image '),(16,'slug',0,1,''),(16,'title',0,1,' relentless hope nda 11739 2017 '),(21,'slug',0,1,''),(22,'slug',0,1,''),(23,'slug',0,1,''),(24,'slug',0,1,''),(26,'slug',0,1,''),(31,'slug',0,1,''),(32,'slug',0,1,''),(33,'slug',0,1,''),(35,'slug',0,1,''),(38,'handle',0,1,' formieform '),(38,'slug',0,1,''),(38,'title',0,1,' formie form '),(40,'slug',0,1,''),(44,'field',15,1,' test test '),(44,'field',16,1,' test vessul co '),(44,'field',17,1,' test '),(44,'slug',0,1,''),(44,'title',0,1,' 2023 05 30 11 20 47 '),(45,'slug',0,1,''),(45,'subject',0,1,' a new submission was made on formie form '),(45,'to',0,1,' dev vessul co '),(46,'slug',0,1,''),(46,'subject',0,1,' thanks for contacting us '),(46,'to',0,1,' test vessul co ');
/*!40000 ALTER TABLE `chao_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_sections`
--

LOCK TABLES `chao_sections` WRITE;
/*!40000 ALTER TABLE `chao_sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_sections` VALUES (1,NULL,'Index','index','single',1,'all','end',NULL,'2023-05-26 19:27:51','2023-05-26 19:27:51',NULL,'cacf9851-daaf-4115-bd89-35d61982362a');
/*!40000 ALTER TABLE `chao_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_sections_sites`
--

LOCK TABLES `chao_sections_sites` WRITE;
/*!40000 ALTER TABLE `chao_sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2023-05-26 19:27:51','2023-05-26 19:27:51','648a3fe4-ce4c-4bb2-868f-2bb7c713e050');
/*!40000 ALTER TABLE `chao_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_seomatic_metabundles`
--

LOCK TABLES `chao_seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `chao_seomatic_metabundles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_seomatic_metabundles` VALUES (1,'2023-05-26 19:35:50','2023-05-26 19:35:50','3751c196-b0d3-46cf-8bfa-901672743bff','1.0.62','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2023-05-26 19:35:50','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ seomatic.helper.safeCanonicalUrl() }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Chaos\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoKeywords }}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoDescription }}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.referrer }}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.robots }}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{{ seomatic.meta.robots }}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookProfileId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookAppId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.siteName }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogType }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.canonicalUrl }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.ogSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogTitle }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImage }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterCard }}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{{ seomatic.site.twitterHandle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{{ seomatic.meta.twitterCreator }}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.twitterSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterTitle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImage }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":null,\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.googleSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.bingSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.pinterestSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.meta.canonicalUrl }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text\\/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.site.googlePublisherLink }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https:\\/\\/developers.google.com\\/gtagjs\\/)\",\"templatePath\":\"_frontend\\/scripts\\/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Measurement\\/Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `G-XXXXXXXXXX` or `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/adwords-remarketing-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/dcm\\/partner\\/answer\\/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https:\\/\\/support.google.com\\/tagmanager\\/answer\\/6102821?hl=en)\",\"templatePath\":\"_frontend\\/scripts\\/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"><\\/iframe><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/tag-manager\\/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/ns.html\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https:\\/\\/www.facebook.com\\/business\\/help\\/651294705016616)\",\"templatePath\":\"_frontend\\/scripts\\/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.facebook.com\\/docs\\/facebook-pixel\\/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.facebook.com\\/tr\"}},\"dataLayer\":[],\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend\\/scripts\\/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text\\/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text\\/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n<\\/script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" \\/>\\n<\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/www.linkedin.com\\/help\\/lms\\/answer\\/65513\\/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/snap.licdn.com\\/li.lms-analytics\\/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/dc.ads.linkedin.com\\/collect\\/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text\\/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/knowledge.hubspot.com\\/articles\\/kcs_article\\/reports\\/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"\\/\\/js.hs-scripts.com\\/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https:\\/\\/help.pinterest.com\\/en\\/business\\/article\\/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend\\/scripts\\/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.pinterest.com\\/docs\\/ad-tools\\/conversion-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/s.pinimg.com\\/ct\\/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/ct.pinterest.com\\/v3\\/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https:\\/\\/usefathom.com\\/)\",\"templatePath\":\"_frontend\\/scripts\\/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/cdn.usefathom.com\\/script.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https:\\/\\/matomo.org\\/)\",\"templatePath\":\"_frontend\\/scripts\\/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text\\/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https:\\/\\/plausible.io\\/)\",\"templatePath\":\"_frontend\\/scripts\\/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https:\\/\\/plausible.io\\/docs\\/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/plausible.io\\/js\\/plausible.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics (old)\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https:\\/\\/www.google.com\\/analytics\\/analytics\\/)\",\"templatePath\":\"_frontend\\/scripts\\/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.google-analytics.com\\/analytics.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"issn\":null,\"workTranslation\":null,\"educationalLevel\":null,\"associatedMedia\":null,\"exampleOfWork\":null,\"releasedEvent\":null,\"version\":null,\"locationCreated\":null,\"acquireLicensePage\":null,\"thumbnailUrl\":null,\"provider\":null,\"expires\":null,\"contentLocation\":null,\"educationalUse\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"accessibilityControl\":null,\"maintainer\":null,\"educationalAlignment\":null,\"spatial\":null,\"publisher\":null,\"keywords\":null,\"assesses\":null,\"reviews\":null,\"isBasedOn\":null,\"mentions\":null,\"publishingPrinciples\":null,\"contributor\":null,\"license\":null,\"citation\":null,\"accessibilitySummary\":null,\"award\":null,\"commentCount\":null,\"temporalCoverage\":null,\"dateCreated\":null,\"discussionUrl\":null,\"copyrightNotice\":null,\"learningResourceType\":null,\"awards\":null,\"accessModeSufficient\":null,\"review\":null,\"conditionsOfAccess\":null,\"interactivityType\":null,\"abstract\":null,\"fileFormat\":null,\"interpretedAsClaim\":null,\"text\":null,\"archivedAt\":null,\"alternativeHeadline\":null,\"creditText\":null,\"funding\":null,\"interactionStatistic\":null,\"workExample\":null,\"about\":null,\"encodings\":null,\"funder\":null,\"video\":null,\"isPartOf\":null,\"pattern\":null,\"editor\":null,\"dateModified\":null,\"translationOfWork\":null,\"creativeWorkStatus\":null,\"isBasedOnUrl\":null,\"isFamilyFriendly\":null,\"isAccessibleForFree\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"contentReferenceTime\":null,\"correction\":null,\"sdDatePublished\":null,\"comment\":null,\"countryOfOrigin\":null,\"timeRequired\":null,\"typicalAgeRange\":null,\"genre\":null,\"producer\":null,\"schemaVersion\":null,\"audience\":null,\"encoding\":null,\"publisherImprint\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"audio\":null,\"accessibilityFeature\":null,\"spatialCoverage\":null,\"accessMode\":null,\"editEIDR\":null,\"usageInfo\":null,\"position\":null,\"encodingFormat\":null,\"copyrightYear\":null,\"mainEntity\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"teaches\":null,\"temporal\":null,\"size\":null,\"translator\":null,\"aggregateRating\":null,\"accountablePerson\":null,\"accessibilityHazard\":null,\"contentRating\":null,\"recordedAt\":null,\"publication\":null,\"sdLicense\":null,\"headline\":null,\"materialExtent\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"material\":null,\"datePublished\":null,\"offers\":null,\"hasPart\":null,\"sourceOrganization\":null,\"sponsor\":null,\"character\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{{ seomatic.site.siteLinksSearchTarget }}\"},\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"alternateName\":null,\"sameAs\":null,\"description\":\"{{ seomatic.meta.seoDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"name\":\"{{ seomatic.meta.seoTitle }}\",\"additionalType\":null},\"identity\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.identity.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"serviceArea\":null,\"founder\":\"{{ seomatic.site.identity.organizationFounder }}\",\"isicV4\":null,\"hasPOS\":null,\"globalLocationNumber\":null,\"member\":null,\"knowsAbout\":null,\"makesOffer\":null,\"ownershipFundingInfo\":null,\"founders\":null,\"legalName\":null,\"actionableFeedbackPolicy\":null,\"areaServed\":null,\"parentOrganization\":null,\"slogan\":null,\"department\":null,\"keywords\":null,\"reviews\":null,\"memberOf\":null,\"publishingPrinciples\":null,\"employee\":null,\"award\":null,\"email\":\"{{ seomatic.site.identity.genericEmail }}\",\"contactPoints\":[],\"diversityStaffingReport\":null,\"foundingDate\":\"{{ seomatic.site.identity.organizationFoundingDate }}\",\"owns\":null,\"awards\":null,\"review\":null,\"dissolutionDate\":null,\"funding\":null,\"interactionStatistic\":null,\"events\":null,\"seeks\":null,\"employees\":null,\"unnamedSourcesPolicy\":null,\"subOrganization\":null,\"foundingLocation\":\"{{ seomatic.site.identity.organizationFoundingLocation }}\",\"funder\":null,\"iso6523Code\":null,\"diversityPolicy\":null,\"hasMerchantReturnPolicy\":null,\"event\":null,\"duns\":\"{{ seomatic.site.identity.organizationDuns }}\",\"alumni\":null,\"ethicsPolicy\":null,\"leiCode\":null,\"vatID\":null,\"knowsLanguage\":null,\"correctionsPolicy\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"hasCredential\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.identity.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.identity.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.identity.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.identity.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.identity.genericAddressCountry }}\"},\"brand\":null,\"nonprofitStatus\":null,\"contactPoint\":null,\"hasOfferCatalog\":null,\"members\":null,\"aggregateRating\":null,\"faxNumber\":null,\"telephone\":\"{{ seomatic.site.identity.genericTelephone }}\",\"taxID\":null,\"naics\":null,\"location\":null,\"numberOfEmployees\":null,\"sponsor\":null,\"potentialAction\":null,\"mainEntityOfPage\":null,\"subjectOf\":null,\"url\":\"{{ seomatic.site.identity.genericUrl }}\",\"alternateName\":\"{{ seomatic.site.identity.genericAlternateName }}\",\"sameAs\":null,\"description\":\"{{ seomatic.site.identity.genericDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.identity.genericImage }}\",\"width\":\"{{ seomatic.site.identity.genericImageWidth }}\",\"height\":\"{{ seomatic.site.identity.genericImageHeight }}\"},\"name\":\"{{ seomatic.site.identity.genericName }}\",\"additionalType\":null},\"creator\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.creator.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"serviceArea\":null,\"founder\":\"{{ seomatic.site.creator.organizationFounder }}\",\"isicV4\":null,\"hasPOS\":null,\"globalLocationNumber\":null,\"member\":null,\"knowsAbout\":null,\"makesOffer\":null,\"ownershipFundingInfo\":null,\"founders\":null,\"legalName\":null,\"actionableFeedbackPolicy\":null,\"areaServed\":null,\"parentOrganization\":null,\"slogan\":null,\"department\":null,\"keywords\":null,\"reviews\":null,\"memberOf\":null,\"publishingPrinciples\":null,\"employee\":null,\"award\":null,\"email\":\"{{ seomatic.site.creator.genericEmail }}\",\"contactPoints\":[],\"diversityStaffingReport\":null,\"foundingDate\":\"{{ seomatic.site.creator.organizationFoundingDate }}\",\"owns\":null,\"awards\":null,\"review\":null,\"dissolutionDate\":null,\"funding\":null,\"interactionStatistic\":null,\"events\":null,\"seeks\":null,\"employees\":null,\"unnamedSourcesPolicy\":null,\"subOrganization\":null,\"foundingLocation\":\"{{ seomatic.site.creator.organizationFoundingLocation }}\",\"funder\":null,\"iso6523Code\":null,\"diversityPolicy\":null,\"hasMerchantReturnPolicy\":null,\"event\":null,\"duns\":\"{{ seomatic.site.creator.organizationDuns }}\",\"alumni\":null,\"ethicsPolicy\":null,\"leiCode\":null,\"vatID\":null,\"knowsLanguage\":null,\"correctionsPolicy\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"hasCredential\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.creator.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.creator.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.creator.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.creator.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.creator.genericAddressCountry }}\"},\"brand\":null,\"nonprofitStatus\":null,\"contactPoint\":null,\"hasOfferCatalog\":null,\"members\":null,\"aggregateRating\":null,\"faxNumber\":null,\"telephone\":\"{{ seomatic.site.creator.genericTelephone }}\",\"taxID\":null,\"naics\":null,\"location\":null,\"numberOfEmployees\":null,\"sponsor\":null,\"potentialAction\":null,\"mainEntityOfPage\":null,\"subjectOf\":null,\"url\":\"{{ seomatic.site.creator.genericUrl }}\",\"alternateName\":\"{{ seomatic.site.creator.genericAlternateName }}\",\"sameAs\":null,\"description\":\"{{ seomatic.site.creator.genericDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.creator.genericImage }}\",\"width\":\"{{ seomatic.site.creator.genericImageWidth }}\",\"height\":\"{{ seomatic.site.creator.genericImageHeight }}\"},\"name\":\"{{ seomatic.site.creator.genericName }}\",\"additionalType\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"\\/* TEAM *\\/\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n\\/a\\\" }}\\nURL: {{ parseEnv(seomatic.site.creator.genericUrl ?? \\\"n\\/a\\\") }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n\\/a\\\" }}\\n\\n\\/* THANKS *\\/\\n\\nCraft CMS - https:\\/\\/craftcms.com\\nPixel & Tonic - https:\\/\\/pixelandtonic.com\\n\\n\\/* SITE *\\/\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 4, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend\\/pages\\/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n\\n{{ seomatic.helper.sitemapIndex() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n# live - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\nUser-agent: *\\nDisallow: \\/cpresources\\/\\nDisallow: \\/vendor\\/\\nDisallow: \\/.env\\nDisallow: \\/cache\\/\\n\\n{% case \\\"staging\\\" %}\\n\\n# staging - disallow all\\n\\nUser-agent: *\\nDisallow: \\/\\n\\n{% case \\\"local\\\" %}\\n\\n# local - disallow all\\n\\nUser-agent: *\\nDisallow: \\/\\n\\n{% default %}\\n\\n# default - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\nUser-agent: *\\nDisallow: \\/cpresources\\/\\nDisallow: \\/vendor\\/\\nDisallow: \\/.env\\nDisallow: \\/cache\\/\\n\\n{% endswitch %}\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend\\/pages\\/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n# More info: https:\\/\\/support.google.com\\/admanager\\/answer\\/7441288?hl=en\\n{{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }},123,DIRECT\\n\",\"siteId\":null,\"include\":false,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend\\/pages\\/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }} - more info: https:\\/\\/securitytxt.org\\/\\n\\n# (required) Contact email address for security issues\\nContact: mailto:user@example.com\\n\\n# (required) Expiration date for the security information herein\\nExpires: {{ date(\'+1 year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ url(\'pgp-key.txt\') }}\\n\\n# (optional) Security policy page:\\nPolicy: {{ url(\'security-policy\') }}\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ url(\'hall-of-fame\') }}\\n\",\"siteId\":null,\"include\":false,\"handle\":\"security\",\"path\":\"security.txt\",\"template\":\"_frontend\\/pages\\/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(2,'2023-05-26 19:35:50','2023-05-30 18:09:12','f1d6a85e-ca2c-4c95-827e-d7e27cdbd9d6','1.0.30','section',1,'Index','index','single',NULL,'index.twig',1,'{\"1\":{\"id\":1,\"sectionId\":1,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"index.twig\",\"language\":\"en-us\"}}','2023-05-30 18:09:12','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"sameAsGlobal\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"sameAsGlobal\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"sameAsGlobal\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Chaos\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"significantLink\":null,\"specialty\":null,\"reviewedBy\":null,\"lastReviewed\":null,\"relatedLink\":null,\"breadcrumb\":null,\"significantLinks\":null,\"mainContentOfPage\":null,\"speakable\":null,\"primaryImageOfPage\":null,\"workTranslation\":null,\"educationalLevel\":null,\"associatedMedia\":null,\"exampleOfWork\":null,\"releasedEvent\":null,\"version\":null,\"locationCreated\":null,\"acquireLicensePage\":null,\"thumbnailUrl\":null,\"provider\":null,\"expires\":null,\"contentLocation\":null,\"educationalUse\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"accessibilityControl\":null,\"maintainer\":null,\"educationalAlignment\":null,\"spatial\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#creator\"},\"keywords\":null,\"assesses\":null,\"reviews\":null,\"isBasedOn\":null,\"mentions\":null,\"publishingPrinciples\":null,\"contributor\":null,\"license\":null,\"citation\":null,\"accessibilitySummary\":null,\"award\":null,\"commentCount\":null,\"temporalCoverage\":null,\"dateCreated\":false,\"discussionUrl\":null,\"copyrightNotice\":null,\"learningResourceType\":null,\"awards\":null,\"accessModeSufficient\":null,\"review\":null,\"conditionsOfAccess\":null,\"interactivityType\":null,\"abstract\":null,\"fileFormat\":null,\"interpretedAsClaim\":null,\"text\":null,\"archivedAt\":null,\"alternativeHeadline\":null,\"creditText\":null,\"funding\":null,\"interactionStatistic\":null,\"workExample\":null,\"about\":null,\"encodings\":null,\"funder\":null,\"video\":null,\"isPartOf\":null,\"pattern\":null,\"editor\":null,\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"translationOfWork\":null,\"creativeWorkStatus\":null,\"isBasedOnUrl\":null,\"isFamilyFriendly\":null,\"isAccessibleForFree\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"contentReferenceTime\":null,\"correction\":null,\"sdDatePublished\":null,\"comment\":null,\"countryOfOrigin\":null,\"timeRequired\":null,\"typicalAgeRange\":null,\"genre\":null,\"producer\":null,\"schemaVersion\":null,\"audience\":null,\"encoding\":null,\"publisherImprint\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"audio\":null,\"accessibilityFeature\":null,\"spatialCoverage\":null,\"accessMode\":null,\"editEIDR\":null,\"usageInfo\":null,\"position\":null,\"encodingFormat\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"mainEntity\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#creator\"},\"teaches\":null,\"temporal\":null,\"size\":null,\"translator\":null,\"aggregateRating\":null,\"accountablePerson\":null,\"accessibilityHazard\":null,\"contentRating\":null,\"recordedAt\":null,\"publication\":null,\"sdLicense\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"materialExtent\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"material\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"offers\":null,\"hasPart\":null,\"sourceOrganization\":null,\"sponsor\":null,\"character\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"alternateName\":null,\"sameAs\":null,\"description\":\"{{ seomatic.meta.seoDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"name\":\"{{ seomatic.meta.seoTitle }}\",\"additionalType\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `chao_seomatic_metabundles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_sequences`
--

LOCK TABLES `chao_sequences` WRITE;
/*!40000 ALTER TABLE `chao_sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_shunnedmessages`
--

LOCK TABLES `chao_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `chao_shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_sitegroups`
--

LOCK TABLES `chao_sitegroups` WRITE;
/*!40000 ALTER TABLE `chao_sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_sitegroups` VALUES (1,'Chaos','2023-05-26 19:23:04','2023-05-26 19:23:04',NULL,'f1481cac-5f13-4cba-8a68-d16b7839a08b');
/*!40000 ALTER TABLE `chao_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_sites`
--

LOCK TABLES `chao_sites` WRITE;
/*!40000 ALTER TABLE `chao_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_sites` VALUES (1,1,1,'true','Chaos','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-05-26 19:23:04','2023-05-26 19:23:04',NULL,'abd4084c-0d61-4110-97b0-2f095d8c5445');
/*!40000 ALTER TABLE `chao_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_sprig_playgrounds`
--

LOCK TABLES `chao_sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `chao_sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_structureelements`
--

LOCK TABLES `chao_structureelements` WRITE;
/*!40000 ALTER TABLE `chao_structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_structures`
--

LOCK TABLES `chao_structures` WRITE;
/*!40000 ALTER TABLE `chao_structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_systemmessages`
--

LOCK TABLES `chao_systemmessages` WRITE;
/*!40000 ALTER TABLE `chao_systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_taggroups`
--

LOCK TABLES `chao_taggroups` WRITE;
/*!40000 ALTER TABLE `chao_taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_tags`
--

LOCK TABLES `chao_tags` WRITE;
/*!40000 ALTER TABLE `chao_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_tokens`
--

LOCK TABLES `chao_tokens` WRITE;
/*!40000 ALTER TABLE `chao_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_usergroups`
--

LOCK TABLES `chao_usergroups` WRITE;
/*!40000 ALTER TABLE `chao_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_usergroups_users`
--

LOCK TABLES `chao_usergroups_users` WRITE;
/*!40000 ALTER TABLE `chao_usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_userpermissions`
--

LOCK TABLES `chao_userpermissions` WRITE;
/*!40000 ALTER TABLE `chao_userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_userpermissions_usergroups`
--

LOCK TABLES `chao_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `chao_userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_userpermissions_users`
--

LOCK TABLES `chao_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `chao_userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `chao_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_userpreferences`
--

LOCK TABLES `chao_userpreferences` WRITE;
/*!40000 ALTER TABLE `chao_userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_userpreferences` VALUES (1,'{\"showFieldHandles\":true,\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `chao_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_users`
--

LOCK TABLES `chao_users` WRITE;
/*!40000 ALTER TABLE `chao_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_users` VALUES (1,NULL,1,0,0,0,1,'nathanworking',NULL,NULL,NULL,'dev@vessul.co','$2y$13$iXVH2jNeqWOs9hb8Tqwjje6GDERJ7mrd12LywaIR1XUVS3ePoIVpi','2023-05-30 17:59:06',NULL,NULL,NULL,'2023-05-30 15:30:14',NULL,1,NULL,NULL,NULL,0,'2023-05-26 19:23:05','2023-05-26 19:23:05','2023-05-30 17:59:06');
/*!40000 ALTER TABLE `chao_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_volumefolders`
--

LOCK TABLES `chao_volumefolders` WRITE;
/*!40000 ALTER TABLE `chao_volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_volumefolders` VALUES (1,NULL,1,'Pictures',NULL,'2023-05-27 04:22:34','2023-05-27 04:22:34','d5ed5e63-516c-41ba-bd90-608903a26942'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-05-27 04:22:38','2023-05-27 04:22:38','c7aa2e41-1e63-4772-ab9d-4765827ad45f'),(3,2,NULL,'user_1','user_1/','2023-05-27 04:22:38','2023-05-27 04:22:38','c415a2f4-02de-4a8e-b2da-3baaf3597b20');
/*!40000 ALTER TABLE `chao_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_volumes`
--

LOCK TABLES `chao_volumes` WRITE;
/*!40000 ALTER TABLE `chao_volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_volumes` VALUES (1,2,'Pictures','pictures','default','default','','site',NULL,1,'2023-05-27 04:22:34','2023-05-27 04:22:34',NULL,'47d85af7-a58a-401a-91ac-8a7e694423d2');
/*!40000 ALTER TABLE `chao_volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `chao_widgets`
--

LOCK TABLES `chao_widgets` WRITE;
/*!40000 ALTER TABLE `chao_widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `chao_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-05-26 19:23:54','2023-05-26 19:23:54','5e8a0586-f690-4dd5-9cbb-3001123b8db1'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-05-26 19:23:54','2023-05-26 19:23:54','67acaeb4-c7f2-46f5-ace8-16a12442aed4'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-05-26 19:23:54','2023-05-26 19:23:54','3dc7d7cf-e855-4a81-b81c-d3f7af2192a0'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-05-26 19:23:54','2023-05-26 19:23:54','3e8a4b8f-637a-409d-aa88-0a6591dbdb1e');
/*!40000 ALTER TABLE `chao_widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31  1:56:59
