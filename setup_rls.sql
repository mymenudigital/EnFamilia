-- =============================================
-- SCRIPT DE SEGURIDAD (RLS) - RESTAURANTE EN FAMILIA
-- =============================================
-- Ejecuta este script en Supabase Dashboard > SQL Editor
-- Esto asegura que SOLO usuarios autenticados puedan editar el menú,
-- pero CUALQUIERA pueda verlo.

-- 1. Habilitar RLS en la tabla (si no lo estaba ya)
ALTER TABLE menu_items ENABLE ROW LEVEL SECURITY;

-- 2. Eliminar políticas antiguas para evitar conflictos
DROP POLICY IF EXISTS "Permitir lectura pública" ON menu_items;
DROP POLICY IF EXISTS "Permitir todo para usuarios autenticados" ON menu_items;
DROP POLICY IF EXISTS "Permitir actualizaciones anónimas" ON menu_items;

-- 3. Política de LECTURA (SELECT): Pública para todos, anonimos y autenticados
CREATE POLICY "Lectura Pública" 
ON menu_items FOR SELECT 
USING (true);

-- 4. Política de ESCRITURA (INSERT, UPDATE, DELETE): Solo autenticados
CREATE POLICY "Escritura Autenticada" 
ON menu_items FOR ALL 
USING (auth.role() = 'authenticated');

-- 5. Verificar configuración
SELECT tablename, rowsecurity FROM pg_tables WHERE tablename = 'menu_items';
