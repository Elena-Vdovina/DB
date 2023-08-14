-- 1. Вывести названия товаров от 50 до 500 EUR
db.products.find(
    { price: { $gte: 50, $lte: 500 } },
    { title: 1, _id: 0 }
)


-- 2. Применить скидку в размере 10% к товарам от 50 EUR
db.products.find(
    { price: { $gte: 50, $lte: 500 } },
    { title: 1, _id: 0 }
)


-- 3. Применить ко всем товарам наценку в размере 5%
db.products.updateMany(
    {},
    { $mul: { price: 1.1 } }
)


-- 4. Заблокировать юзеров не из USA
db.users.updateMany(
    { country: { $ne: 'USA' } },
    { $set: { is_blocked: true } }
)


-- 5. Вывести имена незаблокированных юзеров
db.users.find(
    { is_blocked: false },
    { fullname: 1, _id: 0 }
)