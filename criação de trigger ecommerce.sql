use ecommerce;
-- ==================================== --
-- Criação de backup da tabela clientes --
-- ==================================== --
-- criaçaõ da tabela backup
CREATE TABLE clients_deleted (
  Id_Client int NOT NULL ,
  Fname varchar(10) DEFAULT NULL,
  Mninit char(2) DEFAULT NULL,
  Lname varchar(10) DEFAULT NULL,
  Cpf char(19) NOT NULL,
  Address varchar(255) DEFAULT NULL,
  date_deleted DATETIME NOT NULL
)
-- criação da trigger
DELIMITER ||
CREATE TRIGGER CLIENT_BACKUP 
BEFORE DELETE ON CLIENTS 
FOR EACH ROW
 INSERT INTO clients_deleted (ID_CLIENT, Fname, Mninit,Lname, Cpf, Address, date_deleted)
 select ID_CLIENT, Fname, Mninit,Lname, Cpf, Address, now() from clients
 where cpf = old.cpf;
|| DELIMITER ;

-- verificação da trigger
SHOW TRIGGERS FROM ECOMMERCE;
-- DROP TRIGGER CLIENT_BACKUP;

-- verificação da tabela
SELECT * FROM CLIENTS;

-- inserção de linha de teste
INSERT INTO `ecommerce`.`clients`
(
`Fname`,
`Mninit`,
`Lname`,
`Cpf`,
`Address`)
VALUES ('Jesus', 'G', 'PULTZ','45978614478','Rua corvida, bairro oeste ensolarado, Belim, Flores')
;

-- exclusão da tabela de teste
DELETE FROM CLIENTS WHERE cpf = 45978614478;

-- verificação de backup
SELECT * FROM CLIENTS_DELETED;



