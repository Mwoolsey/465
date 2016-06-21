class TopicsController < ApplicationController

  # run set_topic method before the methods listed in the array
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  #GET /topics
  def index
    # get a psudo array of all the topics
    @topics = Topic.all
  end

  #GET /topics/1
  def show
    # create an empty reference object to show the reference form on topic page
    @reference = @topic.references.new
  end

  #GET /topics/new
  def new
    # empty topic so that the form knows what to use
    @topic = Topic.new
  end

  #GET /topics/1/edit
  def edit
    # getting info from set_topic method
  end

  #POST /topics
  def create
    # create a new object with the allowed params
    @topic = Topic.new(topic_params)

    # if the save is successfull then show the page, else reload the "new" page
    if @topic.save
      redirect_to @topic, notice: 'Topic successfully created!'
    else
      render :new
    end
  end

  #PATCH/PUT /topics/1
  def update
    # if the update is successful then show the page, else reload the edit page
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic successfully updated!'
    else
      render :new
    end
  end

  #DELETE /topics/1
  def destroy
    @topic.destroy
    redirect_to topics_url
  end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :description)
    end

end
