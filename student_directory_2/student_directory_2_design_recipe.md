# Two Tables Design Recipe Template



## 1. Extract nouns from the user stories or specification

```

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

```

```
Nouns:

students' names, cohorts' names, cohorts' starting dates
```

## 2. Infer the Table Name and Columns


| Record                | Properties          |
| --------------------- | ------------------  |
| students              | name
| cohorts               | name, starting_date

1. Name of the first table (always plural): `students` 

    Column names: `name`

2. Name of the second table (always plural): `cohorts` 

    Column names: `name`, `starting_date`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).


```

Table: students
id: SERIAL
name: text

Table: cohorts
id: SERIAL
name: text
starting_date: date
```

## 4. Decide on The Tables Relationship


To decide on which one:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

```

1. Can one student have many cohorts? NO
2. Can one cohort have many students? YES

-> Therefore,
Student -> many to one -> Cohort

The foreign key is on the students table (cohort_id)

```

## 4. Write the SQL.

```sql

-- file: cohorts_table.sql


-- Create the table without the foreign key first.
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date date,
);

-- file: students_table.sql

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
-- The foreign key name is always {other_table_singular}_id
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 student_directory_2 < students_table.sql
psql -h 127.0.0.1 student_directory_2 < cohorts_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---


<!-- END GENERATED SECTION DO NOT EDIT -->