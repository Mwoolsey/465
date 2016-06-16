class HighScoresController < ApplicationController

  before_action :set_high_score, only: [:show, :edit, :update, :destroy]

  # GET /high_scores
  def index
    @high_scores = HighScore.all
  end

  #GET /high_scores/1
  def show
    set_high_score
  end

  #GET /high_scores/new
  def new
    # create an empty object so the form know about it
    @high_score = HighScore.new
  end

  #POST /high_scores
  def create
    @high_score = HighScore.new(high_score_params)
    if @high_score.save
      redirect_to @high_score, notice: 'High score was created successfully.'
    else
      render :new
    end
  end

  #GET /high_scores/1/edit
  def edit
    set_high_score
  end

  #PATCH
  def update
    set_high_score
    if @high_score.update(high_score_params)
      redirect_to @high_score, notice: 'High score was updated successfully.'
    else
      render :edit
    end
  end

  #DELETE /high_scores/1
  def destroy
    set_high_score
    @high_score.destroy
    redirect_to high_scores_url, notice: 'Score was successfully deleted.'
  end

  private
    def set_high_score
      @high_score = HighScore.find(params[:id])
    end

    def high_score_params
      params.require(:high_score).permit(:user,:game,:score)
    end
end
