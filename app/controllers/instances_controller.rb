class InstancesController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /instances
  # GET /instances.json
  def index
    @activity = Activity.find(params[:activity_id])
    respond_to do |format|
      format.html { redirect_to [ @activity.user, @activity ] }
      format.json { render json: @activity.instances }
    end
  end

  # GET /instances/1
  # GET /instances/1.json
  def show
    @activity = @instance.activity
    respond_to do |format|
      format.html { redirect_to [@activity.user, @activity] }
      format.json { render json: @instance }
    end
  end

  # GET /instances/new
  def new
    @activity = Activity.find(params[:activity_id])
    redirect_to [ @activity.user, @activity ]
  end

  # GET /instances/1/edit
  def edit
    @activity = @instance.activity
    @user = @activity.user
  end

  # POST /instances
  # POST /instances.json
  def create
    @instance = Instance.new(instance_params)
    @activity = Activity.find(params[:activity_id])
    @instance.when ||= Time.now

    respond_to do |format|
      if @instance.save
        format.html { redirect_to [@activity.user,@activity], notice: 'Instance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instance }
      else
        format.html { redirect_to [@activity.user,@activity] }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instances/1
  # PATCH/PUT /instances/1.json
  def update

    respond_to do |format|
      if @instance.update(instance_params)
        format.html { redirect_to [@instance.activity.user,@instance.activity], notice: 'Instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
    @activity = @instance.activity
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to [@activity.user,@activity] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params.require(:instance).permit(:activity_id, :when, :till, :private, :till_now)
    end

end
