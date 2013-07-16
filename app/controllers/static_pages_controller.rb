class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @activities = @user.activities
      render template: 'users/show',
        locals: {
          resource: current_user.username,
          resource_name: 'User'
        }
    end
  end
end
