class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[cpf])
  end

  def after_sign_in_path_for(resource)
    products_todo_tasks_path
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
