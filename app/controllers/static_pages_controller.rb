class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @activities = @user.activities
      @feed = @user.feed
      render 'feed'
    end
  end
end
