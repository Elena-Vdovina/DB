-- 2. Вывести ко-во заказов от клиентов из Germany
SELECT
  COUNT(*) AS count_germany
FROM Orders

JOIN Customers ON Orders.CustomerId=Customers.CustomerId

WHERE Customers.Country='Germany'

25


-- 3. Вывести среднюю стоимость проданного в Germany товара
SELECT
	AVG(Products.Price * OrderDetails.Quantity) AS avg_germany

FROM OrderDetails

JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Products ON OrderDetails.ProductID=Products.ProductID

WHERE
	Customers.Country='Germany'

638.4029729729731


-- 4. Вывести ко-во и сред/стоимость товаров из USA`
SELECT
  COUNT(*) AS count_product,
  AVG(Products.Price) AS avg_usa
FROM Products

JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE Suppliers.Country='USA'

12	20.870833333333334


-- 5. Вывести стоимость и название двух самых дешевых товаров из Germany`
SELECT
  Products.Price,
  Products.ProductName
FROM Products

JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE Suppliers.Country='Germany'

ORDER BY Products.Price ASC LIMIT 2

7.75	Rhönbräu Klosterbier
13	Original Frankfurter grüne Soße


-- 6. Применить наценку в 15% ко всем товарам из категории 4`
SELECT
  *,
  Price*1.15 AS Price_up
FROM Products

WHERE CategoryID=4