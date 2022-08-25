-- DELETE EXERCISES --

-- Albums released after 1991 --
SELECT name
FROM albums
WHERE release_date > 1991;
-- Delete command -
DELETE FROM albums WHERE release_date > 1991;

-- Albums with the genre 'disco' --
SELECT name
FROM albums
WHERE genre = 'disco';
-- Delete command --
DELETE FROM albums WHERE genre = 'disco';

-- Albums by 'Whitney Houston (...or maybe an artist of your choice) --
SELECT name
FROM albums
WHERE artist = 'Bruce Springsteen';
-- Delete command --
DELETE FROM albums WHERE artist = 'Bruce Springsteen';