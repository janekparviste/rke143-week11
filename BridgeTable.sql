SELECT * FROM recipe;

SELECT * FROM ingredient;

SELECT * FROM ingredientinrecipe;

INSERT INTO ingredient (ingredientName) 
VALUES 
('heavy cream'),
('Salt and pepper to taste');

INSERT INTO recipe (recipeName) 
VALUES 
('Pumpkin Pasties'),
('Pumpkin Tartlets'),
('Creamy Pumpkin Soup');

INSERT INTO ingredient (ingredientName) 
VALUES 
('pumpkin puree'),
('sugar'),
('cinnamon'),
('nutmeg'),
('cloves'),
('Pastry dough'),
('Egg wash (1 egg beaten with a splash of milk)'),
('brown sugar'),
('ginger'),
('Mini tart shells'),
('Whipped cream for garnish'),
('onion, chopped'),
('garlic, minced'),
('vegetable broth'),
('heavy cream'),
('Salt and pepper to taste');

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 8),
(2, 9),
(2, 3),
(2, 4),
(2, 10),
(2, 11),
(3, 1),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16);

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
VALUES
(3, 1),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16);

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Pasties' AND b.ingredientName = 'cloves';

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Pasties' AND b.ingredientName = 'Pastry dough';

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Pasties' AND b.ingredientName = 'Egg wash (1 egg beaten with a splash of milk)';

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Tartlets' AND b.ingredientName = 'pumpkin puree';

SELECT a.recipeName, b.ingredientname FROM recipe a
INNER JOIN ingredientinrecipe c
ON a.id = c.recipeId
INNER JOIN ingredient b
ON b.id = c.ingredientId;