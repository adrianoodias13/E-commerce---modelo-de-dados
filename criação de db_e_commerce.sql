
-- ============================================================ --
-- >>> CRIAÇÃO DO BANCO DE DADOS PARA CENÁRIO DE E-COMMERCE <<< --
-- ============================================================ --

CREATE DATABASE ecommerce;
USE ecommerce;

-- ===================================== --
-- >>> 1. CRIAÇÃO DE TABELAS PRINCIPAIS <<< --
-- ===================================== --

-- 1.1 TABELA DE CLIENTE ---
CREATE TABLE Clients(
	Id_Client  INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Mninit CHAR(2),
    Lname VARCHAR (10),
    Cpf CHAR(19) NOT NULL,
    Address VARCHAR(255),
    CONSTRAINT Unique_Cpf_Client UNIQUE (Cpf)
    );
ALTER TABLE Clients Auto_increment = 1;
    
-- 1.2 TABELA DE PRODUTOS ---
CREATE TABLE Products (
	Id_Product INT AUTO_INCREMENT PRIMARY KEY
    ,Pname VARCHAR(50)
    ,Classification_kids BOOL DEFAULT FALSE
    ,Category  ENUM('Eletronico','Vestuário','Alimentos','Brinquedos','Móveis')
    ,Evaluation FLOAT DEFAULT 0
    ,Size VARCHAR(10)
);
ALTER TABLE Products Auto_increment = 1;

-- 1.3 TABELA DE ESTOQUES ---
CREATE TABLE Storages(
	Id_Storage INT AUTO_INCREMENT PRIMARY KEY
    ,Adress VARCHAR(100) 
    ,Storage_Name VARCHAR(20)
    );
 ALTER TABLE Storages Auto_increment = 1;
 
-- 1.4 TABELA DE FORNCECEDORES ---
CREATE TABLE Suppliers(
	Id_Supplier INT AUTO_INCREMENT PRIMARY KEY
    , Corporative_Name VARCHAR(225)
    , CNPJ CHAR(15)
    , Contact VARCHAR(11) NOT NULL
    , CONSTRAINT Unique_Cnpj UNIQUE (CNPJ)
    );
ALTER TABLE Suppliers Auto_increment = 1;

-- 1.5 TABELA DE VENDEDORES ---
CREATE TABLE Sellers(
	 Id_Seller INT AUTO_INCREMENT PRIMARY KEY
	, Corporative_Name VARCHAR(225)
	, Abs_Name VARCHAR(225)
	, CNPJ CHAR(15)
    , CPF CHAR(11)
	, Contact CHAR(11)
	, Location  VARCHAR(225)
	, CONSTRAINT Unique_Cnpj_Seller  UNIQUE (CNPJ)
    , CONSTRAINT Unique_Cpf_Seller  UNIQUE (CPF)
	);
ALTER TABLE Sellers Auto_increment = 1;
    
    
-- ======================================== --
-- >>> 2.CRIAÇÃO DE TABELAS SECUNDARIAS <<< --
-- ======================================== --

-- 2.1 TABELA DE PAGAMENTOS DE CLIENTES ---
CREATE TABLE Payments_Client (
	 Id_Payment_Client INT AUTO_INCREMENT PRIMARY KEY
	,Id_Client INT
	,Payment_Types ENUM('Boleto','Cartao','Cartões')
    ,Credict_Card_Num VARCHAR (19)
    ,Data_venc INT (4)
    ,CVC INT (3)
    ,Limits FLOAT
    ,Payment_Name  VARCHAR (10)
    ,CONSTRAINT FK_Client_Payment FOREIGN KEY(Id_Client) REFERENCES Clients(Id_Client)
);
ALTER TABLE Payments_Client Auto_increment = 1;

-- 2.2 TABELA DE PEDIDO ---
CREATE TABLE Orders(
	Id_Order INT AUTO_INCREMENT PRIMARY KEY
    ,Id_Client INT
    ,Order_Status ENUM('Cancelado','Confirmar','Em processamento') DEFAULT 'Em processamento'
    ,Order_Description VARCHAR(255)
    ,Send_Value FLOAT DEFAULT 10	
    ,Payment_Cash  BOOL DEFAULT FALSE
    ,Id_Payment_client INT
    ,Deliver_Code VARCHAR(20) 
    ,CONSTRAINT FK_Orders_Client FOREIGN KEY (Id_Client) REFERENCES Clients(Id_Client)
    ,CONSTRAINT FK_Payment_Client FOREIGN KEY  (Id_Payment_Client) REFERENCES Payments_Client(Id_Payment_Client)
);
ALTER TABLE Orders Auto_increment = 1;

-- 2.3 TABELA DE PRODUTOS DE PEDIDOS ---
CREATE TABLE Product_Order (
	Id_Po_Order INT
    , Id_Po_Product INT
    , PRIMARY KEY (Id_Po_Order, Id_PO_Product)
    , Po_Quantity INT DEFAULT 1
    , Po_Status ENUM ('Disponível', 'Em estoque')
    , CONSTRAINT FK_Product_Product_Order FOREIGN KEY (Id_Po_Order) REFERENCES Orders(Id_Order)
    , CONSTRAINT Fk_Order_Product_Order FOREIGN KEY (Id_Po_Product) REFERENCES Products(Id_Product)
    );
    
-- 2.4 TABELA DE PRODUTOS EM ESTOQUES ---
CREATE TABLE Product_Storage (
	Id_Product_Storage INT AUTO_INCREMENT PRIMARY KEY
    , Id_Storage int
    , Id_Product int
    , Quantity int default 0
    , CONSTRAINT FK_Product_Storage FOREIGN KEY (Id_Product) REFERENCES Products(Id_Product)
    , CONSTRAINT FK_Storage_Product_Storage FOREIGN KEY (Id_Storage) REFERENCES Storages(Id_Storage)
 );
 ALTER TABLE Product_Storage Auto_increment = 1;
 
 -- 2.5 TABELA DE PRODUTOS VENDEDORES---
CREATE TABLE Product_Seller(
      Id_Seller INT 
    , Id_Product INT
    , Prod_Quantity INT DEFAULT 1
    , PRIMARY KEY(Id_Product, Id_Seller)
    , CONSTRAINT FK_Product_Seller FOREIGN KEY (Id_Seller) REFERENCES Sellers(Id_Seller)
    , CONSTRAINT FK_Product_Product_Seller FOREIGN KEY (Id_Product) REFERENCES Products(Id_Product)
    );
 
 -- 2.6 TABELA DE PRODUTOS FORNECEDORES --
 CREATE TABLE Product_Supplier (
	Id_Supplier INT
    ,Id_Product INT 
    , Quantity int not null
    , PRIMARY KEY (Id_Supplier, Id_Product)
    , CONSTRAINT FK_Supplier_Product FOREIGN KEY (Id_Supplier) REFERENCES SUPPLIERS(Id_Supplier)
    , CONSTRAINT FK_Product_Supplier FOREIGN KEY (Id_Product) REFERENCES PRODUCTS(Id_Product)
 );

