class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to '/'
    else
      @activities = @user.activities
    end
  end
end
