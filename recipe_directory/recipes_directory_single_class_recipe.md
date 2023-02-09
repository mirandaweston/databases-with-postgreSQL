# Single Table Design Recipe Template for Recipes Directory



## 1. Extracting nouns from the user stories or specification

```
As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).

```

```
Nouns:

recipes, names, cooking time, rating
```

## 2. Inferring the Table Name and Columns

Puting the different nouns in this table.

| Record                | Properties                |
| --------------------- | ------------------------  |
| recipes               | name, cooking time, rating

Name of the table (always plural): `recipes` 

Column names: `name`, `cooking_time`, `rating`

## 3. Determining the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`.

```

id: SERIAL
name: text
cooking_time: int
rating: int

```

## 4. Writing the SQL.

```sql

-- file: recipes_table.sql

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);
```

## 5. Creating the table.

```bash
psql -h 127.0.0.1 database_name < recipes_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---


<!-- END GENERATED SECTION DO NOT EDIT -->