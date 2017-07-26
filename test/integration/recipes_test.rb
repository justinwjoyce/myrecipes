require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

	def setuo
		@chef = Chef.create!(chefname: "justin", email: "justin@exampel.com")
		@recipe = Recipe.create(name: "vegetable saute", description: "gerat vegetable oil", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "chicken salad", description: "great chicken dish")
		@recipe2.save
	end

	test "should get recipe index" do
		get recipes_path
		assert_response :success
	end

	test "should get recipe listing" do
		get recipes_path
		assert_template 'recipe/index'
		assert_match @recipe.name, response.body
		assert_match @recipe2.name, response.body
	end
end
