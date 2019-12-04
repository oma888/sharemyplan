class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :notification
  # , except[:index]
  # ci dessous grise mis en comment suite pb merge
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb

    # PB MERGE grise cidessous a suivre...
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :phone_number])
  end

  def notification
    if user_signed_in? && current_user.notifications.unviewed.size.positive?
      flash[:notifications] = "Hey #{current_user.first_name}, tu as #{current_user.notifications.unviewed.count} nouveau co-abonné(s) !"

      current_user.notifications.unviewed.each do |notification|
         notification.unviewed = false
         notification.save
       end

    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
