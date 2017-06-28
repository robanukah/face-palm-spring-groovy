CREATE TABLE IF NOT EXISTS "post" (
  id SERIAL NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  date TEXT NOT NULL,
  content TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "jwt_user" (
  id SERIAL NOT NULL PRIMARY KEY,
  username VARCHAR(64) NOT NULL,
  password VARCHAR(64) NOT NULL,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  email VARCHAR(64) NOT NULL
);

CREATE TYPE "authority_name" AS ENUM ('ROLE_USER', 'ROLE_ADMIN');

CREATE TABLE IF NOT EXISTS "authority" (
  id SERIAL NOT NULL PRIMARY KEY,
  name "authority_name" NOT NULL
);

CREATE TABLE IF NOT EXISTS "user_authority" (
  id SERIAL NOT NULL PRIMARY KEY,
  jwt_user_id INT NOT NULL REFERENCES "jwt_user" (id) ON UPDATE CASCADE ON DELETE CASCADE,
  authority_id INT NOT NULL REFERENCES "authority" (id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT uk_user_authority_id UNIQUE (jwt_user_id, authority_id)
);
