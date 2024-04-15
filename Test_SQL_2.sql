CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

WITH item_counts AS (
    SELECT item, COUNT(*) AS count
    FROM item_bought
    GROUP BY item
)
SELECT item
FROM item_counts
WHERE count != (SELECT MAX(count) FROM item_counts)
  AND count != (SELECT MIN(count) FROM item_counts);