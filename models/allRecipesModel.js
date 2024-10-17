const db = require('../db');

exports.getAllRecipesModel = async () => {
    try {
        const recipes = await db.query('SELECT * FROM recipe;');

        return recipes.rows;
    } catch (error) {
        throw error;
    }
};
