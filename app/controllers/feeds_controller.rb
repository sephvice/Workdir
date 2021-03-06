class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = current_staff.feeds
    @feeds = Feed.paginate(page: params[:page])
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feeds = current_staff.feeds
    @comments = Comment.where(feed_id: @feed).order('created_at DESC')
  end

  # GET /feeds/new
  def new
    @feed = current_staff.feeds.build
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    #@feed = Feed.new(feed_params)
    @feed = current_staff.feeds.build(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to staffs_path, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to staffs_path, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to staffs_path, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.fetch(:feed, {}).permit(:content, :staff_id, :page)
    end
end
