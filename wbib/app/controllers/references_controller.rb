class ReferencesController < ApplicationController

  before_action :set_reference, only: [:edit, :update, :destroy]

  #GET topics/:topic_id/references/new
  def new
    # load the topic object based on the topic_id derived from the url
    @topic = Topic.find(params[:topic_id])
    # create an empty reference in the context of a specific topic
    @reference = @topic.references.new
  end

  #GET /references/1/edit
  def edit
    # getting info from set_reference method
  end

  #POST /topics/:topic_id/references
  def create
    # find the topic that the new reference will be associated with
    @topic = Topic.find(params[:topic_id])
    # create the new reference in the context of a specific topic
    @reference = @topic.references.new(reference_params)

    # if save is successful then show the page, else reload the "new" page
    if @reference.save
      redirect_to topic_url(@topic), notice: 'Reference successfully created!'
    else
      render :new
    end
  end

  #PATCH/PUT /references/1
  def update
    if @reference.update(reference_params)
      redirect_to topic_url(@reference.topic), notice: 'Reference successfully updated!'
    else
      render :edit
    end
  end

  #DELETE /references/1
  def destroy
    @reference.destroy
    redirect_to topic_url(@reference.topic), notice: 'Reference successfully destroyed!'
  end

  private
    def set_reference
      @reference = Reference.find(params[:id])
    end

    def reference_params
      params.require(:reference).permit(:URL)
    end
end
