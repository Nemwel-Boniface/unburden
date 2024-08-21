# frozen_string_literal: true

class Psychologists::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    build_resource(sign_up_params)

    # Convert array to comma-separated string
    if resource.specialization.is_a?(Array)
      resource.specialization = resource.specialization.join(',')
    end

    if resource.save
      if resource.active_for_authentication?
        flash[:notice] = 'Account created successfully. Please sign in to continue.'
        redirect_to new_psychologist_session_path
      else
        expire_data_after_sign_in!
        flash[:alert] = 'Account not active.'
        redirect_to new_psychologist_session_path
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash[:alert] = resource.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, :last_name, :location, :phone_number, :bio, :specialization, :insurance_accepted, :years_of_experience
    ])
  end

  def sign_up_params
    # Ensure we handle the specialization field as an array if it's passed that way
    params = super
    if params[:psychologist] && params[:psychologist][:specialization].is_a?(Array)
      params[:psychologist][:specialization] = params[:psychologist][:specialization].join(',')
    end
    params
  end
end
