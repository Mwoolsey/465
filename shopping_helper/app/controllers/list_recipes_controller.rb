class ListRecipesController < ApplicationController
  before_action :set_list_recipe, only: [:show, :edit, :update, :destroy]

  # GET /list_recipes
  # GET /list_recipes.json
  def index
    @list_recipes = ListRecipe.all
  end

  # GET /list_recipes/1
  # GET /list_recipes/1.json
  def show
  end

  # GET /list_recipes/new
  def new
    @list = List.find params[:list_id]
    @list_recipe = ListRecipe.new
  end

  # GET /list_recipes/1/edit
  def edit
  end

  # POST /list_recipes
  # POST /list_recipes.json
  def create
    @list_recipe = ListRecipe.new(list_recipe_params)
    @list_recipe.list_id = current_user.list.id

    respond_to do |format|
      if @list_recipe.save
        format.html { redirect_to list_path(current_user.id), notice: 'List recipe was successfully created.' }
        format.json { render :show, status: :created, location: @list_recipe }
      else
        format.html { render :new }
        format.json { render json: @list_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_recipes/1
  # PATCH/PUT /list_recipes/1.json
  def update
    respond_to do |format|
      if @list_recipe.update(list_recipe_params)
        format.html { redirect_to list_path(current_user.id), notice: 'List recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_recipe }
      else
        format.html { render :edit }
        format.json { render json: @list_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_recipes/1
  # DELETE /list_recipes/1.json
  def destroy
    @list_recipe.destroy
    respond_to do |format|
      format.html { redirect_to list_path(current_user.id), notice: 'List recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_recipe
      @list_recipe = ListRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_recipe_params
      params.require(:list_recipe).permit(:list_id, :recipe_id)
    end
end
