CREATE DATABASE marketing CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'marketing'@'%' IDENTIFIED BY 'marketing';
GRANT ALL PRIVILEGES ON *.* to 'marketing'@'%';
FLUSH PRIVILEGES;
