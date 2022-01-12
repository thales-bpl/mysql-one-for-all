-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`plan` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `plan_name` VARCHAR(40) NOT NULL,
  `plan_price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plan
  (plan_name, plan_price)
VALUES
  ('gratuito', '0'),
  ('universitario', '5.99'),
  ('pessoal', '6.99'),
  ('familiar', '7.99');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`users` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `users_id` INT NOT NULL AUTO_INCREMENT,
  `users_name` VARCHAR(140) NOT NULL,
  `users_age` INT NOT NULL,
  `users_plan` INT NOT NULL,
  `user_subscription` DATETIME NOT NULL,
  PRIMARY KEY (`users_id`),
  INDEX `fk_user_plan_idx` (`users_plan` ASC) VISIBLE,
  CONSTRAINT `fk_user_plan`
    FOREIGN KEY (`users_plan`)
    REFERENCES `SpotifyClone`.`plan` (`plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.users
  (users_name, users_age, users_plan, user_subscription)
VALUES
  ('Thati', '23', 'gratuito', '2019-10-20'),
  ('Cintia', '35', 'familiar', '2017-12-30'),
  ('Bill', '20', 'universitário', '2019-06-05'),
  ('Roger', '45', 'pessoal', '2020-05-13'),
  ('Norman', '58', 'pessoal', '2017-02-17'),
  ('Patrick', '33', 'familiar', '2017-01-06'),
  ('Vivian', '26', 'universitário', '2018-01-05'),
  ('Carol', '19', 'universitário', '2018-02-14'),
  ('Angelina', '42', 'familiar', '2018-04-29'),
  ('Paul', '46', 'familiar', '2017-01-17');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artists` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `artists_id` INT NOT NULL AUTO_INCREMENT,
  `artists_name` VARCHAR(140) NOT NULL,
  PRIMARY KEY (`artists_id`))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.artists
  (artists_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`albums` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `albums_id` INT NOT NULL AUTO_INCREMENT,
  `albums_name` VARCHAR(140) NOT NULL,
  `albums_release` YEAR NOT NULL,
  `id_author` INT NOT NULL,
  PRIMARY KEY (`albums_id`),
  INDEX `fk_collection_id_idx` (`id_author` ASC) VISIBLE,
  CONSTRAINT `fk_collection_id`
    FOREIGN KEY (`id_author`)
    REFERENCES `SpotifyClone`.`artists` (`artists_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.albums
  (albums_name, albums_release, id_author)
