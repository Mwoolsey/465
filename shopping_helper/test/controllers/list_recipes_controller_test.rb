require 'test_helper'

class ListRecipesControllerTest < ActionController::TestCase
  setup do
    @list_recipe = list_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_recipe" do
    assert_difference('ListRecipe.count') do
      post :create, list_recipe: { list_id: @list_recipe.list_id, recipe_id: @list_recipe.recipe_id }
    end

    assert_redirected_to list_recipe_path(assigns(:list_recipe))
  end

  test "should show list_recipe" do
    get :show, id: @list_recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_recipe
    assert_response :success
  end

  test "should update list_recipe" do
    patch :update, id: @list_recipe, list_recipe: { list_id: @list_recipe.list_id, recipe_id: @list_recipe.recipe_id }
    assert_redirected_to list_recipe_path(assigns(:list_recipe))
  end

  test "should destroy list_recipe" do
    assert_difference('ListRecipe.count', -1) do
      delete :destroy, id: @list_recipe
    end

    assert_redirected_to list_recipes_path
  end
end
