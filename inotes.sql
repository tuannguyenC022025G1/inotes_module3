CREATE DATABASE IF NOT EXISTS iNotes;
USE iNotes;

CREATE TABLE note_type (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE note (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(500) NOT NULL,
    type_id INT(11),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (type_id) REFERENCES note_type(id)
);

INSERT INTO note_type (name, description) VALUES 
('Cá nhân', 'Ghi chú cá nhân'), 
('Công ty', 'Ghi chú công ty');