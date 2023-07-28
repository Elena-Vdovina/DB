 -- Приведите 5 типовых бизнес-процессов для любой предметной области (кроме интернет-магазина),
 -- а также их соответствие по CRUD.
1 Блог:
  - Просмотр всех статей        Read
  - Добавить статью             Create
  - Добавить комментарий        Create
  - Отредактировать комментарий Update
  - Удалить комментарий         Delete



-- Вывести название и стоимость товаров от 20 EUR
2
SELECT 
    ProductName, 
    Price 
FROM 
    Products

WHERE
    Price <=20


-- Вывести страны поставщиков
3 
SELECT DISTINCT
    Country 
FROM 
    Suppliers


-- В упорядоченном по стоимости виде вывести название и стоимость товаров со скидкой в 9% от
-- всех поставщиков, кроме поставщика 1
4 
SELECT 
    ProductName, 
    Price*.91 AS Price_low
FROM 
    Products

WHERE
    SupplierID<>1

ORDER BY ProductName ASC


-- Вывести контактные имена клиентов, кроме тех, что из France и USA
5 
SELECT 
    CustomerName 
FROM 
    Customers 

WHERE
    NOT Country IN ('France','USA')