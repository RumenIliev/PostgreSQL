SELECT
    title
FROM books
WHERE LEFT(title, 3) = 'The'
ORDER BY id



SELECT
    replace(title, 'The', '***')
FROM books
WHERE LEFT(title, 3) = 'The'
ORDER BY id



SELECT
    id,
    side * height / 2 as area
FROM triangles
ORDER BY id



SELECT
    title,
    trunc(cost, 3) as modified_price
FROM books
ORDER BY id
;



SELECT
    first_name,
    last_name,
    date_part('year', born) as year
FROM authors



SELECT
    last_name,
    to_char(born, 'DD (Dy) Mon YYYY')
FROM authors



SELECT
    title
FROM books
WHERE title LIKE '%Harry Potter%'
ORDER BY id