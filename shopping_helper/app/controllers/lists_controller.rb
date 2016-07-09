class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index 
    redirect_to list_url(current_user.id)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show

    # load the units file
    load "#{Rails.root}/lib/units.rb"

    # dont let a user look at a different list than their own, and make them sign in again
    if current_user.id != @list.id
      flash[:notice] = 'You do not have access to that, please sign in again'
      sign_out current_user
      redirect_to new_user_session_path
    end
    @recipes = @list.recipes
    @all_recipes = Recipe.all
    @all_ingredients = Ingredient.all
    @recipe_add_list = @recipes.map {|recipe| [recipe.name, recipe.id]}
    @recipe = @list.recipes.new
    @list_recipe = @list.list_recipes.new
    @recipe.ingredient_recipes.new
    @units = units
    @ingredients = []
    used_ingredients = []
    @unique_ingredients = []
    @recipes.each do |recipe| 
      recipe.ingredient_recipes.each do |ir|
	if !ir.new_record?
	  @ingredients << [ir.ingredient.name, ir.quantity, ir.quantity_type, ir.ingredient_id]
	end
      end
    end
    
    @ingredients.each do |ingredient|
      offset = nil
      @unique_ingredients.each_index do |x|
	if ingredient[0] == @unique_ingredients[x][0] && ingredient[2] == @unique_ingredients[x][2]
	  @unique_ingredients[x][1] += ingredient[1]
	  offset = x
	end
      end

      if offset == nil
        @unique_ingredients << ingredient	
      end
    end
    @all_recipes = @all_recipes.map {|recipe| [recipe.name, recipe.id]}
    @all_recipes.sort_by! {|x,y| x} 
    @all_ingredients = @all_ingredients.map {|i| [i.name, i.id]}
    @all_ingredients.sort_by! {|x,y| x}
    @unique_ingredients.sort_by! {|w,x,y,z| w}
#yikes
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id)
    end
end
