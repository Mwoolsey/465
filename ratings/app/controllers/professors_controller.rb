class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show,:edit,:update,:destroy]

  #GET /professors
  def index
    @professors = Professor.all
  end

  #GET /professors/1
  def show
    @rating = @professor.ratings.new
  end

  #GET /professors/new
  def new
    @professor = Professor.new
  end

  #GET /professors/1/edit
  def edit
  end

  #POST /professors
  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      redirect_to @professor, notice: 'Professor was created successfully.'
    else
      render :new
    end
  end

  #PATCH /professors/1
  def update
    if @professor.update(professor_params)
      redirect_to @professor, notice: 'Professor was updated successfully.'
    else
      render :edit
    end
  end

  #DELETE /professors/1
  def destroy
    @professor.destroy
    redirect_to professors_url
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def professor_params
      params.require(:professor).permit(:first,:last,:university)
    end

end
