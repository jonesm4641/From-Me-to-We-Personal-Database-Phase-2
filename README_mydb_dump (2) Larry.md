# mydb – SQL Dump README

**Dump date:** 2025‑09‑08  
**Client:** MySQL dump 10.13 (Distrib 8.0.43, Win64)  
**Reported server version:** 9.4.0  
**Database:** `mydb`

> This README explains the schema included in the dump, how to restore it, sample data that’s included, common pitfalls (based on your errors), and recommended cleanups.

---

## Contents of the dump

Tables created (in this order):

1. **`personal_database`**
2. **`school`**
3. **`school_enrollments`**
4. **`skills/interest`**  ← *table name contains a slash*
5. **`skills_interest`**

The file also toggles: `UNIQUE_CHECKS`, `FOREIGN_KEY_CHECKS`, `SQL_MODE`, `TIME_ZONE`, `character_set_*`, and wraps bulk inserts with `LOCK TABLES` / `DISABLE KEYS` blocks.

---

## Quick restore

If the target server is empty or you are fine with dropping/recreating tables:

```bash
# Option A: standard CLI (local .sql file)
mysql -u <user> -p mydb < dump.sql

# Option B: create DB then import
mysql -u <user> -p -e "CREATE DATABASE IF NOT EXISTS mydb CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"
mysql -u <user> -p mydb < dump.sql
```

> **Note:** The dump **drops** tables before recreating them. Ensure you’re OK losing any existing data in those tables.

---

## Schema overview

### 1) `personal_database`

```sql
CREATE TABLE `personal_database` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1565448 ...
```

- **PK:** `id` (auto‑increment)  
- **Data included:** 6 rows (IDs are non‑contiguous, that’s fine).

**Example rows**
```
(177455,'Lauren','Muffet','Lamuff@gmail.com')
(1565447,'Lamont','James','Lamkdf.sdbb@gmail.com')
```

---

### 2) `school`

```sql
CREATE TABLE `school` (
  `school_name` varchar(120) NOT NULL,
  `id_number` varchar(32) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `grade_level` enum('Freshman','Sophomore','Junior','Senior') NOT NULL,
  `School` varchar(45) NOT NULL,
  PRIMARY KEY (`school_name`)
) ENGINE=InnoDB ...
```

- **PK:** `school_name` (**text primary key**)
- **Columns:** *Note duplicate concept — both `school_name` and `School` exist.*
- **Data included:** none in the dump (empty table).

**Caveats**
- Using `school_name` as the **primary key** prevents multiple students per school.
- `School` (varchar 45) duplicates meaning and is confusing; likely redundant.
- `id_number` looks like a student identifier but is **not unique** in this table.

---

### 3) `school_enrollments`

