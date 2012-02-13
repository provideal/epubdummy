RailsAdmin.config do |config|
  config.main_app_name = ["Cool app", "BackOffice"]
  config.current_user_method { current_user }
  config.authenticate_with { authenticate }
  config.authorize_with do
    render "Access Denied", status: :forbidden unless current_user.is?(:admin)
  end
end