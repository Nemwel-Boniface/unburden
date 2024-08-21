# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        flash[:notice] = "Signed up successfully! Please log in."
        redirect_to new_user_session_path and return
      else
        flash[:alert] = "There was an issue with your sign up."
      end
    end
  end

  private

  # Strong parameters for user sign up
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :location, :phone_number)
  end

  # Strong parameters for user account update
  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :location, :phone_number)
  end
end
