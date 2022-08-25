-- UPDATE EXERCISES --

-- All albums in your table --
SELECT name FROM albums
-- Make all the albums 10 times more popular (sales * 10) --
UPDATE albums
SET sales = (sales *10)
WHERE sales;

-- All albums released before 1980 --
SELECT name
FROM albums
WHERE release_date < 1980;
-- Move all the albums before 1980 back to the 1800s --
UPDATE albums
SET release_date = 1800
WHERE release_date < 1980;

-- All albums by Michael Jackson --
SELECT name
FROM albums
WHERE artist = "Michael Jackson";
-- Change 'Michael Jackson' to 'Peter Jackson' --
UPDATE albums
SET artist = "Peter Jackson"
WHERE artist = "Michael Jackson";

