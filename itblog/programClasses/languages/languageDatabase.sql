CREATE TABLE languages (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	INDEX languages (id),
	short VARCHAR(2) NOT NULL,
	name VARCHAR(32) NOT NULL
) ENGINE=INNODB;
CREATE TABLE translations (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	keyword VARCHAR(128) NOT NULL,
	lang INT NOT NULL,
	value VARCHAR(256) NOT NULL,
	FOREIGN KEY(lang) REFERENCES languages(id)
) ENGINE=INNODB;
INSERT INTO languages (short, name) VALUES
('en', 'English'),
('no', 'Norwegian'),
('is', 'Icelandic');
