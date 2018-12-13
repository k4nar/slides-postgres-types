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

<div class="left" >
**Utilisation:** Dénormaliser des valeurs simples.

**Avantages:** Peut éviter des JOIN et réduire la taille de la base
</div>

v

## Les Arrays

<div class="left" >
**Utilisation:** Retourner des valeurs agrégées dans un tableau

**Avantages:** Peut éviter le besoin de fusionner des résultats de many-to-many à la main
</div>

v

## Les Arrays

```sql
> SELECT books.title,
         (SELECT array_agg(authors.name)
            FROM authors
            JOIN books_authors
              ON book_id = books.id
                 AND author_id = authors.id
         ) AS authors
    FROM books;
+------------+---------------------------------------------------------+
| title      | authors                                                 |
|------------+---------------------------------------------------------|
| Golem      | ['Elvire Murail', 'Lorris Murail', 'Marie-Aude Murail'] |
| Good Omens | ['Terry Pratchett', 'Neil Gaiman']                      |
+------------+---------------------------------------------------------+
```

---

## Le JSON

<div class="left" >
**Utilisation:** Stocker des valeurs en mode "schema-less" dans une colonne

**Avantages:** Évite de tout passer à MongoDB :)
</div>

v

## Le JSON

<div class="left" >
**Utilisation:** Retourner directement le résulat d'un appel à une API REST

**Avantages:** Beaucoup, beaucoup plus rapide tout en restant simple
</div>

v

## Le JSON


```sql
> WITH result AS (
      SELECT books.title,
             (SELECT array_agg(authors.name)
                FROM authors
                JOIN books_authors
                  ON book_id = books.id
                     AND author_id = authors.id
             ) AS authors
        FROM books
   )
   SELECT json_agg(result)::text FROM result;
+--------------------------------------------------------------------------------------+
| json_agg                                                                             |
|--------------------------------------------------------------------------------------|
| [{"title":"Golem","authors":["Elvire Murail","Lorris Murail","Marie-Aude Murail"]},  |
|  {"title":"Good Omens","authors":["Terry Pratchett","Neil Gaiman"]}]                 |
+--------------------------------------------------------------------------------------+
```

---

## Conclusion

« Ce n'est pas sale, ton SQL change. »


---

![Mastering Postgresql](https://masteringpostgresql.com/img/MasteringPostgreSQLinAppDev-Cover.png)

[https://masteringpostgresql.com/](https://masteringpostgresql.com/)
