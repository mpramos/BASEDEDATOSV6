-- Ejercicio 14: Tareas

-- 1. El director de Bichos está equivocado, en realidad fue dirigida por **John Lasseter**
UPDATE movie
SET director='John Lasseter'
where titulo='La vida de un bicho'
-- 2. El año en que se lanzó Toy Story 2 es incorrecto, en realidad se lanzó en **1999.**
UPDATE movie
SET anio=2000
where titulo='Toy Story 2'