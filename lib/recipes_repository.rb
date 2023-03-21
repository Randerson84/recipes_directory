require_relative 'database_connection'
require_relative 'recipe'

class RecipeRepository
    def all
        recipes = []
        sql = 'SELECT id, name, cook_time, rating FROM recipes;'
        result = DatabaseConnection.exec_params(sql, [])
        
        result.each do |record|
            recipe = Recipe.new
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.cook_time = record['cook_time']
            recipe.rating = record['rating']
            recipes << recipe
        end
        return recipes
      end
      def find(id)
        sql = 'SELECT id, name, cook_time, rating FROM recipes WHERE id = $1;'
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)
        
        record = result[0]
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cook_time = record['cook_time']
        recipe.rating = record['rating']
        return recipe
      end
end