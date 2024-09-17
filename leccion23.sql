-- TRIGGER
    -- insert
    -- update
    -- delete

--! Row-level vs. Statement-level
--! Before vs. After Triggers

CREATE TABLE audit_log(
    id serial PRIMARY key,
    old_value TEXT,
    new_value TEXT,
    changedAt TIMESTAMP default CURRENT_TIMESTAMP
);
CREATE TABLE some_table(
    id serial PRIMARY key,
    column_value TEXT
);

CREATE OR REPLACE FUNCTION log_insert() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_log(new_value) VALUES (NEW.column_value);
    return NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_log
Before INSERT ON some_table 
FOR EACH ROW
EXECUTE FUNCTION log_insert();

INSERT INTO some_table(column_value) VALUES ('Valor')










