DROP INDEX IF EXIST product_id_idx on product;
CREATE INDEX product_id_idx ON product(id);
DROP INDEX IF EXIST product_name_idx on product;
CREATE INDEX product_id_idx ON product(name);
DROP INDEX IF EXIST product_price_idx on product;
CREATE INDEX product_id_idx ON product(price);