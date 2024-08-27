class Users::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Custom behavior after successful sign-in
  def create
    super do |resource|
      flash[:notice] = "Welcome back, #{resource.first_name}!"
      redirect_to root_path and return
    end
  end

  # Custom behavior after sign out
  def destroy
    super do
      flash[:notice] = 'Logged out successfully.'
      redirect_to root_path and return
    end
  end

  private

  # Customize the permitted parameters for user sessions
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
