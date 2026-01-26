-- =============================================
-- SCRIPT DE MIGRACIÓN - RESTAURANTE EN FAMILIA
-- =============================================
-- Ejecuta este script en tu nueva base de datos de Supabase
-- Ve a: Supabase Dashboard > SQL Editor > New Query

-- 1. CREAR LA TABLA menu_items
CREATE TABLE IF NOT EXISTS menu_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    section_index INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. HABILITAR ROW LEVEL SECURITY (RLS)
ALTER TABLE menu_items ENABLE ROW LEVEL SECURITY;

-- 3. CREAR POLÍTICAS DE SEGURIDAD
-- Permitir lectura pública (para el menú)
CREATE POLICY "Permitir lectura pública" ON menu_items
    FOR SELECT USING (true);

-- Permitir todas las operaciones para usuarios autenticados
CREATE POLICY "Permitir todo para usuarios autenticados" ON menu_items
    FOR ALL USING (auth.role() = 'authenticated');

-- 4. CREAR FUNCIÓN PARA ACTUALIZAR updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 5. CREAR TRIGGER PARA updated_at
CREATE TRIGGER update_menu_items_updated_at
    BEFORE UPDATE ON menu_items
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- 6. INSERTAR TODOS LOS DATOS DEL MENÚ
-- Secciones:
-- 0 = Entrantes Calientes
-- 1 = Entrantes Fríos
-- 2 = Ensaladas
-- 3 = Tostas
-- 4 = Salsas
-- 5 = Pescados
-- 6 = Carnes
-- 7 = Carnes a la Brasa
-- 8 = Pastas
-- 9 = Arroces
-- 10 = Platos Especiales
-- 11 = Refrescos
-- 12 = Cócteles y Licores

-- ENTRANTES CALIENTES (section_index = 0)
INSERT INTO menu_items (name, price, section_index) VALUES
('Gambas en tempura', 9.95, 0),
('Carne fiesta', 8.95, 0),
('Huevos Rotos', 7.95, 0),
('Queso Asado', 6.95, 0),
('Croquetas caseras por unidad', 0.80, 0),
('Papas Locas', 5.95, 0),
('Tamales', 4.00, 0),
('Tostones', 5.70, 0),
('Frituras de maíz', 7.00, 0),
('Tiras de Pollo', 8.25, 0),
('Pimientos de Padrón', 6.85, 0),
('Revuelto de setas y gambas', 9.45, 0),
('Hamburguesa de Black Angus', 8.50, 0),
('Gambas al Ajillo', 8.20, 0),
('Croquetas caseras', 6.05, 0);

-- ENTRANTES FRÍOS (section_index = 1)
INSERT INTO menu_items (name, price, section_index) VALUES
('Tabla de queso manchego', 8.00, 1),
('Pata asada', 8.85, 1),
('Tabla de queso fresco', 9.55, 1),
('Tabla de queso fresco y jamón serrano', 11.55, 1),
('Aguacate relleno de salmón', 11.30, 1),
('Surtido de quesos', 13.10, 1),
('Nachos a la mary mixtos', 9.80, 1);

-- ENSALADAS (section_index = 2)
INSERT INTO menu_items (name, price, section_index) VALUES
('Ensalada de la casa', 8.80, 2),
('Ensalada de aguacate y salmón', 10.70, 2),
('Ensalada César', 8.80, 2);

-- TOSTAS (section_index = 3)
INSERT INTO menu_items (name, price, section_index) VALUES
('Tosta de serrano y manchego', 7.55, 3),
('Tosta de ajo', 2.55, 3),
('Tosta de serrano y tumaca', 6.15, 3),
('Tosta de solomillo y rulo de cabra', 7.50, 3),
('Tosta de aguacate y salmón', 9.55, 3),
('Tosta de ajo, tomate y queso', 4.20, 3);

-- SALSAS (section_index = 4)
INSERT INTO menu_items (name, price, section_index) VALUES
('Salsa de pimienta verde', 3.10, 4),
('Salsa de Roquefort', 3.10, 4),
('Salsa de champiñones', 3.10, 4);

-- PESCADOS (section_index = 5)
INSERT INTO menu_items (name, price, section_index) VALUES
('Bacalao confitado', 17.85, 5),
('Merluza en salsa verde', 15.95, 5),
('Bacalao encebollado', 17.85, 5);

-- CARNES (section_index = 6)
INSERT INTO menu_items (name, price, section_index) VALUES
('Escalope de cerdo', 9.95, 6),
('Milanesa', 13.10, 6),
('Gordon blue de ternera', 13.50, 6),
('Gordon Blue de cerdo', 13.00, 6),
('Escalope de ternera', 12.50, 6),
('Carne mechada', 9.50, 6),
('Carne Cabra', 9.50, 6),
('Escalope de pollo', 13.00, 6),
('Gordon Blue pollo', 13.00, 6),
('Pechuga a la plancha', 10.95, 6);

