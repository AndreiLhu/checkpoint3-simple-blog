-- MySQL Script generated by MySQL Workbench
-- Sun Dec 18 18:34:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`users` ;

CREATE TABLE IF NOT EXISTS `blog`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`posts` ;

CREATE TABLE IF NOT EXISTS `blog`.`posts` (
  `id_post` INT NOT NULL AUTO_INCREMENT,
  `content` BLOB NOT NULL,
  `date` DATETIME NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_post`),
  UNIQUE INDEX `id_post_UNIQUE` (`id_post` ASC) VISIBLE,
  INDEX `posts_user_post_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `posts_user_post`
    FOREIGN KEY (`id_user`)
    REFERENCES `blog`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`comments` ;

CREATE TABLE IF NOT EXISTS `blog`.`comments` (
  `id_comment` INT NOT NULL AUTO_INCREMENT,
  `content` BLOB NOT NULL,
  `date` DATETIME NOT NULL,
  `id_user` INT NOT NULL,
  `id_post` INT NOT NULL,
  PRIMARY KEY (`id_comment`),
  UNIQUE INDEX `id_comment_UNIQUE` (`id_comment` ASC) VISIBLE,
  INDEX `comments_user_comment_idx` (`id_user` ASC) VISIBLE,
  INDEX `comments_post_comment_idx` (`id_post` ASC) VISIBLE,
  CONSTRAINT `comments_user_comment`
    FOREIGN KEY (`id_user`)
    REFERENCES `blog`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comments_post_comment`
    FOREIGN KEY (`id_post`)
    REFERENCES `blog`.`posts` (`id_post`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `blog`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `blog`;
INSERT INTO `blog`.`users` (`id_user`, `username`) VALUES (1, 'testuser');
INSERT INTO `blog`.`users` (`id_user`, `username`) VALUES (2, 'anotheruser');

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog`.`posts`
-- -----------------------------------------------------
START TRANSACTION;
USE `blog`;
INSERT INTO `blog`.`posts` (`id_post`, `content`, `date`, `id_user`) VALUES (1, 0x49742069732061206C6F6E672065737461626C6973686564206661637420746861742061207265616465722077696C6C206265206469737472616374656420627920746865207265616461626C6520636F6E74656E74206F6620612070616765207768656E206C6F6F6B696E6720617420697473206C61796F75742E2054686520706F696E74206F66207573696E67204C6F72656D20497073756D2069732074686174206974206861732061206D6F72652D6F722D6C657373206E6F726D616C20646973747269627574696F6E206F66206C6574746572732C206173206F70706F73656420746F207573696E672027436F6E74656E7420686572652C20636F6E74656E742068657265272C206D616B696E67206974206C6F6F6B206C696B65207265616461626C6520456E676C6973682E204D616E79206465736B746F70207075626C697368696E67207061636B6167657320616E6420776562207061676520656469746F7273206E6F7720757365204C6F72656D20497073756D2061732074686569722064656661756C74206D6F64656C20746578742C20616E6420612073656172636820666F7220276C6F72656D20697073756D272077696C6C20756E636F766572206D616E7920776562207369746573207374696C6C20696E20746865697220696E66616E63792E20566172696F75732076657273696F6E7320686176652065766F6C766564206F766572207468652079656172732C20736F6D6574696D6573206279206163636964656E742C20736F6D6574696D6573206F6E20707572706F73652028696E6A65637465642068756D6F757220616E6420746865206C696B65292E, '2022-01-14 11:13:55', 1);
INSERT INTO `blog`.`posts` (`id_post`, `content`, `date`, `id_user`) VALUES (2, 0x4C6F72656D20497073756D2069732073696D706C792064756D6D792074657874206F6620746865207072696E74696E6720616E64207479706573657474696E6720696E6475737472792E204C6F72656D20497073756D20686173206265656E2074686520696E6475737472792773207374616E646172642064756D6D79207465787420657665722073696E6365207468652031353030732C207768656E20616E20756E6B6E6F776E207072696E74657220746F6F6B20612067616C6C6579206F66207479706520616E6420736372616D626C656420697420746F206D616B65206120747970652073706563696D656E20626F6F6B2E20497420686173207375727669766564206E6F74206F6E6C7920666976652063656E7475726965732C2062757420616C736F20746865206C65617020696E746F20656C656374726F6E6963207479706573657474696E672C2072656D61696E696E6720657373656E7469616C6C7920756E6368616E6765642E2049742077617320706F70756C61726973656420696E207468652031393630732077697468207468652072656C65617365206F66204C657472617365742073686565747320636F6E7461696E696E67204C6F72656D20497073756D2070617373616765732C20616E64206D6F726520726563656E746C792077697468206465736B746F70207075626C697368696E6720736F667477617265206C696B6520416C64757320506167654D616B657220696E636C7564696E672076657273696F6E73206F66204C6F72656D20497073756D2E, '2022-01-13 14:20:34', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `blog`.`comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `blog`;
INSERT INTO `blog`.`comments` (`id_comment`, `content`, `date`, `id_user`, `id_post`) VALUES (1, 0x436F6E747261727920746F20706F70756C61722062656C6965662C204C6F72656D20497073756D206973206E6F742073696D706C792072616E646F6D20746578742E2049742068617320726F6F747320696E2061207069656365206F6620636C6173736963616C204C6174696E206C6974657261747572652066726F6D2034352042432C206D616B696E67206974206F7665722032303030207965617273206F6C642E2052696368617264204D63436C696E746F636B2C2061204C6174696E2070726F666573736F722061742048616D7064656E2D5379646E657920436F6C6C65676520696E2056697267696E69612C206C6F6F6B6564207570206F6E65206F6620746865206D6F7265206F627363757265204C6174696E20776F7264732C20636F6E73656374657475722C2066726F6D2061204C6F72656D20497073756D20706173736167652C20616E6420676F696E67207468726F75676820746865206369746573206F662074686520776F726420696E20636C6173736963616C206C6974657261747572652C20646973636F76657265642074686520756E646F75627461626C6520736F757263652E204C6F72656D20497073756D20636F6D65732066726F6D2073656374696F6E7320312E31302E333220616E6420312E31302E3333206F66202264652046696E6962757320426F6E6F72756D206574204D616C6F72756D2220285468652045787472656D6573206F6620476F6F6420616E64204576696C292062792043696365726F2C207772697474656E20696E2034352042432E205468697320626F6F6B2069732061207472656174697365206F6E20746865207468656F7279206F66206574686963732C207665727920706F70756C617220647572696E67207468652052656E61697373616E63652E20546865206669727374206C696E65206F66204C6F72656D20497073756D2C20224C6F72656D20697073756D20646F6C6F722073697420616D65742E2E222C20636F6D65732066726F6D2061206C696E6520696E2073656374696F6E20312E31302E33322E, '2022-01-15 09:20:15', 2, 2);
INSERT INTO `blog`.`comments` (`id_comment`, `content`, `date`, `id_user`, `id_post`) VALUES (2, 0x546865726520617265206D616E7920766172696174696F6E73206F66207061737361676573206F66204C6F72656D20497073756D20617661696C61626C652C2062757420746865206D616A6F72697479206861766520737566666572656420616C7465726174696F6E20696E20736F6D6520666F726D2C20627920696E6A65637465642068756D6F75722C206F722072616E646F6D6973656420776F72647320776869636820646F6E2774206C6F6F6B206576656E20736C696768746C792062656C69657661626C652E20496620796F752061726520676F696E6720746F2075736520612070617373616765206F66204C6F72656D20497073756D2C20796F75206E65656420746F20626520737572652074686572652069736E277420616E797468696E6720656D62617272617373696E672068696464656E20696E20746865206D6964646C65206F6620746578742E20416C6C20746865204C6F72656D20497073756D2067656E657261746F7273206F6E2074686520496E7465726E65742074656E6420746F2072657065617420707265646566696E6564206368756E6B73206173206E65636573736172792C206D616B696E6720746869732074686520666972737420747275652067656E657261746F72206F6E2074686520496E7465726E65742E204974207573657320612064696374696F6E617279206F66206F76657220323030204C6174696E20776F7264732C20636F6D62696E6564207769746820612068616E6466756C206F66206D6F64656C2073656E74656E636520737472756374757265732C20746F2067656E6572617465204C6F72656D20497073756D207768696368206C6F6F6B7320726561736F6E61626C652E205468652067656E657261746564204C6F72656D20497073756D206973207468657265666F726520616C7761797320667265652066726F6D2072657065746974696F6E2C20696E6A65637465642068756D6F75722C206F72206E6F6E2D636861726163746572697374696320776F726473206574632E, '2022-01-17 06:40:25', 1, 1);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;