VALUES
  ('Envious', '1990', '1'),
  ('Exuberant', '1993', '1'),
  ('Hallowed Steam', '1995', '2'),
  ('Incandescent', '1998', '3'),
  ('Temporary Culture', '2001', '4'),
  ('Library of liberty', '2003', '4'),
  ('Chained Down', '2007', '5'),
  ('Cabinet of fools', '2012', '5'),
  ('No garantees', '2015', '5'),
  ('Apparatus', '2015', '6');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`songs` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `songs_id` INT NOT NULL AUTO_INCREMENT,
  `songs_name` VARCHAR(140) NOT NULL,
  `songs_duration` INT NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`songs_id`),
  INDEX `fk_id_album_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_id_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotifyClone`.`albums` (`albums_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.songs
  (songs_name, songs_duration, id_album)
VALUES
  ('Soul For Us', '200', '1'),
  ('Reflections Of Magic', '163', '1'),
  ('Dance With Her Own', '116', '1'),
  ('Troubles Of My Inner Fire', '203', '2'),
  ('Time Fireworks', '152', '2'),
  ('Magic Circus', '105', '3'),
  ('Honey, So Do I', '207', '3'),
  ("Sweetie, Let's Go wild", '139', '3'),
  ('She Knows', '244', '3'),
  ('Fantasy For Me', '100', '4'),
  ('Celebration Of More', '146', '4'),
  ('Rock His Everything', '223', '4'),
  ('Home Forever', '231', '4'),
  ('Diamond Power', '241', '4'),
  ("Let's Be Silly", '132', '4'),
  ('Thang Of Thunder', '240', '5'),
  ('Words Of Her Life', '185', '5'),
  ('Without My Streets', '176', '5'),
  ('Need Of The Evening', '190', '6'),
  ('History Of My Roses', '222', '6'),
  ('Without My Love', '111', '6'),
  ('Walking And Game', '123', '6'),
  ('Young And Father', '197', '6'),
  ('Finding My Traditions', '179', '7'),
  ('Walking And Man', '229', '7'),
  ('Hard And Time', '135', '7'),
  ("Honey, I'm A Lone Wolf", '150', '7'),
  ("She Thinks I Won't Stay Tonight", '166', '8'),
  ("He Heard You're Bad For Me", '154', '8'),
  ("He Hopes We Can't Stay", '210', '8'),
  ('I Know I Know', '117', '8'),
  ("He's Walking Away", '159', '9'),
  ("He's Trouble", '138', '9'),
  ('I Heard I Want Toplans Bo Alone', '120', '9'),
  ('I Ride Alone', '151', '9'),
  ('Honey', '79', '10'),
  ('You Cheated On Me', '95', '10'),
  ("Wouldn't It Be Nice", '213', '10'),
  ('Baby', '136', '10'),
  ('You Make Me Feel So..', '83', '10');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`user_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`user_history` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_history` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `id_songs` INT NOT NULL,
  `play_date` DATETIME NOT NULL,
  INDEX `fk_user_history_1_idx` (`id_user` ASC) VISIBLE,
  INDEX `fk_song_history_idx` (`id_songs` ASC) VISIBLE,
  CONSTRAINT `fk_user_history`
    FOREIGN KEY (`id_user`)
    REFERENCES `SpotifyClone`.`users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song_history`
    FOREIGN KEY (`id_songs`)
    REFERENCES `SpotifyClone`.`songs` (`songs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.user_history
  (id_user, id_songs, play_date)
VALUES
  ('1', '36', '2020-02-28 10:45:55'),
  ('1', '25', '2020-05-02 05:30:35'),
  ('1', '23', '2020-03-06 11:22:33'),
  ('1', '14', '2020-08-05 08:05:17'),
  ('1', '15', '2020-09-14 16:32:22'),
  ('2', '34', '2020-01-02 07:40:33'),
  ('2', '24', '2020-05-16 06:16:22'),
  ('2', '21', '2020-10-09 12:27:48'),
  ('2', '39', '2020-09-21 13:14:46'),
  ('3', '6', '2020-11-13 16:55:13'),
  ('3', '3', '2020-12-05 18:38:30'),
  ('3', '26', '2020-07-30 10:00:00'),
  ('4', '2', '2021-08-15 17:10:10'),
  ('4', '35', '2021-07-10 15:20:30'),
  ('4', '27', '2021-01-09 01:44:33'),
  ('5', '7', '2020-07-03 19:33:28'),
  ('5', '12', '2017-02-24 21:14:22'),
  ('5', '14', '2020-08-06 15:23:43'),
  ('5', '1', '2020-11-10 13:52:27'),
  ('6', '38', '2019-02-07 20:33:48'),
  ('6', '29', '2017-01-24 00:31:17'),
  ('6', '30', '2017-10-12 12:35:20'),
  ('6', '22', '2018-05-29 14:56:41'),
  ('7', '5', '2018-05-09 22:30:49'),
  ('7', '4', '2020-07-27 12:52:58'),
  ('7', '11', '2018-01-16 18:40:43'),
  ('8', '39', '2018-03-21 16:56:40'),
  ('8', '40', '2020-10-18 13:38:05'),
  ('8', '32', '2019-05-25 08:14:03'),
  ('8', '33', '2021-08-15 21:37:09'),
  ('9', '16', '2021-05-24 17:23:45'),
  ('9', '17', '2018-12-07 22:48:52'),
  ('9', '8', '2021-03-14 06:14:26'),
  ('9', '9', '2020-04-01 03:36:00'),
  ('10', '20', '2017-02-06 08:21:34'),
  ('10', '21', '2017-12-04 05:33:43'),
  ('10', '12', '2017-07-27 05:24:49'),
  ('10', '13', '2017-12-25 01:03:57');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`follows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`follows` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`follows` (
  `user_follows` INT NOT NULL,
  `artist_follows` INT NOT NULL,
  INDEX `fk_follows_user_idx` (`user_follows` ASC) VISIBLE,
  INDEX `fk_follows_artist_idx` (`artist_follows` ASC) VISIBLE,
  CONSTRAINT `fk_follows_user`
    FOREIGN KEY (`user_follows`)
    REFERENCES `SpotifyClone`.`users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_follows_artist`
    FOREIGN KEY (`artist_follows`)
    REFERENCES `SpotifyClone`.`artists` (`artists_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.follows
  (user_follows, artist_follows)
VALUES
  ('1', '1'),
	('1', '4'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('3', '1'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '3'),
	('6', '1'),
	('7', '2'),
	('7', '5'),
	('8', '1'),
	('8', '5'),
	('9', '6'),
	('9', '4'),
	('9', '3'),
	('10', '2'),
	('10', '6');
