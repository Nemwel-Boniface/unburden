class Psychologists::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    build_resource(sign_up_params)

    # Convert array to comma-separated string if it's an array
    resource.specialization = resource.specialization.join(',') if resource.specialization.is_a?(Array)

    if resource.save
      if resource.active_for_authentication?
        flash[:notice] = 'Account created successfully. Please sign in to continue.'
      else
        expire_data_after_sign_in!
        flash[:alert] = 'Account not active.'
      end
      redirect_to new_psychologist_session_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash[:alert] = resource.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[
                                        first_name last_name location phone_number bio specialization insurance_accepted
                                        years_of_experience
                                      ])
  end

  def sign_up_params
    # Use the super method to ensure Devise handles other parameters
    params.require(:psychologist).permit(
      :first_name, :last_name, :location, :phone_number, :bio,
      { specialization: [] }, :insurance_accepted, :years_of_experience, :email, :password, :password_confirmation
    )
  end
end
