require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest
	def setuo
		@chef = Chef.create!(chefname: "justin", email: "justin@exampel.com",
							password: "password", password_confirmation: "password")
		@recipe = Recipe.create(name: "vegetable saute", description: "gerat vegetable oil", chef: @chef)
	end

	test "succesfully delete a recipe" do
		get recipe_path(@recipe)
		assert_template 'recipe/show'
		assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
		assert_difference 'Recipe.count', -1 do
			delete recipe_path(@recipe)
		end
		assert_redirected_to recipe_path
		assert_not flash.empty?
	end
end
