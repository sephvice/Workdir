class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
    @feeds = Feed.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
    @staff = Staff.find(params[:id])
    @staff_feeds = @staff.feeds
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.fetch(:staff, {}).permit(:username, :email, :password, :salt, :encrypted_password)
    end
end
