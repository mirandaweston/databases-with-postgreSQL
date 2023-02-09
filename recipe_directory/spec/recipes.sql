DROP TABLE IF EXISTS "public"."recipes";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "cooking_time" int,
    "rating" int
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id", "name", "cooking_time", "rating") VALUES
(1, 'Lemon drizzle cake', '45', '5'),
(2, 'Chocolate brownie', '40', '3'),
(3, 'Sticky toffee pudding', '30', '4'),
(4, 'White chocolate cheesecake', '25', '4');