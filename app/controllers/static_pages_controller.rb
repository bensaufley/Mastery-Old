class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      render template: 'users/show',
        locals: {
          resource: current_user,
          resource_name: 'User'
        }
    end
  end
end
