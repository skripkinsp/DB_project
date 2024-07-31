'Функция изменения суммы заказа для клиента в таблице "Clients"'


CREATE OR REPLACE FUNCTION update_order_sum_client(client_id INT)
RETURNS VOID AS $$
BEGIN
    UPDATE clients
    SET order_sum = (
        SELECT SUM(price)
        FROM "Order"
        WHERE client_id = client_id
    )
    WHERE id = client_id;
END;
$$ LANGUAGE plpgsql;

'Функция изменения количества продукта в хранилище в таблице "Product_storage"'


CREATE OR REPLACE FUNCTION update_product_amount(product_id INT, new_amount INT)
RETURNS VOID AS $$
BEGIN
    UPDATE "Product_storage"
    SET amount = new_amount
    WHERE id = product_id;
END;
$$ LANGUAGE plpgsql;

'Функция изменения количества и имени дополнительных товаров в таблице "Additionals":'


CREATE OR REPLACE FUNCTION update_additional_info(additional_id INT, new_name VARCHAR(100), new_amount INT)
RETURNS VOID AS $$
BEGIN
    UPDATE "Additionals"
    SET name_ = new_name,
        amount = new_amount
    WHERE id = additional_id;
END;
$$ LANGUAGE plpgsql;

'Представление для отображения информации о заказах, клиентах и курьерах'
CREATE OR REPLACE VIEW order_info AS
SELECT o.id as order_id, c.id as client_id, c.name_ as client_name, co.id as courier_id, co.name_ as courier_name,
    o.address, o.del_time, o.finished, o.price
FROM "Order" o
JOIN "Clients" c ON o.client_id = c.id
JOIN "Courier" co ON o.courier_id = co.id;

'Представление для отображения информации о товарах в упаковке'
CREATE OR REPLACE VIEW package_info AS
SELECT p.id as package_id, ps.id as product_id, ps.name_ as product_name, p.type_, p.amount, p.price, a.id as additionals_id, a.name_ as additionals_name
FROM "Package" p
JOIN "Product_storage" ps ON p.product_id = ps.id
LEFT JOIN "Additionals" a ON p.additionals_id = a.id;

'Представление для отображения информации о ферме и произведенных продуктах'
CREATE OR REPLACE VIEW farm_info AS
SELECT f.id as farm_id, f.plant_time, f.collect_time, f.amount, ps.id as product_id, ps.name_ as product_name
FROM "Farm" f
JOIN "Product_storage" ps ON f.id = ps.id;
