-- ===================================== --
-- >>> Queries <<< --
-- ===================================== --
USE ecommerce
;

-- retornando clientes com produtos em situação 'em processamento'
SELECT 
concat(c.Fname, ' ',c.Lname) as Cliente
,p.Pname as produto
, Po.Po_Quantity as Quantidade
, O.Order_status as Situacao
 FROM Clients C
INNER JOIN Orders O 
	ON C.id_client = O.Id_client
INNER JOIN Product_order Po
	on Po.Id_Po_order = O.Id_Order
INNER JOIN Products p
	ON p.Id_Product = Po.Id_Po_Product
where o.order_status = 'Em Processamento'
;

-- retornando clientes com maiores quantidade de produtos a partir de 5 produtos

SELECT 
CONCAT(c.Fname, ' ',c.Lname) as Cliente
,COALESCE(sum( Po.Po_Quantity),0) as Quantidade
 FROM Clients C
LEFT JOIN Orders O 
	ON C.id_client = O.Id_client
LEFT JOIN Product_order Po
	on Po.Id_Po_order = O.Id_Order
LEFT JOIN Products p
	ON p.Id_Product = Po.Id_Po_Product
group by concat(c.Fname, ' ',c.Lname) 
having sum( Po.Po_Quantity)  > 5
ORDER BY sum( Po.Po_Quantity) DESC
;

-- Quantos pedidos foram realizados para cada cliente

SELECT
CONCAT (C.fname,' ', C.lname) Cliente
, COUNT(O.Id_order) PEDIDOS
FROM Clients C
LEFT JOIN Orders O 
	ON O.Id_Client = C.Id_Client
GROUP BY CONCAT (C.fname,' ', C.lname) 
;

-- Algum vendedor também é fornecedor?
SELECT * FROM SUPPLIERS SP, SELLERS SL
WHERE SP.CNPJ = SL.CNPJ 
;

-- Relação de produtos fornecedores e estoques
SELECT 
SP.Corporative_Name as Fornecedor
,Storage_name AS Estoque
,P.Pname AS Produto
, PS.Quantity AS Quantidade
 FROM Products P
INNER JOIN Product_Storage PS
	ON PS.Id_product = P.Id_product
INNER JOIN Storages S
	ON S.ID_Storage = PS.Id_Storage
INNER JOIN Product_Supplier PSP
	ON PSP.Id_Product = P. Id_product
INNER JOIN Suppliers SP
	ON SP.Id_Supplier = PSP.Id_Supplier
;

-- relação de nome de fornecedores e nome de produtos
SELECT
S.Corporative_name
,P.Pname
FROM 
Product_Supplier PS
INNER JOIN Products P 
	ON P.Id_Product = PS.Id_Product
INNER JOIN Suppliers S 
	ON S.Id_Supplier = PS.Id_Supplier