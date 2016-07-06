class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index 
    # go straight to the list's show page for the current user
    redirect_to list_url(current_user.id)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @recipes = @list.recipes
    @ingredients = []
    used_ingredients = []
    @unique_ingredients = []
    @recipes.each do |recipe| 
      recipe.ingredient_recipes.each do |ir|
	@ingredients << [ir.ingredient.name, ir.quantity, ir.quantity_type]
      end
    end
    
    @ingredients.each do |ingredient|
      offset = nil
      @unique_ingredients.each_index do |x|
	if ingredient[0] == @unique_ingredients[x][0]
	  @unique_ingredients[x][1] += ingredient[1]
	  offset = x
	end
      end

      if offset == nil
        @unique_ingredients << ingredient	
      end
    end
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
