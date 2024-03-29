class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_filter :set_user
  before_filter :authenticate_user!

  # GET /activities
  # GET /activities.json
  def index
    @user = User.find_by(username: params[:username])
    @activities = @user.activities.sort_by(&:name)
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: { activity: @activity, instances: @activity.instances } }
    end
  end

  # GET /activities/new
  def new
    @activity = @user.activities.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = @user.activities.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to user_activity_url(@activity.user,@activity), notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to user_activity_url(@activity.user,@activity), notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to user_activities_url(@user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:user_id, :name, :private, :tracking_type)
    end
    
    def set_user
      @user = User.find_by(username: params[:username])
    end
end
