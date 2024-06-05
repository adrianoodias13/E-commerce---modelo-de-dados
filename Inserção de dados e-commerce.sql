-- ===================================== --
-- >>> inserção de dados e-commerce <<< --
-- ===================================== --

use ecommerce;

-- ===================================== --
-- >>> 1. INSERÇÃO DE REGISTROS PRINCIPAIS <<< --
-- ===================================== --

-- 1.1 REGISTROS DE CLIENTES ---
INSERT INTO
	Clients 
	(Fname,Mninit, Lname, cpf, Address)
VALUES
('Maria','M','Silva', 1234678912, 'rua silva de pratqa 29, Carangola - Cidade das flores')
,('Matheus', 'O', 'Pimentel', 9876542175, 'rua alameda 289, Centro - cidade das flores')
,('Ricardo', 'F','Silva', 47845678913, 'avenida alameda vinha 109, centro- cidade das flores')
,('Julia', 'S', 'França', 46789123456, 'rua laranjeiras 861, centro - cidade das flores')
,('Roberta', 'G','Assis',98745631895, 'Avenidade koller 19, Centro - cidade das flores')
,('Isabela','M', 'Cruz', 82654789123, 'rua alamed das flores 28, centro - cidade das flores');

-- 1.2 REGISTROS DE PRODUTOS ---
--     ,Category  ENUM('Eletronico','Vestuário','Alimentos','Brinquedos','Móveis')
INSERT INTO
	Products 
	(Pname,Classification_kids, Category, Evaluation, Size )
VALUES 
 ('Fone de Ouvido', FALSE, 'Eletronico','4', NULL)
,('Barbie Elsa', TRUE,'Brinquedos','3', NULL)
,('Body Carters', TRUE, 'Vestuário','5', NULL)
,('Microfone Veo - youtuber', FALSE, 'Eletronico',DEFAULT,NULL)
,('Sofa retratil', FALSE, 'Móveis', '3', '3x57x80')
,('Farinha de arroz',FALSE, 'Alimentos', '2', NULL)
,('Fire Stick Amazon', FALSE, 'Eletronico','3',NULL);


-- 1.3 REGISTROS DE ESTOQUES ---
INSERT INTO 
Storages
 (Adress, Storage_Name )
VALUES
('Avenida dos Bobo, 0 , Barra da Tijuca - Rio de Janeiro', 'Estoque RIO')
,('Alameda anhanguera, 786, caracamba - Goiania','Estoque Gyn')
;


-- 1.4 REGISTROS DE FORNCECEDORES ---
INSERT INTO
Suppliers
	(Corporative_Name, CNPJ, Contact)
VALUES
	('Ameida e filhos', 123456789123456,'21985474'),
  	('Eletronicos Silva', 123456789123457,'21985475'),
	('Eletronicos Valma', 123456789123458,'21985476');
    

-- 1.5 REGISTRO  DE VENDEDORES ---
INSERT INTO 
Sellers
(Corporative_Name,Abs_name, CNPJ, CPF, Contact, Location)
VALUES
('Tech eletronics', null,123456789456321, null,21994687, 'Rio de Janeiro')
,('Botique Durgas',null, null,123456783, 219567895,'Rio de Janeiro')
,('Kids World', null, 456789123654485,null, 1198657484, 'Sâo Paulo')
;

-- ======================================== --
-- >>> 2.INSERÇÃO DE REGISTROS SECUNDARIOS <<< --
-- ======================================== --

-- 2.1 REGISTROS DE PAGAMENTOS DE CLIENTES ---
-- Paymente_Types ENUM('Boleto','Cartao','Cartões')
INSERT INTO  
	Payments_Client 
	(Id_Client, Payment_types, Credict_card_Num, Data_venc,CVC, Limits, Payment_name)
VALUES 
	 (1,'Boleto',NULL,NULL,NULL,NULL,'Boleto')
    ,(2,'Cartao','3846718364738461259',0634,729,5000,'Roxinho')
    ,(3,'Boleto', null, null,null,null, 'Carnêzinho')
    ,(4,'Cartões','0927384167830523489',0936,293,7000,'Amarelinho')
    ,(5,'Cartao','947235475103468304',0629,912,2500,'Itaú');


-- 2.2 REGISTROS DE PEDIDO --
INSERT INTO 
	ORDERS
	(Id_client, Order_Status, Order_description, Send_value, Payment_cash, Id_payment_client)
VALUES 
	 (1, DEFAULT, 'Compra via aplicativo',null, 1,1)
	,(2, DEFAULT, 'compra via aplicativo',50, 0,2)
	,(3,'Confirmar',null, null,1,3)
	,(4,DEFAULT, 'compra via web site', 150,0,4);
    
    
-- 2.3 REGISTROS DE PRODUTOS DE PEDIDOS ---
INSERT INTO 
Product_order
	(Id_Po_Order, Id_Po_Product, Po_Quantity, Po_Status)
VALUES
(1,1,4,'Disponível')
,(1,4,5,'Disponível')
,(2,2,6,'Disponível')
,(3,1,1,'Disponível')
,(3,7,3,'Disponível')
,(3,2,1,'Disponível')
,(4,6,2,'Disponível')
,(4,5,1,'Disponível');


    
-- 2.4 REGISTROS DE PRODUTOS EM ESTOQUES ---
INSERT INTO 
	Product_storage
    (Id_Storage, Id_product, Quantity)
VALUES 
	 (1, 2, 1000)
    ,(2, 1, 50)
;
    
-- 2.5 REGISTROS DE PRODUTOS VENDEDORES---
INSERT INTO
Product_Seller
	(Id_Seller, Id_Product, Prod_Quantity)
VALUES
	(1,6,80)
	,(2,7,10)
;

-- 2.6 REGISTROS DE PRODUTOS FORNECEDORES --
INSERT INTO 
Product_Supplier
	(ID_Supplier, Id_Product,Quantity)
Values 
	(1,1,500)
	,(1,2,400)
	,(2,4,633)
	,(3,3,5)
	,(2,5,10)
;