```sql
CREATE TABLE `school_enrollments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) NOT NULL,
  `id_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `grade_level` enum('Freshman','Sophomore','Junior','Senior') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_id_number` (`id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 ...
```

- **PK:** `id` (auto‑increment)  
- **Constraints:** `id_number` is **UNIQUE** (1 row per student).  
- **Data included:** 6 rows (Oakwood University, Parkview High School, etc.).

**This table looks like the intended canonical design** for enrollments.

---

### 4) `skills/interest`

```sql
CREATE TABLE `skills/interest` (
  `Technical Skills` int NOT NULL,
  `Self Management Skills` varchar(45) NOT NULL,
  `People Skills` varchar(45) NOT NULL,
  `Organizational Skills` varchar(45) NOT NULL,
  `Learning Skills` varchar(45) NOT NULL
) ENGINE=InnoDB ...
```

- **Table name contains a slash**; must always be back‑ticked.
- **No primary key.**
- **Mixed types:** ints and varchars for what seem to be all numeric scores.
- **Data included:** 5 rows.

**Caveats**
- Past errors you saw (`Duplicate entry '5' for key ...`) likely came from a *different* version that had a primary key on `Technical Skills`. In this dump, there is **no PK**, so duplicates are allowed.
- Column names have spaces; always quote with backticks.

---

### 5) `skills_interest`

```sql
CREATE TABLE `skills_interest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Technical_Skills` int DEFAULT NULL,
  `Self_Management_Skills` int DEFAULT NULL,
  `People_Skills` int DEFAULT NULL,
  `Organizational_Skills` int DEFAULT NULL,
  `Learning_Skills` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ...
```

- **PK:** `id` (auto‑increment)  
- **Data included:** none in the dump.  
- **This appears to be the normalized, snake_case version of `skills/interest`.** Prefer this one.

---

## Why you saw earlier errors (and how this dump addresses them)

- `ERROR 1366: Incorrect integer value: 'Oakwood University' for column 'School Name'`  
  → In a previous schema, `School Name` was typed as `INT`. In this dump, all school names are `VARCHAR`, so this should no longer occur.

- `ERROR 1054: Unknown column 'School Name' in 'field list'`  
  → That happens if the current table uses snake_case (`school_name`) but the INSERT uses spaced names. Match your INSERT columns to the actual schema. Use `DESCRIBE school;` to verify.

- `ERROR 1062: Duplicate entry '5' for key 'skills/interest.PRIMARY'`  
  → In this dump there is **no** primary key on `skills/interest`. If you still see it, your live table differs from this dump (drop/recreate or `ALTER TABLE` accordingly).

---

## Suggested cleanups (recommended)

1. **Pick one skills table.** Prefer `skills_interest` (clean names + PK). If you migrate the existing data from `skills/interest`:
   ```sql
   INSERT INTO skills_interest
     (Technical_Skills, Self_Management_Skills, People_Skills, Organizational_Skills, Learning_Skills)
   SELECT
     CAST(`Technical Skills` AS SIGNED),
     CAST(`Self Management Skills` AS SIGNED),
     CAST(`People Skills` AS SIGNED),
     CAST(`Organizational Skills` AS SIGNED),
     CAST(`Learning Skills` AS SIGNED)
   FROM `skills/interest`;
   ```
   Then drop the legacy table:
   ```sql
   DROP TABLE `skills/interest`;
   ```

2. **Normalize the `school`/`school_enrollments` design.** Consider:
   - Keep **`school_enrollments`** as the single source of truth.
   - Remove `School` column from `school` (if you keep `school` at all).
   - Do **not** use `school_name` as a PK; add `id` INT AUTO_INCREMENT PRIMARY KEY instead.
   - If you need a list of distinct schools, derive it:
     ```sql
     SELECT DISTINCT school_name FROM school_enrollments ORDER BY school_name;
     ```

3. **Add constraints for emails (optional):**
   ```sql
   ALTER TABLE personal_database ADD UNIQUE KEY uniq_email (email);
   ```

4. **Avoid spaces and special characters** in identifiers. Prefer `snake_case` and add surrogate integer PKs.

---

## Sanity checks after import

```sql
-- Verify table list
SHOW TABLES;

-- Inspect structures
SHOW CREATE TABLE personal_database\G
SHOW CREATE TABLE school\G
SHOW CREATE TABLE school_enrollments\G
SHOW CREATE TABLE `skills/interest`\G
SHOW CREATE TABLE skills_interest\G

-- Sample queries
SELECT COUNT(*) FROM personal_database;
SELECT * FROM school_enrollments ORDER BY id LIMIT 10;

-- Validate grade levels
SELECT grade_level, COUNT(*) FROM school_enrollments GROUP BY grade_level;

-- Distinct schools
SELECT DISTINCT school_name FROM school_enrollments ORDER BY school_name;

-- If both skills tables exist, compare counts
SELECT (SELECT COUNT(*) FROM `skills/interest`) AS legacy_count,
       (SELECT COUNT(*) FROM skills_interest)   AS normalized_count;
```

---

## Common gotchas

- **Quoting:** Back‑tick any names with spaces or special chars, e.g. `` `skills/interest` `` or `` `Technical Skills` ``.
- **ENUM values:** Must match one of `'Freshman','Sophomore','Junior','Senior'` exactly.
- **Collation/charset:** Dump uses `utf8mb4_0900_ai_ci`; ensure server supports that collation (MySQL 8+).

---

## Minimal ER sketch (conceptual)

```
personal_database (id PK)        skills_interest (id PK)
└─ contact info (optional FK?)   └─ skill scores per record

school_enrollments (id PK, UNIQUE id_number)
└─ school_name (text)
└─ student identity (first/last)
└─ grade_level ENUM
```

> If you later introduce a separate `schools` table, reference it by `school_id` (INT FK) instead of `school_name` text.

---

## Version notes

The header says “Server version 9.4.0”. MySQL GA is < 9 as of this writing; if you’re on MariaDB or a fork, minor differences may exist. The dump itself is standard MySQL‑compatible DDL/DML.

---

## Contact / Next steps

- Decide which skills table to keep and migrate data accordingly.  
- Decide whether `school` is needed alongside `school_enrollments`.  
- I can generate migration SQL tailored to your live schema if you share `SHOW CREATE TABLE` outputs.
