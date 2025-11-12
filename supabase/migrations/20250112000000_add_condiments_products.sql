-- Migration: Add Condiments and Sauces Product Catalog
-- Date: 2025-01-12
-- Description: Adds categories and products for various sauce and condiment brands

-- ============================================
-- STEP 1: Insert Categories
-- ============================================

INSERT INTO categories (id, name, icon, sort_order, active, created_at, updated_at) VALUES
('blest', 'BLEST', '🍶', 10, true, now(), now()),
('boy', 'BOY', '🥫', 20, true, now(), now()),
('dip', 'DIP', '🧂', 30, true, now(), now()),
('eggy', 'EGGY', '🥚', 40, true, now(), now()),
('mack', 'MACK', '🍅', 50, true, now(), now()),
('senior', 'SENIOR', '🌶️', 60, true, now(), now()),
('snf', 'SNF', '🧴', 70, true, now(), now())
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  icon = EXCLUDED.icon,
  updated_at = now();

-- ============================================
-- STEP 2: Insert Menu Items with Variations
-- ============================================

-- CATEGORY: BLEST

-- Product: Catsup
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Catsup', 'BLEST Catsup - Quality tomato ketchup', 79.21, 'blest', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 237.63 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: Hot sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Hot Sauce', 'BLEST Hot Sauce - Spicy condiment', 118.86, 'blest', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 356.58 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: MayoLite
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('MayoLite', 'BLEST MayoLite - Light mayonnaise', 14.08, 'blest', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 597.56 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 40.24 FROM new_item
UNION ALL SELECT id, '1X35 pouch (Case)', 478.71 FROM new_item
UNION ALL SELECT id, '1X35 pouch (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 452.32 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 136.70 FROM new_item;

-- Product: Patis
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Patis (Fish Sauce)', 'BLEST Patis - Filipino fish sauce', 76.20, 'blest', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 228.60 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: Soy Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Soy Sauce', 'BLEST Soy Sauce - Traditional soy sauce', 76.20, 'blest', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 228.60 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: Vinegar
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Vinegar', 'BLEST Vinegar - Quality vinegar', 75.75, 'blest', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 227.25 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- ============================================
-- CATEGORY: BOY
-- ============================================

-- Product: Soy Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Soy Sauce', 'BOY Soy Sauce - Premium soy sauce', 89.73, 'boy', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 269.18 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- ============================================
-- CATEGORY: DIP
-- ============================================

-- Product: CATSUP
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Catsup', 'DIP Catsup - Banana ketchup', 41.52, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 456.77 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 309.42 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 61.62 FROM new_item
UNION ALL SELECT id, '1X6 Half Gallon (Case)', 277.61 FROM new_item
UNION ALL SELECT id, '1X6 Half Gallon (Piece)', 14.00 FROM new_item;

-- Product: FISH SAUCE
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Fish Sauce (Patis)', 'DIP Fish Sauce - Filipino patis', 31.81, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 Liter (Case)', 349.88 FROM new_item
UNION ALL SELECT id, '1X12 Liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 263.79 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 56.12 FROM new_item;

-- Product: Hot sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Hot Sauce', 'DIP Hot Sauce - Spicy hot sauce', 44.65, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 491.20 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 429.51 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 98.52 FROM new_item;

-- Product: Oyster Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Oyster Sauce', 'DIP Oyster Sauce - Rich oyster flavor', 14.00, 'dip', true, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 1560.97 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 127.91 FROM new_item
UNION ALL SELECT id, '1x48 Pouch (Case)', 658.00 FROM new_item
UNION ALL SELECT id, '1x48 Pouch (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 1140.32 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 366.11 FROM new_item;

-- Product: Soy Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Soy Sauce', 'DIP Soy Sauce - Classic soy sauce', 36.60, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 402.64 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 315.18 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 68.46 FROM new_item;

-- Product: Tomato Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Tomato Sauce', 'DIP Tomato Sauce - Italian style tomato sauce', 127.24, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 381.71 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: Vinegar Brown
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Vinegar Brown', 'DIP Brown Vinegar - Natural cane vinegar', 81.31, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 243.94 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: VINEGAR White
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Vinegar White', 'DIP White Vinegar - Distilled white vinegar', 30.79, 'dip', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 338.66 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 251.80 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 52.81 FROM new_item;

-- ============================================
-- CATEGORY: EGGY
-- ============================================

-- Product: BUR DRESSING
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Burger Dressing', 'EGGY Burger Dressing - Creamy burger dressing', 18.43, 'eggy', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 755.62 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 50.26 FROM new_item
UNION ALL SELECT id, '1X35 POUCH (Case)', 626.62 FROM new_item
UNION ALL SELECT id, '1X35 POUCH (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 563.40 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 169.40 FROM new_item;

-- Product: BURGER MAYO
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Burger Mayo', 'EGGY Burger Mayo - Premium burger mayonnaise', 18.43, 'eggy', true, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 870.48 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 60.70 FROM new_item
UNION ALL SELECT id, '1X35 POUCH (Case)', 626.62 FROM new_item
UNION ALL SELECT id, '1X35 POUCH (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 604.52 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 177.41 FROM new_item;

-- ============================================
-- CATEGORY: MACK
-- ============================================

-- Product: Banana Catsup
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Banana Catsup', 'MACK Banana Catsup - Sweet banana ketchup', 34.79, 'mack', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 382.63 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 270.46 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 55.03 FROM new_item;

-- ============================================
-- CATEGORY: SENIOR
-- ============================================

-- Product: Banana Catsup
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Banana Catsup', 'SENIOR Banana Catsup - Traditional banana ketchup', 36.75, 'senior', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 404.19 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 263.64 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 51.33 FROM new_item;

-- Product: Hot Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Hot Sauce', 'SENIOR Hot Sauce - Extra hot sauce', 115.80, 'senior', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 347.40 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- ============================================
-- CATEGORY: SNF
-- ============================================

-- Product: Fish Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Fish Sauce (Patis)', 'SNF Fish Sauce - Premium patis', 90.25, 'snf', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 270.75 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- Product: Iodized Salt
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Iodized Salt', 'SNF Iodized Salt - Premium iodized salt', 7.30, 'snf', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1/2Kg x50pcs (Case)', 715.48 FROM new_item
UNION ALL SELECT id, '1/2Kg x50pcs (Piece)', 7.30 FROM new_item
UNION ALL SELECT id, '1/4Kg 100pcs (Case)', 722.78 FROM new_item
UNION ALL SELECT id, '1/4Kg 100pcs (Piece)', 0 FROM new_item;

-- Product: Soy Sauce
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Soy Sauce', 'SNF Soy Sauce - Quality soy sauce', 42.61, 'snf', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 468.66 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 382.05 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 84.74 FROM new_item;

-- Product: Vinegar Brown
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Vinegar Brown', 'SNF Brown Vinegar - Natural brown vinegar', 30.49, 'snf', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X12 liter (Case)', 335.42 FROM new_item
UNION ALL SELECT id, '1X12 liter (Piece)', 0 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Case)', 243.30 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 50.61 FROM new_item;

-- Product: Vinegar White
WITH new_item AS (
  INSERT INTO menu_items (name, description, base_price, category, popular, available)
  VALUES ('Vinegar White', 'SNF White Vinegar - Pure white vinegar', 85.03, 'snf', false, true)
  RETURNING id
)
INSERT INTO variations (menu_item_id, name, price)
SELECT id, '1X4 Gallon (Case)', 255.09 FROM new_item
UNION ALL SELECT id, '1X4 Gallon (Piece)', 0 FROM new_item;

-- ============================================
-- COMPLETE - Summary
-- ============================================

-- Total Categories: 7
-- Total Products: 30
-- All products have variations for Case and Piece pricing
