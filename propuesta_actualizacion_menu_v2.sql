-- =============================================
-- PROPUESTA DE ACTUALIZACIÓN DE MENÚ (Basada en Foto)
-- =============================================

-- SECCIÓN: PASTAS
-- ---------------------------------------------
UPDATE menu_items SET price = 9.95 WHERE id = 315; -- Tallarines del Mar (Antes 9.50)
UPDATE menu_items SET price = 9.95 WHERE id = 316; -- Espagueti Carbonara (Antes 9.25)
UPDATE menu_items SET price = 9.95 WHERE id = 317; -- Tallarines Salteados (Antes 9.50)
UPDATE menu_items SET price = 9.95 WHERE id = 318; -- Lasaña (Antes 9.25)
UPDATE menu_items SET price = 9.95 WHERE id = 319; -- Tallarines Setas y Gambas (Antes 9.25)
-- Espaguetis Boloñesa (320) se mantiene en 9.25

-- SECCIÓN: ARROCES
-- ---------------------------------------------
-- Actualizaciones de precios existentes
UPDATE menu_items SET price = 19.95 WHERE id = 325; -- Risotto de Gambas (Antes 17.95)
UPDATE menu_items SET price = 28.95 WHERE id = 327; -- Paella Mixta (Antes 26.95)
UPDATE menu_items SET price = 26.95 WHERE id = 324; -- Arroz Meloso y Solomillo (Antes 25.60)
UPDATE menu_items SET price = 18.95 WHERE id = 328; -- Paella Verduras (Antes 18.20)
UPDATE menu_items SET price = 26.95 WHERE id = 326; -- Paella Pescado Marisco (Antes 23.95)
UPDATE menu_items SET price = 26.95 WHERE id = 323; -- Arroz Meloso de Pollo (Antes 23.95)

-- Arroz Negro (322) y Bacalao Conf (321) se mantienen en 23.95

-- Nuevos Platos en Arroces (Verificar si ya existen antes de insertar)
INSERT INTO menu_items (name, price, section_index) VALUES ('Risotto de Carnes', 19.95, 9);
INSERT INTO menu_items (name, price, section_index) VALUES ('Risotto de Pescado', 19.95, 9);

-- SECCIÓN: PLATOS ESPECIALES
-- ---------------------------------------------
UPDATE menu_items SET price = 15.00 WHERE id = 330; -- Completa Bistec de Cerdo (Antes 14.00)

-- Nuevo Plato Especial
INSERT INTO menu_items (name, price, section_index) VALUES ('Completa Bistec de Ternera', 16.00, 10);

-- El resto de completas (Pollo, Masa, Pata, Mechada) se mantienen en 14.00
