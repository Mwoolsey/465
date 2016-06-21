class RatingsController < ApplicationController
  before_action :set_rating, only: [:edit,:update,:destroy]

  def new
    @professor = Professor.find params[:professor_id]
    @rating = @professor.ratings.new
  end

  def edit
  end

  def create
    @professor = Professor.find params[:professor_id]
    @rating = @professor.ratings.new(rating_params)

    if @rating.save
      redirect_to professor_url(@professor) , notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  def update  
    if @rating.update(rating_params)
      redirect_to professor_url(@rating.professor), notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rating.destroy
    redirect_to professor_url(@rating.professor) , notice: 'Rating was successfully destroyed.'
  end

  private

    def set_rating
      @rating = Rating.find params[:id]
    end

    def rating_params
      params.require(:rating).permit(:course,:comment,:rating)
    end

end