-- CARNES A LA BRASA (section_index = 7)
INSERT INTO menu_items (name, price, section_index) VALUES
('Solomillo de ternera', 19.95, 7),
('Bistec de cerdo', 8.25, 7),
('Bistec de ternera', 10.95, 7),
('1/2 Costillar de cerdo BBQ', 13.50, 7),
('Costillar de cerdo BBQ', 20.50, 7),
('Puntas de solomillo salteadas con verduras', 19.60, 7),
('Parrillada mixta', 24.70, 7),
('Secreto Ibérico', 16.95, 7),
('Pollo de corral', 12.00, 7),
('Solomillo salteado con verduras', 22.95, 7),
('1/2 Pollo de corral', 7.00, 7),
('1/2 Tira de costilla BBQ', 8.65, 7),
('Tira de costilla de cerdo BBQ', 16.20, 7),
('Entrecot de ternera', 19.90, 7),
('Chateaubriand', 39.95, 7);

-- PASTAS (section_index = 8)
INSERT INTO menu_items (name, price, section_index) VALUES
('Tallarines del mar', 9.50, 8),
('Tallarines de setas y gambas', 9.25, 8),
('Lasaña de carne', 9.25, 8),
('Espagueti Carbonara', 9.25, 8),
('Espagueti boloñesa', 9.25, 8),
('Tallarines salteados con verduras, setas y gambas', 9.50, 8);

-- ARROCES (section_index = 9)
INSERT INTO menu_items (name, price, section_index) VALUES
('Arroz meloso de solomillo y verduras', 25.60, 9),
('Paella de verduras', 18.20, 9),
('Arroz de bacalao y coliflor', 23.95, 9),
('Arroz negro de sepia, gambas y merluza', 23.95, 9),
('Arroz meloso de pollo, setas y gambas', 23.95, 9),
('Risotto de gambas, cherri confitado y burrata', 17.95, 9),
('Paella de pescado y marisco', 23.95, 9),
('Paella mixta', 26.95, 9);

-- PLATOS ESPECIALES (section_index = 10)
INSERT INTO menu_items (name, price, section_index) VALUES
('Completa cubana de pollo', 14.00, 10),
('Completa cubana de carne mechada', 14.00, 10),
('Completa cubana de bistec de cerdo', 14.00, 10),
('Completa cubana de pata asada', 14.00, 10),
('Completa cubana de masa de cerdo frita', 14.00, 10);

-- REFRESCOS (section_index = 11)
INSERT INTO menu_items (name, price, section_index) VALUES
('Cocacola original grande', 1.80, 11),
('Cocacola cero grande', 1.80, 11),
('Fanta naranja grande', 1.80, 11),
('Fanta limón grande', 1.80, 11),
('Acuarius naranja', 1.50, 11),
('Nestea maracuya', 1.60, 11),
('Acuarius limón', 1.50, 11),
('Appletteiser', 1.30, 11),
('Nestea mango-piña', 1.60, 11),
('Zumos de bote', 1.30, 11),
('Red Bull', 2.00, 11);

-- CÓCTELES Y LICORES (section_index = 12)
INSERT INTO menu_items (name, price, section_index) VALUES
('Pampero', 3.20, 12),
('Diplomático', 4.80, 12),
('Jameson', 3.10, 12),
('100 Pipers', 2.80, 12),
('Jack Daniels', 3.80, 12),
('J.B.', 2.20, 12),
('Ballantines', 2.60, 12),
('Chivas Regal', 4.70, 12),
('White Label', 2.50, 12),
('Bucana', 5.20, 12),
('Glenfiddich', 4.50, 12),
('Gordons', 2.90, 12),
('Larios', 2.90, 12),
('Bombay', 4.90, 12),
('Puerto de Indias', 4.90, 12),
('Tanqueray', 4.90, 12),
('Hendricks', 5.00, 12),
('Brockmans', 5.10, 12),
('Beefeater', 3.40, 12),
('Arehucas Oro', 3.20, 12),
('Arehucas Blanco', 3.20, 12),
('Matusalén 10', 4.50, 12),
('Matusalén 15', 4.70, 12),
('Havana 7', 3.90, 12),
('Havana 3', 2.40, 12),
('Bacardí', 2.40, 12),
('Guajiro', 2.00, 12),
('Brugal', 2.60, 12),
('Barceló', 2.10, 12),
('Vodka Absolut', 2.60, 12),
('Vodka Smirnoff', 3.10, 12),
('Cacique', 3.20, 12),
('Legendario', 2.60, 12),
('Cañey', 2.70, 12);

-- 7. VERIFICAR QUE TODO SE INSERTÓ CORRECTAMENTE
SELECT section_index, COUNT(*) as total_items 
FROM menu_items 
GROUP BY section_index 
ORDER BY section_index;

-- 8. HABILITAR REALTIME PARA LA TABLA (para actualizaciones en tiempo real)
-- Esto se hace desde el Dashboard de Supabase:
-- Database > Replication > Añadir tabla menu_items a la publicación

-- =============================================
-- FIN DEL SCRIPT
-- =============================================
