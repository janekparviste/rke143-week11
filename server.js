const express = require('express');
const recipeRouter = require('./routes/recipes.routes');
const ingredientRouter = require('./routes/ingredients.routes');
const fullRecipesRouter = require('./routes/fullRecipes.routes');
const app = express();

app.use('/ingredients', ingredientRouter);

app.use('/recipes', recipeRouter);

app.use('/fullrecipes', fullRecipesRouter);

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
