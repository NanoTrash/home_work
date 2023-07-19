CREATE DATABASE IF NOT EXISTS reg1;
GRANT 
SELECT 
  , 
UPDATE 
  , 
  INSERT ON reg1.* TO 'user' @'%';
FLUSH PRIVILEGES;
USE reg1;
CREATE TABLE IF NOT EXISTS regions (
  region VARCHAR(100) NOT NULL, 
  maincity VARCHAR(50) NOT NULL, 
  population INT (10) NOT NULL
);
INSERT INTO regions (region, maincity, population) 
VALUES 
   (
    'Ivan Bistrov', 'Moskow', 
    '1'
  ), 
  (
    'Kirill Boitcov', 'Kazan', 
    '2'
  ), 
  (
    'Magomed Rashitov', 'Mahachkala', 
    '3'
  ),
  (
    'Albert Petrov' , 'Ivanovo',
    '4'
  );
