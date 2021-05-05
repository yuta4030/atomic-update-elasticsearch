DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(36) NOT NULL,
    coord VARCHAR(36),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_deleted TINYINT(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE "/docker-entrypoint-initdb.d/test_data.csv" 
    INTO TABLE test_table 
    FIELDS TERMINATED BY ','
    ENCLOSED BY '\"'
    LINES TERMINATED BY '\n'
    (@1,@2)
    SET name=@1, coord=@2;