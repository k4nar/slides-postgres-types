# PostgreSQL: C'est l'histoire d'un type…

Yannick PÉROUX − Clermont'ech 12/18 <!-- .element: class="footer" -->

v

> Note de service:
> Cette présentation nécessite de connaître les bases du SQL

---

## Pourquoi PostgreSQL ?

PostgreSQL est aux bases de données ce que Git est aux gestionnaires de version.

---

## Les types disponibles

- **Primitives:**  Integer, Numeric, Text, Boolean
- **Structured:**  Date/Time, Array, Range, UUID
- **Document:**    Key-value (Hstore), XML, JSON
- **Geometry:**    Point, Line, Circle, Polygon
- **Custom:**      Composite, Enums, Custom Types…

v

## Les types disponibles

- **Primitives:**  Integer, Numeric, Text, Boolean
- **Structured:**  Date/Time, **Array**, Range, UUID
- **Document:**    Key-value (Hstore), XML, **JSON**
- **Geometry:**    Point, Line, Circle, Polygon
- **Custom:**      Composite, **Enums**, Custom Types…

---

## Les Enums

<div class="left" >
**Utilisation:** Une colonne qui contient des valeurs dans un ensemble fini.

**Avantages:** Garantissent l'intégrité, les valeurs ont un nom explicite.
</div>

v

## Les Enums

```sql
CREATE TYPE categories AS ENUM (
    'novel', 'crime fiction', 'sci-fi', 'fantasy'
);

CREATE TABLE books (
     title         text,
     published_at  date,
     category      categories
 );
```

v

## Les Enums


```sql
> INSERT INTO books(title, published_at, category)
       VALUES ('The Blade Itself', '2006-05-04', 'fantasy'),
              ('Oh, boy!', '2000-03-18', 'novel');

> SELECT * FROM books;
+------------------+----------------+------------+
| title            | published_at   | category   |
|------------------+----------------+------------|
| The Blade Itself | 2006-05-04     | fantasy    |
| Oh, boy!         | 2000-03-18     | novel      |
+------------------+----------------+------------+

```

---

## Les Arrays
<!-- eg: labels pour des livres -->

---

## Le objets JSON
<!-- eg: metadata sur les livres -->
<!-- eg: retourner les livres dans une API -->

---

## Conclusion

« Ce n'est pas sale, ton SQL change. »
