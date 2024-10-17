const allRecipesModel = require('../models/allRecipesModel');

exports.getAllRecipes = async (req, res) => {
    try {
        const allRecipes = await allRecipesModel.getAllRecipesModel();
        res.json(allRecipes);
    } catch (error) {
        res.status(500).json({errorMessage: error})
    }
};
