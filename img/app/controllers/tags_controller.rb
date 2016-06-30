class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @image = Image.find params[:image_id]
    @tag = @image.tags.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @image = Image.find params[:image_id]
    @tag = @image.tags.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to image_url(@image), notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
      if @tag.update(tag_params)
        redirect_to image_url(@tag.image), notice: 'Tag was successfully updated.' 
      else
        render :edit 
      end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @image = @tag.image
    @tag.destroy
    redirect_to image_url(@image), notice: 'Tag was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:str, :image_id)
    end
end
