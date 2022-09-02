-- Create a database named join_test_db and run the SQL provided in the Join Example DB section above; to create the same setup used for this lesson.
CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
                                             ('bob', 'bob@example.com', 1),
                                             ('joe', 'joe@example.com', 2),
                                             ('sally', 'sally@example.com', 3),
                                             ('adam', 'adam@example.com', 3),
                                             ('jane', 'jane@example.com', null),
                                             ('mike', 'mike@example.com', null),
-- Insert 4 new users into the database. One should have a NULL role. The other three should be authors.
                                             ('lock', 'lock@example.com', 2),
                                             ('shock', 'shock@example.com', 2),
                                             ('barrel', 'barrel@example.com', 2),
                                             ('boogie', 'boogie@example.com', null);

-- Use JOIN, LEFT JOIN, and RIGHT JOIN to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT r.name, users.name
FROM users
         INNER JOIN roles r on users.role_id = r.id;

SELECT r.name, users.name
FROM users
         LEFT JOIN roles r on users.role_id = r.id;

SELECT r.name, users.name
FROM users
         RIGHT JOIN roles r on users.role_id = r.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use COUNT and the appropriate join type to get a list of roles along with the number of users that have a given role. Hint: You will also need to use GROUP BY in the query.
SELECT COUNT(*) AS user_depo, r.name AS roles
FROM users
        JOIN roles r on r.id = users.role_id
GROUP BY r.name;