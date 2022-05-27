CREATE DATABASE catalog;

CREATE TABLE item (
    id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY (id),
    FOREIGN KEY (label_id) REFERENCES label(id)
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
)


CREATE TABLE games (
    id INT  
    multiplayer BOOLEAN 
    last_played_at DATE,
    FOREIGN KEY (id) REFERENCES item(id)
)

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id)
)

CREATE TABLE books (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  author_id INT,
  genre_id INT,
  source_id INT,
  label_id INT,
	FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE SET NULL,
	FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE SET NULL,
	FOREIGN KEY (source_id) REFERENCES source (id) ON DELETE SET NULL,
  FOREIGN KEY (label_id) REFERENCES labels (id) ON DELETE SET NULL,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(200),
  cover_state VARCHAR(200),
);

CREATE TABLE labels (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(200),
  color VARCHAR(200),
  item_id INT,
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE SET NULL,
);

CREATE TABLE music_album (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  author_id INT,
  genre_id INT,
  source_id INT,
  label_id INT,
	FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE SET NULL,
	FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE SET NULL,
	FOREIGN KEY (source_id) REFERENCES source (id) ON DELETE SET NULL,
  FOREIGN KEY (label_id) REFERENCES labels (id) ON DELETE SET NULL,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
);

CREATE TABLE genre (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200),
);
