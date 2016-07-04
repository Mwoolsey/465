require 'test_helper'

class IngredientRecipesControllerTest < ActionController::TestCase
  setup do
    @ingredient_recipe = ingredient_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_recipe" do
    assert_difference('IngredientRecipe.count') do
      post :create, ingredient_recipe: { ingredient_id: @ingredient_recipe.ingredient_id, recipe_id: @ingredient_recipe.recipe_id }
    end

    assert_redirected_to ingredient_recipe_path(assigns(:ingredient_recipe))
  end

  test "should show ingredient_recipe" do
    get :show, id: @ingredient_recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_recipe
    assert_response :success
  end

  test "should update ingredient_recipe" do
    patch :update, id: @ingredient_recipe, ingredient_recipe: { ingredient_id: @ingredient_recipe.ingredient_id, recipe_id: @ingredient_recipe.recipe_id }
    assert_redirected_to ingredient_recipe_path(assigns(:ingredient_recipe))
  end

  test "should destroy ingredient_recipe" do
    assert_difference('IngredientRecipe.count', -1) do
      delete :destroy, id: @ingredient_recipe
    end

    assert_redirected_to ingredient_recipes_path
  end
end
