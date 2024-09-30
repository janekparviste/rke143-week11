const express = require('express');
const recipeRouter = require('./routes/recipes.routes');
const ingredientRouter = require('./routes/ingredients.routes');
const app = express();

app.use('/ingredients', ingredientRouter);

app.use('/recipes', recipeRouter);

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
