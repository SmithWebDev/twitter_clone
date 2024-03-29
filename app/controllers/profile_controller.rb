class ProfileController < ApplicationController
  matestack_app TwitterClone::App

  def edit
    render TwitterClone::Pages::Profile::Edit
  end

  def update
    if profile_params[:username].blank?
      render json: {
        message: 'Profile could not be updated.',
        errors: { username: ["can't be blank!"] }
      }, status: :unprocessable_entity
    else
      cookies[:username] = profile_params[:username]
      render json: {
        message: 'Profile was successfully updated.'
      }, status: :created
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:username)
  end
end
