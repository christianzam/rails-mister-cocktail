# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

# puts "Clean up database... "
# Cocktail.destroy.all
# puts "Database clean THANK YOU"

ingredient_serialized = open(url).read

ingredient = JSON.parse(ingredient_serialized)

ingredient['drinks'].each do |drink|
  ingredient_name = drink['strIngredient1']
  Ingredient.create(name: ingredient_name)
end

# puts "here are all the ingredients"