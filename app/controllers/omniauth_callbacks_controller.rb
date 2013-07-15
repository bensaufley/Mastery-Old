class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth = request.env['omniauth.auth']
    user = User.from_omniauth('twitter',auth.uid,auth.info.nickname)
    logger.info user.attributes
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      redirect_to new_user_registration_url, user: user
    end
  end
end