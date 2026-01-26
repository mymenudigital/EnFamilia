-- =============================================
-- CAMBIOS DEL MENÚ - RESTAURANTE EN FAMILIA
-- =============================================
-- Copia y pega esto en Supabase > SQL Editor > Run

-- =============================================
-- 1. ENTRANTES CALIENTES (section_index = 0)
-- =============================================

-- AGREGAR: Papas locas mechadas (8,30€)
INSERT INTO menu_items (name, price, section_index) 
VALUES ('Papas locas mechadas', 8.30, 0);

-- AGREGAR: Tostones Queso (7,20€)
INSERT INTO menu_items (name, price, section_index) 
VALUES ('Tostones Queso', 7.20, 0);

-- CAMBIAR PRECIO: Croquetas caseras a 8,00€
UPDATE menu_items SET price = 8.00 WHERE id = 255;

-- CAMBIAR PRECIO: Croquetas caseras por unidad (proporcionalmente a 1,05€)
UPDATE menu_items SET price = 1.05 WHERE id = 263;

-- =============================================
-- 2. ENTRANTES FRÍOS (section_index = 1)
-- =============================================
-- Nachos a la Mary Mixtos ya existe correctamente (id=272, 9.80€)
-- No hay cambios

-- =============================================
-- 3. TOSTAS (section_index = 3) 
-- =============================================

-- ARREGLAR NOMBRE: Tosta serrano y manchego → nombre completo, precio 9,55€
UPDATE menu_items 
SET name = 'Tosta de jamón serrano y queso manchego', price = 9.55 
WHERE id = 281;

-- ARREGLAR NOMBRE: Tosta serrano y tumaca → Tosta serrano y torrezno 6,15€
UPDATE menu_items 
SET name = 'Tosta de jamón serrano y torrezno', price = 6.15 
WHERE id = 279;

-- =============================================
-- 4. CARNES (section_index = 6)
-- =============================================

-- AGREGAR MILANESAS (necesito confirmar precios, pongo estimados basados en la Milanesa actual 13.10€)
INSERT INTO menu_items (name, price, section_index) 
VALUES ('Milanesa de ternera', 13.50, 6);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Milanesa de pollo', 12.50, 6);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Milanesa de cerdo', 12.00, 6);

-- MOVER A CARNES estos platos que están en "Carnes a la Brasa" (section_index 7 → 6):
-- Carne de cabra (id=299) ya está en Carnes
-- Carne mechada (id=298) ya está en Carnes
-- Pechuga a la plancha (id=297) ya está en Carnes
UPDATE menu_items SET section_index = 6 WHERE id = 307; -- Bistec de cerdo
UPDATE menu_items SET section_index = 6 WHERE id = 308; -- Bistec de ternera
UPDATE menu_items SET section_index = 6 WHERE id = 305; -- Solomillo de ternera
UPDATE menu_items SET section_index = 6 WHERE id = 314; -- Solomillo salteado con verduras
UPDATE menu_items SET section_index = 6 WHERE id = 304; -- Entrecot de ternera
UPDATE menu_items SET section_index = 6 WHERE id = 306; -- Chateaubriand

-- =============================================
-- 5. CARNES A LA BRASA/PARRILLA (section_index = 7)
-- =============================================

-- QUITAR: Puntas de solomillo salteadas con verduras
DELETE FROM menu_items WHERE id = 313;

-- Los siguientes ya existen en la base de datos:
-- ✓ 1/2 Costillar de cerdo BBQ (id=311, 13.50€)
-- ✓ Costillar de cerdo BBQ (id=312, 20.50€)
-- ✓ Parrillada mixta (id=309, 24.70€)
-- ✓ Secreto Ibérico (id=310, 16.95€)
-- ✓ Pollo de corral (id=300, 12.00€)
-- ✓ 1/2 Pollo de corral (id=301, 7.00€)
-- ✓ 1/2 Tira de costilla BBQ (id=302, 8.65€)
-- ✓ Tira de costilla de cerdo BBQ (id=303, 16.20€)

-- =============================================
-- 6. PASTAS (section_index = 8)
-- =============================================

-- SUBIR PRECIO: Tallarines salteados con verduras, setas y gambas
-- Actualmente 9.50€ - ¿A cuánto subir? Pongo 10.50€ como ejemplo
UPDATE menu_items SET price = 10.50 WHERE id = 317;

-- =============================================
-- 7. ARROCES (section_index = 9)
-- =============================================

-- SUBIR PRECIO: Risotto de gambas a 17,95€ (ya está a este precio, verificar)
UPDATE menu_items SET price = 17.95 WHERE id = 325;

-- Paella de pescado y marisco ya existe (id=326, 23.95€) ✓

-- AGREGAR RISOTOS NUEVOS (necesito confirmar precios)
INSERT INTO menu_items (name, price, section_index) 
VALUES ('Risotto de pollo', 15.95, 9);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Risotto de carnes', 16.95, 9);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Risotto de pescado', 17.95, 9);

-- =============================================
-- 8. PLATOS ESPECIALES (section_index = 10)
-- =============================================

-- SUBIR PRECIO: Completa cubana de bistec de cerdo
-- ¿A cuánto subir? Actualmente 14.00€, pongo 15.00€ como ejemplo
UPDATE menu_items SET price = 15.00 WHERE id = 330;

-- =============================================
-- 9. REFRESCOS/ZUMOS (section_index = 11)
-- =============================================

-- AGREGAR ZUMOS (necesito confirmar precio, pongo 2.50€)
INSERT INTO menu_items (name, price, section_index) 
VALUES ('Zumo de melocotón', 2.50, 11);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Zumo de mango', 2.50, 11);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Zumo de fresa', 2.50, 11);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Zumo de piña', 2.50, 11);

INSERT INTO menu_items (name, price, section_index) 
VALUES ('Zumo multifrutas', 2.50, 11);

-- =============================================
-- VERIFICAR TODOS LOS CAMBIOS
-- =============================================
SELECT section_index, name, price 
FROM menu_items 
ORDER BY section_index, name;
