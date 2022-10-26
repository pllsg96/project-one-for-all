DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
      plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
      plan VARCHAR(20) NOT NULL,
      price DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.plans (plan_id, plan, price)
  VALUES
    (1,	'gratuito',	0),
    (2,	'universitário',	5.99),
    (3,	'pessoal',	6.99),
    (4,	'familiar',	7.99);


  CREATE TABLE SpotifyClone.artists(
      artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
      artist VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artists (artist_id, artist)
  VALUES
    (NULL, 'Beyoncé'),
    (NULL, 'Queen'),
    (NULL, 'Elis Regina'),
    (NULL, 'Baco Exu do Blues'),
    (NULL, 'Blind Guardian'),
    (NULL, 'Nina Simone');


  CREATE TABLE SpotifyClone.users(
      user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
      user VARCHAR(100) NOT NULL,
      age INT NOT NULL,
      subscription_date DATE NOT NULL,
      plan_id INT NOT NULL,
        FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.users (user_id, user, age, subscription_date, plan_id)
  VALUES
    (NULL, 'Barbara Liskov', 82, '2019-10-20', 1),
    (NULL, 'Robert Cecil Martin', 58, '2017-01-06', 1),
    (NULL, 'Ada Lovelace', 37, '2017-12-30', 4),
    (NULL, 'Martin Fowler', 46, '2017-01-17', 4),
    (NULL, 'Sandi Metz', 58, '2018-04-29', 4),
    (NULL, 'Paulo Freire', 19, '2018-02-14', 2),
    (NULL, 'Bell Hooks', 26, '2018-01-05', 2),
    (NULL, 'Christopher Alexander', 85, '2019-06-05', 3),
    (NULL, 'Judith Butler', 45, '2020-05-13', 3),
    (NULL, 'Jorge Amado', 58, '2017-02-17', 3);


  CREATE TABLE SpotifyClone.albums(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
      album VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      release_year YEAR NOT NULL,
        FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.albums (album_id, album, artist_id, release_year)
  VALUES
    (NULL,	'Renaissance',	1,	2022),
    (NULL,	'Jazz',	2,	1978),
    (NULL,	'Hot Space',	2,	1982),
    (NULL,	'Falso Brilhante',	3,	1998),
    (NULL,	'Vento de Maio',	3,	2001),
    (NULL,	'QVVJFA?',	4,	2003),
    (NULL,	'Somewhere Far Beyond',	5,	2007),
    (NULL,	'I Put A Spell On You',	6,	2012);


  CREATE TABLE SpotifyClone.songs(
      song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
      song VARCHAR(100) NOT NULL,
      album_id INT NOT NULL,
      length_seconds INT NOT NULL,
        FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (album_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.songs (song_id, song, album_id, length_seconds)
  VALUES
    (NULL, 'BREAK MY SOUL', 1, 279),
    (NULL, 'VIRGO’S GROOVE', 1, 369),
    (NULL, 'ALIEN SUPERSTAR', 1, 116),
    (NULL, 'Don’t Stop Me Now', 2, 203),
    (NULL, 'Under Pressure', 3, 152),
    (NULL, 'Como Nossos Pais', 4, 105),
    (NULL, 'O Medo de Amar é o Medo de Ser Livre', 5, 207),
    (NULL, 'Samba em Paris', 6, 267),
    (NULL, 'The Bard’s Song', 7, 244),
    (NULL, 'Feeling Good', 8, 100);


  CREATE TABLE SpotifyClone.history(
      user_id INT NOT NULL,
      song_id INT NOT NULL,
      played_date DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(user_id, song_id),
        FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
        FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs (song_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.history (user_id, song_id, played_date)
  VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');


  CREATE TABLE SpotifyClone.following(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(user_id, artist_id),
        FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
        FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.following (user_id, artist_id)
  VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
