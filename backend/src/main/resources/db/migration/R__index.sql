DROP INDEX IF EXISTS product_id_idx;
CREATE INDEX product_id_idx ON product(id);
DROP INDEX IF EXISTS product_name_idx;
CREATE INDEX product_id_idx ON product(name);
DROP INDEX IF EXISTS product_price_idx;
CREATE INDEX product_id_idx ON product(price);