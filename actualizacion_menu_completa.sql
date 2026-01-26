-- =============================================
-- ACTUALIZACIÓN DE MENÚ (Enero 2026)
-- Versión Final Corregida
-- =============================================

-- 1. ENTRANTES CALIENTES (Section 0)
UPDATE menu_items SET price = 7.95 WHERE id = 262; -- Queso Asado
UPDATE menu_items SET price = 8.45 WHERE id = 259; -- Huevos Rotos
UPDATE menu_items SET price = 9.95 WHERE id = 256; -- Carne Fiesta
UPDATE menu_items SET price = 8.95 WHERE name = 'Hamburguesa de Black Angus'; 
UPDATE menu_items SET price = 9.95 WHERE id = 254; -- Gambas al Ajillo
UPDATE menu_items SET price = 6.95 WHERE id = 264; -- Papas Locas
UPDATE menu_items SET price = 6.70 WHERE id = 266; -- Tostones
UPDATE menu_items SET price = 6.95 WHERE id = 257; -- Pimientos de Padrón
UPDATE menu_items SET price = 9.95 WHERE id = 258; -- Tiras de Pollo
UPDATE menu_items SET price = 8.00 WHERE id = 255; -- Croquetas caseras
UPDATE menu_items SET price = 1.05 WHERE id = 263; -- Croquetas caseras por unidad
INSERT INTO menu_items (name, price, section_index) VALUES ('Papas locas Mechadas', 8.95, 0);
INSERT INTO menu_items (name, price, section_index) VALUES ('Tostones Queso', 7.20, 0);

-- 2. ENTRANTES FRÍOS (Section 1)
UPDATE menu_items SET price = 9.95 WHERE id = 268; -- Pata asada
UPDATE menu_items SET price = 9.95 WHERE id = 269; -- Tabla de queso manchego

-- 3. ENSALADAS (Section 2)
UPDATE menu_items SET price = 9.95 WHERE id = 276; -- Ensalada César
UPDATE menu_items SET price = 9.95 WHERE id = 275; -- Ensalada de la casa

-- 4. TOSTAS (Section 3)
UPDATE menu_items SET price = 10.70 WHERE id = 282; -- Tosta de aguacate y salmón
UPDATE menu_items SET price = 2.95 WHERE id = 278; -- Tosta de ajo
UPDATE menu_items SET name = 'Tosta de solomillo', price = 9.95 WHERE id = 280;
UPDATE menu_items SET price = 5.95 WHERE id = 283; -- Tosta de ajo, tomate y queso
UPDATE menu_items SET price = 7.95 WHERE id = 279; -- Tosta de serrano y tumaca
UPDATE menu_items SET name = 'Tosta de serrano y queso manchego', price = 9.95 WHERE id = 281;

-- 5. SALSAS (Section 4)
UPDATE menu_items SET price = 3.45 WHERE id = 286; -- Salsa de pimienta verde
UPDATE menu_items SET price = 3.95 WHERE id = 284; -- Salsa de champiñones
UPDATE menu_items SET price = 3.45 WHERE id = 285; -- Salsa de Roquefort
INSERT INTO menu_items (name, price, section_index) VALUES ('Alioli', 1.50, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Mojos', 3.00, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Salsa Agridulce', 2.00, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Salsa B.B.Q', 2.00, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Mayonesa', 1.50, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Mantequilla', 1.50, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Ketchup', 1.50, 4);
INSERT INTO menu_items (name, price, section_index) VALUES ('Mostaza', 1.50, 4); 

-- 6. PESCADOS (Section 5)
UPDATE menu_items SET price = 18.45 WHERE id = 287; -- Bacalao confitado
UPDATE menu_items SET price = 16.95 WHERE id = 288; -- Merluza en salsa verde
UPDATE menu_items SET price = 18.45 WHERE id = 289; -- Bacalao encebollado

-- 7. CARNES EMPANADAS (Section 6)
-- SOLO items empanados. Eliminamos/Movemos los que no corresponden.
UPDATE menu_items SET price = 12.00 WHERE id = 295; -- Escalope de cerdo
UPDATE menu_items SET name = 'Milanesa de cerdo', price = 13.00 WHERE id = 296;
INSERT INTO menu_items (name, price, section_index) VALUES ('Milanesa de ternera', 13.50, 6);
INSERT INTO menu_items (name, price, section_index) VALUES ('Milanesa de pollo', 13.00, 6);

-- MOVER items NO empanados a Parrilla (Section 7)
UPDATE menu_items SET section_index = 7 WHERE id = 297; -- Pechuga a la plancha
UPDATE menu_items SET section_index = 7, price = 10.50 WHERE id = 299; -- Carne Cabra
UPDATE menu_items SET section_index = 7, price = 10.50 WHERE id = 298; -- Carne mechada

-- 8. CARNES A LA PARRILLA (Section 7)
UPDATE menu_items SET price = 8.50 WHERE id = 301; -- 1/2 Pollo de corral
UPDATE menu_items SET price = 20.95 WHERE id = 304; -- Entrecot de ternera
UPDATE menu_items SET price = 12.95 WHERE id = 307; -- Bistec de cerdo
UPDATE menu_items SET price = 13.50 WHERE id = 308; -- Bistec de ternera
UPDATE menu_items SET price = 20.95 WHERE id = 305; -- Solomillo de ternera

-- ELIMINAR plato retirado
DELETE FROM menu_items WHERE id = 313; -- Puntas de solomillo salteadas

-- 9. PASTAS (Section 8)
UPDATE menu_items SET price = 10.50 WHERE id = 317; -- Tallarines salteados...

-- 10. ARROCES (Section 9)
UPDATE menu_items SET price = 17.95 WHERE id = 325; -- Risotto de gambas
INSERT INTO menu_items (name, price, section_index) VALUES ('Risotto de pollo', 15.95, 9);
INSERT INTO menu_items (name, price, section_index) VALUES ('Risotto de carnes', 16.95, 9);
INSERT INTO menu_items (name, price, section_index) VALUES ('Risotto de pescado', 17.95, 9);

-- 11. PLATOS ESPECIALES (Section 10)
UPDATE menu_items SET price = 15.00 WHERE id = 330; -- Completa cubana bistec

-- 12. REFRESCOS (Section 11) - Zumos
INSERT INTO menu_items (name, price, section_index) VALUES ('Zumo de melocotón', 2.50, 11);
INSERT INTO menu_items (name, price, section_index) VALUES ('Zumo de mango', 2.50, 11);
INSERT INTO menu_items (name, price, section_index) VALUES ('Zumo de fresa', 2.50, 11);
INSERT INTO menu_items (name, price, section_index) VALUES ('Zumo de piña', 2.50, 11);
INSERT INTO menu_items (name, price, section_index) VALUES ('Zumo multifrutas', 2.50, 11);
