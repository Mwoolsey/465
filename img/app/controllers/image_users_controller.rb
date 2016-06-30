class ImageUsersController < ApplicationController
  before_action :set_image_user, only: [:show, :edit, :update, :destroy]

  # GET /image_users
  # GET /image_users.json
  def index
    @image_users = ImageUser.all
  end

  # GET /image_users/1
  # GET /image_users/1.json
  def show
  end

  # GET /image_users/new
  def new
    @image = Image.find params[:image_id]
    @image_user = @image.image_users.new
  end

  # POST /image_users
  # POST /image_users.json
  def create
    @image = Image.find params[:image_id]
    @image_user = @image.image_users.new(image_user_params)
    if @image_user.save
      redirect_to @image, notice: 'Image user was successfully created.'
    else
      render :new 
    end
  end

  # DELETE /image_users/1
  def destroy
    @image_user.destroy
    redirect_to @image_user.image, notice: 'Image user was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_user
      @image_user = ImageUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_user_params
      params.require(:image_user).permit(:image_id, :user_id)
    end
end
