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