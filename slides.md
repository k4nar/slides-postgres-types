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

## Les *Enum*
<!-- eg: pour gérer le type des livres -->

---

## Les *Arrays*
<!-- eg: labels pour des livres -->

---

## Le objets *JSON*
<!-- eg: metadata sur les livres -->
<!-- eg: retourner les livres dans une API -->

