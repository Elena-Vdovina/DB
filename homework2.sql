-- Вывести название и стоимость в USD одного самого дорогого проданного товара
1
SELECT
    Products.ProductName,
    Products.Price * 1.1 AS Price_usd
FROM Products

JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID

ORDER BY Products.Price DESC LIMIT 1


-- Вывести два самых дорогих товара из категории Beverages из USA
2
SELECT *
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE
    Categories.CategoryName='Beverages'
    AND
    Suppliers.Country='USA'

ORDER BY Products.Price DESC LIMIT 2


-- Удалить товары с ценой от 5 до 25 EUR
3
DELETE FROM Products
WHERE
    Price BETWEEN 5 AND 25


-- Вывести список стран, которые поставляют морепродукты
4
SELECT DISTINCT Suppliers.Country
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE
    Categories.CategoryID=8


-- Очистить поле ContactName у всех клиентов не из China
5
UPDATE Customers
SET
    ContactName=''
WHERE
    Country!='Canada'
-- Нет из China ни Customers, ни Supplies


-- Вывести информацию о товарах с ценой от 10 до 150 EUR, которые были поставлены из Japan:
--    название_товара
--    цена_товара
--    цена_со_скидкой_15_процентов
--    название_поставщика
6
SELECT
    Products.ProductName,
    Products.Price,
    Products.Price * .85 AS Price_low,
    Suppliers.SupplierName
FROM Products

JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE
    Suppliers.Country='Japan'
    AND
    Products.Price BETWEEN 10 AND 150


-- Вывести заказы клиентов из USA, Germany, UK:
--    номер_заказа
--    полное_имя_клиента
--    страна_клиента
--    имя_менеджера
--    фамилия_менеджера
7
SELECT
    Orders.OrderID,
    Customers.CustomerName,
    Customers.Country,
    Employees.FirstName,
    Employees.LastName
FROM Orders

JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
