DROP INDEX product_id_idx;
DROP INDEX prod_price_idx;
DROP INDEX prod_name_idx;
CREATE INDEX ON product(id);
CREATE INDEX ON product(name);
CREATE INDEX ON product(price);