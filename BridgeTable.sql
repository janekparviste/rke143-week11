git remote set-url origin https://github.com/rke143/week10

SELECT * FROM recipe;

SELECT * FROM ingredient;

SELECT * FROM ingredientinrecipe;

CREATE TABLE recipe (
    id SERIAL PRIMARY KEY,
    recipeName VARCHAR(55) 
);

CREATE TABLE ingredient (
    id SERIAL PRIMARY KEY,
    ingredientName VARCHAR(55) 
);

CREATE TABLE IngredientInRecipe (
    id SERIAL PRIMARY KEY,
    recipeId INTEGER,
    ingredientId INTEGER,
    FOREIGN KEY (recipeId) REFERENCES recipe(id),
    FOREIGN KEY (ingredientId) REFERENCES ingredient(id)
);

ALTER TABLE recipe ADD COLUMN instructions text;

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

UPDATE recipe
SET instructions = 
    '<br>Mix pumpkin puree, sugar, and spices in a bowl.
    <br>Roll out the pastry dough and cut it into small circles.
    <br>Fold the dough over to create a half-moon shape and crimp the edges with a fork.
    <br>Brush the pasties with egg wash.
    <br>Bake at 375°F (190°C) for 20-25 minutes or until golden brown.'
WHERE id = 1;
UPDATE recipe
SET instructions = 
    '<br>Mix pumpkin puree, brown sugar, and spices in a bowl.
    <br>Spoon the mixture into mini tart shells.
    <br>Bake at 350°F (175°C) for 15-20 minutes or until set.
    <br>Let cool and garnish with whipped cream.'
WHERE id = 2;
UPDATE recipe
SET instructions = 
    '<br>Sauté the onion and garlic in a pot until soft.
    <br>Add the pumpkin puree and vegetable broth, and simmer for 20 minutes.
    <br>Blend the soup until smooth, then return it to the pot.
    <br>Blend the soup until smooth, then return it to the pot.
    <br>Blend the soup until smooth, then return it to the pot.
    <br>Stir in the heavy cream and season with salt and pepper.
    <br>Heat through and serve.'
WHERE id = 3;
ALTER TABLE recipe ADD COLUMN instructions text;
SELECT a.recipeName, a.instructions, b.ingredientName FROM recipe a INNER JOIN IngredientInRecipe c ON a.id = c.recipeId INNER JOIN ingredient b ON b.id = c.ingredientId WHERE a.recipeName = 'Pumpkin Tartlets';

localhost:3000/fullRecipes/search?recipeName=Pumpkin%20Tartlets

SELECT id, recipeName, instructions FROM recipe ORDER BY RANDOM() LIMIT 1;

SELECT b.ingredientName FROM ingredient b INNER JOIN IngredientInRecipe c ON b.id = c.ingredientId WHERE c.recipeId = $1;

SELECT a.recipeName, b.ingredientName FROM recipe a INNER JOIN IngredientInRecipe c ON a.id = c.recipeId INNER JOIN ingredient b ON b.id = c.ingredientId;

//12. lesson, rke143
SELECT * FROM recipe WHERE recipename = 'Pumpkin Pancakes';

    const data = await db.query('SELECT * FROM recipe WHERE recipename = $1', [
        recipename,
    ]);

{
    "recipename": "Pumpkin Pancakes"
}

{
    "recipename": "Pumpkin Juice"
}

UPDATE recipe SET instructions = 'some instructions'  WHERE recipename='Pumpkin Pancakes';
DELETE FROM recipe WHERE recipename = 'Pumpkin Juice';
SELECT * FROM ingredient WHERE ingredientname = 'all-purpose flour';

lesson 12:
"{
  ""recipe"": ""Pumpkin Pancakes"",
  ""ingredients"": [
    ""all-purpose flour"",
    ""brown sugar"",
    ""baking powder"",
    ""baking soda"",
    ""salt"",
    ""cinnamon"",
    ""nutmeg"",
    ""ginger"",
    ""milk"",
    ""pumpkin puree"",
    ""large egg"",
    ""melted butter"",
    ""vanilla extract"",
    ""Cooking spray or butter for greasing""
  ],
  ""instructions"": ""Whisk dry ingredients in a bowl. \n <br>In a separate bowl, whisk milk, pumpkin, egg, melted butter, and vanilla.<br>Combine wet and dry ingredients; don't overmix. \n <br>Preheat griddle, grease with cooking spray or butter.\n <br>Pour 1/4 cup batter per pancake onto the griddle.\n <br>Cook until bubbles form; flip and cook until golden brown.\n <br>Repeat for remaining batter.\n <br>Serve warm with desired toppings.""
} "

"SELECT * FROM recipe WHERE recipename = $1;"
"INSERT INTO recipe (recipename) VALUES ($1);"
"UPDATE recipe SET instructions = $1 WHERE recipename = $2;"
"DELETE FROM recipe WHERE recipename = $1;"
"SELECT * FROM ingredient WHERE ingredientname = $1;"
"INSERT INTO ingredient (ingredientname) VALUES ($1);"
"DELETE FROM ingredient WHERE ingredientname = $1;"

const data = await db.query('SELECT a.recipeName, b.ingredientName FROM recipe a INNER JOIN IngredientInRecipe c ON a.id = c.recipeId INNER JOIN ingredient b ON b.id = c.ingredientId WHERE a.recipeName = $1 AND b.ingredientName = $2;', [recipename, ingredientname]);
"INSERT INTO ingredientinrecipe (recipeid, ingredientid) SELECT a.id, b.id FROM recipe a JOIN ingredient b ON a.recipeName = $1 AND b.ingredientname = $2;", [recipename, ingredientname]

ALTER TABLE recipe ADD COLUMN imageURL TEXT;
SELECT recipename, imageURL FROM recipe;
UPDATE recipe SET imageURL = 'https://images.pexels.com/photos/18932267/pexels-photo-18932267/free-photo-of-ornamental-pumpkins-and-a-plate-with-baked-pastry.jpeg' WHERE id=1;
UPDATE recipe SET imageURL = 'https://images.pexels.com/photos/4917092/pexels-photo-4917092.jpeg' WHERE id=2;
UPDATE recipe SET imageURL = 'https://images.pexels.com/photos/5605535/pexels-photo-5605535.jpeg' WHERE id=3;
UPDATE recipe SET imageURL = 'https://images.pexels.com/photos/5377574/pexels-photo-5377574.jpeg' WHERE id=4;

PGPASSWORD=8sksNBdYdlKSODhgKgsiDjszEYeUbIx5 psql -h dpg-cs11rli3esus7399nil0-a.oregon-postgres.render.com -U myrecipes_7jlr_user myrecipes_7jlr