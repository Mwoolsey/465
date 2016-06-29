class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    if user_signed_in?
      @my_images = current_user.images 
      @images_shared_with_me = current_user.image_users.map {|image_user| image_user.image}
    else
      @my_images = nil
      @images_shared_with_me = nil
    end
  end

  # GET /images/1
  def show
    @image_tags = @image.tags
    @tag = @image.tags.new
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
      @image = Image.new(image_params)
      @image.generate_filename  # a function you write to generate a random filename and put it in the images "filename" variable
      @image.user = current_user

      @uploaded_io = params[:image][:uploaded_file]

      File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
      file.write(@uploaded_io.read)
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
      if @image.update(image_params)
        redirect_to @image, notice: 'Image was successfully updated.'
      else
        render :edit 
      end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:private)
    end
end
