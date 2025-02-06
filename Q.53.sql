-- SQL Interview question - Q1


CREATE TABLE input_table (
    Emp_id INT,
    Values TEXT
);

INSERT INTO input_table (Emp_id, Values) VALUES
(1, '23,25,56,54,67,43'),
(2, '32,45,67,9,5'),
(3, '38,54,34,2'),
(4, '76,54,67'),
(5, '22,56,43,78,45');


SELECT 
	*,
	LENGTH(values) -
	LENGTH(REPLACE(values, ',', ''))
	+ 1 as total_inputs
FROM input_table;





