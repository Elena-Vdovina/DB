-- 1. Найти мин/стоимость товаров для каждой категории
SELECT
  Categories.CategoryName,
  MIN(Products.Price) AS min_price
FROM Products

JOIN Categories USING (CategoryID)

GROUP BY Categories.CategoryID


-- 2. Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
  Customers.Country,
  COUNT(Orders.OrderID) AS count_orders
FROM Orders

JOIN Customers USING (CustomerID)

GROUP BY Customers.Country

ORDER BY count_orders DESC

LIMIT 3


-- 3. Вывести названия категорий, в которых более 10 товаров
SELECT
  Categories.CategoryName,
  COUNT(Products.ProductID) AS count_products
FROM Products

JOIN Categories USING (CategoryID)

GROUP BY Categories.CategoryID

HAVING count_products>=10


-- 4. Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET
    Phone=''
WHERE
    Country='USA'


-- 5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
  Employees.FirstName,
  Employees.LastName,
  COUNT(Orders.OrderID) AS count_orders
FROM Employees

JOIN Orders USING (EmployeeID)

GROUP BY Employees.EmployeeID

HAVING count_orders<15


-- 6. Вывести товар, который находится на втором месте по ко-ву заказов
SELECT
  Products.ProductName,
  COUNT(OrderID) AS count_orders
FROM OrderDetails

JOIN Products USING (ProductID)

GROUP BY OrderDetails.OrderID

ORDER BY count_orders DESC

LIMIT 1 OFFSET 1