DROP IF EXIST INDEX product_id_idx on product;
CREATE INDEX product_id_idx ON product(id);
DROP IF EXIST INDEX product_name_idx on product;
CREATE INDEX product_id_idx ON product(name);
DROP IF EXIST INDEX product_price_idx on product;
CREATE INDEX product_id_idx ON product(price);