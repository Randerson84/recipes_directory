require 'recipes_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
    before(:each) do 
        reset_recipes_table
    end

    it ' Get all books' do
        repo = RecipeRepository.new
        recipes = repo.all

        expect(recipes.length).to eq 2
        expect(recipes[0].id).to eq '1'
        expect(recipes[0].name).to eq 'Soda Bread'
        expect(recipes[0].cook_time).to eq '55'
        expect(recipes[0].rating).to eq '5'

        expect(recipes[1].id).to eq '2'
        expect(recipes[1].name).to eq 'Mac and Cheese'
        expect(recipes[1].cook_time).to eq '40'
        expect(recipes[1].rating).to eq '5'
    end

    it 'Get a single book' do

        repo = RecipeRepository.new
        recipe = repo.find(1)

        expect(recipe.id).to eq '1'
        expect(recipe.name).to eq 'Soda Bread'
        expect(recipe.cook_time).to eq '55'
        expect(recipe.rating).to eq '5'
    end
end